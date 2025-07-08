#!/bin/bash

# Project: Horizon GraphQL API
# Workflow: Full Integration Test
# Generated: 2025-07-07
# Description: Complete workflow for schema changes and comprehensive testing

set -e  # Exit on any error

PROJECT_NAME="horizon-graphql-api"
CONTAINER_NAME="horizon-graphql-api"
GRAPHQL_URL="http://localhost:8080/graphql"
QUALITY_COMMAND="./gradlew check -x dependencyCheckAnalyze -x dependencyCheckParse -x test"
BUILD_COMMAND="./gradlew clean buildAndRunDockerImage"
SCHEMA_COMMAND="./gradlew clean graphqlCodegen"

log() {
    echo "🔄 [$PROJECT_NAME] $1"
}

error() {
    echo "❌ [$PROJECT_NAME] $1"
    exit 1
}

success() {
    echo "✅ [$PROJECT_NAME] $1"
}

warning() {
    echo "⚠️  [$PROJECT_NAME] $1"
}

# Step 1: Schema regeneration
schema_regen() {
    if [ -f "build.gradle" ] && grep -q "graphqlCodegen" build.gradle; then
        log "Regenerating GraphQL schema..."
        $SCHEMA_COMMAND || error "Schema generation failed"
        success "Schema regenerated"
    else
        warning "No GraphQL codegen found, skipping schema regeneration"
    fi
}

# Step 2: Code quality check
quality_check() {
    log "Running code quality checks (checkstyle, etc.)..."
    $QUALITY_COMMAND || error "Quality checks failed"
    success "Quality checks passed"
}

# Step 3: Docker cleanup
docker_cleanup() {
    log "Checking for existing containers..."
    
    # Check for running containers
    existing=$(docker ps -q --filter "name=$CONTAINER_NAME" 2>/dev/null || true)
    if [ -n "$existing" ]; then
        log "Stopping existing $CONTAINER_NAME containers..."
        docker stop $existing || warning "Failed to stop some containers"
        docker rm $existing || warning "Failed to remove some containers"
        success "Cleaned up existing containers"
    else
        log "No running containers found"
    fi
    
    # Check for stopped containers
    stopped=$(docker ps -aq --filter "name=$CONTAINER_NAME" 2>/dev/null || true)
    if [ -n "$stopped" ]; then
        log "Removing stopped $CONTAINER_NAME containers..."
        docker rm $stopped || warning "Failed to remove some stopped containers"
    fi
}

# Step 4: Build and run
build_and_run() {
    log "Building and running Docker image (this may take a few minutes)..."
    $BUILD_COMMAND || error "Docker build failed"
    success "Docker container started"
}

# Step 5: Wait for startup and show logs
monitor_startup() {
    log "Monitoring container startup..."
    sleep 5
    
    # Get the actual container ID/name
    container_id=$(docker ps -q --filter "name=$CONTAINER_NAME" | head -1)
    if [ -z "$container_id" ]; then
        error "Container not found after startup"
    fi
    
    log "Following container logs (Container ID: $container_id)..."
    
    # Follow logs in background
    docker logs -f "$container_id" &
    LOG_PID=$!
    
    # Wait for service to be ready
    local retries=60  # Increased for slower startup
    log "Waiting for service to be ready at $GRAPHQL_URL..."
    
    while [ $retries -gt 0 ]; do
        if curl -s --connect-timeout 5 "$GRAPHQL_URL" >/dev/null 2>&1; then
            success "Service is ready at $GRAPHQL_URL"
            return 0
        fi
        
        # Check if container is still running
        if ! docker ps -q --filter "id=$container_id" | grep -q .; then
            error "Container stopped unexpectedly"
        fi
        
        if [ $((retries % 10)) -eq 0 ]; then
            log "Still waiting for service... ($retries retries left)"
        fi
        sleep 2
        retries=$((retries - 1))
    done
    
    error "Service failed to start within timeout (2 minutes)"
}

# GraphQL testing helper
test_graphql() {
    local query="$1"
    local variables="$2"
    
    log "Testing GraphQL endpoint..."
    
    local payload='{"query":"'"$query"'"'
    if [ -n "$variables" ]; then
        payload='{"query":"'"$query"'","variables":'"$variables"'}'
    else
        payload='{"query":"'"$query"'"}'
    fi
    
    echo "📤 Sending query: $query"
    if [ -n "$variables" ]; then
        echo "📦 Variables: $variables"
    fi
    
    local response=$(curl -s -X POST \
        -H "Content-Type: application/json" \
        -d "$payload" \
        "$GRAPHQL_URL" || echo "CURL_FAILED")
    
    if [ "$response" = "CURL_FAILED" ]; then
        error "Failed to send GraphQL request"
    fi
    
    echo "📥 Response: $response"
    
    if echo "$response" | grep -q '"errors"'; then
        warning "GraphQL response contains errors"
        return 1
    else
        success "GraphQL request successful"
        return 0
    fi
}

# Main execution
main() {
    log "Starting full integration test workflow for Horizon GraphQL API..."
    echo ""
    
    # Verify we're in the right directory
    if [ ! -f "build.gradle" ]; then
        error "Not in a Gradle project directory. Please run from the horizon-graphql-api root."
    fi
    
    log "Project validation passed"
    echo ""
    
    log "Step 1/5: Schema regeneration"
    schema_regen
    echo ""
    
    log "Step 2/5: Code quality checks"
    quality_check
    echo ""
    
    log "Step 3/5: Docker cleanup"
    docker_cleanup
    echo ""
    
    log "Step 4/5: Build and run Docker image"
    build_and_run
    echo ""
    
    log "Step 5/5: Monitor startup and show logs"
    monitor_startup
    echo ""
    
    success "Full integration test setup complete!"
    echo ""
    log "📍 GraphQL endpoint: $GRAPHQL_URL"
    log "📋 Container logs are being followed (PID: $LOG_PID)"
    log "🧪 Use 'curl -X POST -H \"Content-Type: application/json\" -d '{\"query\":\"...\"}' $GRAPHQL_URL' to test"
    echo ""
    warning "Press Ctrl+C to stop log monitoring (container will keep running)"
    
    # Trap Ctrl+C to clean up log monitoring
    trap 'echo ""; log "Stopping log monitoring..."; kill $LOG_PID 2>/dev/null; success "Log monitoring stopped. Container is still running."; exit 0' INT
    
    # Keep logs visible
    wait $LOG_PID 2>/dev/null || true
}

# Function to show usage
usage() {
    echo "Usage: $0 [test-query] [test-variables]"
    echo ""
    echo "Examples:"
    echo "  $0  # Run full workflow only"
    echo "  $0 'query { __schema { types { name } } }'  # Test with introspection query"
    echo "  $0 'query GetUser(\$id: ID!) { user(id: \$id) { name } }' '{\"id\": \"123\"}'  # Test with variables"
    echo ""
    echo "The script will:"
    echo "  1. Regenerate GraphQL schema"
    echo "  2. Run code quality checks"
    echo "  3. Clean up existing Docker containers"
    echo "  4. Build and run new Docker image"
    echo "  5. Monitor startup and follow logs"
    echo "  6. Optionally test GraphQL endpoint"
}

# Handle command line arguments
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    usage
    exit 0
fi

# Run if executed directly
if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
    main "$@"
    
    # If query provided, test it
    if [ -n "$1" ]; then
        echo ""
        log "Testing provided GraphQL query..."
        test_graphql "$1" "$2"
    fi
fi