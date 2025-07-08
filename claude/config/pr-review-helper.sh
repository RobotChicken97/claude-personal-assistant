#!/bin/bash

# PR Review Helper Script
# Automates common checks for PR reviews

PR_URL="$1"
PROJECT_DIR="$2"

if [ -z "$PR_URL" ]; then
    echo "Usage: $0 <PR_URL> [project_directory]"
    echo "Example: $0 https://github.com/user/repo/pull/123 /path/to/project"
    exit 1
fi

if [ -n "$PROJECT_DIR" ]; then
    cd "$PROJECT_DIR" || exit 1
fi

log() {
    echo "🔍 [PR Review] $1"
}

error() {
    echo "❌ [PR Review] $1"
}

success() {
    echo "✅ [PR Review] $1"
}

# Extract PR info
PR_NUMBER=$(echo "$PR_URL" | grep -o '[0-9]*$')
REPO_INFO=$(echo "$PR_URL" | sed 's|https://github.com/||' | sed 's|/pull/.*||')

log "Analyzing PR #$PR_NUMBER from $REPO_INFO"

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    error "Not in a git repository"
    exit 1
fi

# Get PR information using GitHub CLI
if command -v gh > /dev/null 2>&1; then
    log "Fetching PR details..."
    gh pr view "$PR_NUMBER" --json title,body,additions,deletions,changedFiles,headRefName,baseRefName > /tmp/pr_info.json
    
    if [ $? -eq 0 ]; then
        PR_TITLE=$(cat /tmp/pr_info.json | jq -r '.title')
        PR_BODY=$(cat /tmp/pr_info.json | jq -r '.body')
        ADDITIONS=$(cat /tmp/pr_info.json | jq -r '.additions')
        DELETIONS=$(cat /tmp/pr_info.json | jq -r '.deletions')
        CHANGED_FILES=$(cat /tmp/pr_info.json | jq -r '.changedFiles')
        HEAD_BRANCH=$(cat /tmp/pr_info.json | jq -r '.headRefName')
        BASE_BRANCH=$(cat /tmp/pr_info.json | jq -r '.baseRefName')
        
        log "PR: $PR_TITLE"
        log "Branch: $HEAD_BRANCH -> $BASE_BRANCH"
        log "Changes: +$ADDITIONS -$DELETIONS lines, $CHANGED_FILES files"
    else
        error "Failed to fetch PR information"
        exit 1
    fi
else
    error "GitHub CLI (gh) not installed. Install it for better PR analysis."
    exit 1
fi

# Check for project-specific review configuration
if [ -f "CLAUDE.md" ]; then
    log "Found project-specific review configuration"
    
    # Extract build/test commands from CLAUDE.md
    BUILD_CMD=$(grep "Build Command" CLAUDE.md | sed 's/.*: `\(.*\)`.*/\1/' | head -1)
    TEST_CMD=$(grep "Test Command" CLAUDE.md | sed 's/.*: `\(.*\)`.*/\1/' | head -1)
    LINT_CMD=$(grep "Lint Command" CLAUDE.md | sed 's/.*: `\(.*\)`.*/\1/' | head -1)
    SCHEMA_CMD=$(grep "Schema Command" CLAUDE.md | sed 's/.*: `\(.*\)`.*/\1/' | head -1)
    
    log "Configured commands found:"
    [ -n "$BUILD_CMD" ] && log "  Build: $BUILD_CMD"
    [ -n "$TEST_CMD" ] && log "  Test: $TEST_CMD"
    [ -n "$LINT_CMD" ] && log "  Lint: $LINT_CMD"
    [ -n "$SCHEMA_CMD" ] && log "  Schema: $SCHEMA_CMD"
else
    log "No project-specific review configuration found"
fi

# Get changed files
log "Analyzing changed files..."
gh pr diff "$PR_NUMBER" --name-only > /tmp/changed_files.txt

# Categorize files
JAVA_FILES=$(grep '\.java$' /tmp/changed_files.txt || true)
TEST_FILES=$(grep 'Test\.java$' /tmp/changed_files.txt || true)
SCHEMA_FILES=$(grep '\.graphql$\|\.graphqls$' /tmp/changed_files.txt || true)
CONFIG_FILES=$(grep 'application\.\|\.properties$\|\.yml$\|\.yaml$' /tmp/changed_files.txt || true)

# Analysis summary
echo ""
echo "📊 PR Analysis Summary"
echo "======================"
echo "Title: $PR_TITLE"
echo "Files changed: $CHANGED_FILES"
echo "Lines: +$ADDITIONS -$DELETIONS"
echo ""

if [ -n "$JAVA_FILES" ]; then
    echo "📝 Java files changed:"
    echo "$JAVA_FILES" | sed 's/^/  - /'
    echo ""
fi

if [ -n "$TEST_FILES" ]; then
    echo "🧪 Test files changed:"
    echo "$TEST_FILES" | sed 's/^/  - /'
    echo ""
fi

if [ -n "$SCHEMA_FILES" ]; then
    echo "📋 GraphQL schema files changed:"
    echo "$SCHEMA_FILES" | sed 's/^/  - /'
    echo ""
    if [ -n "$SCHEMA_CMD" ]; then
        echo "⚠️  Schema changes detected. Consider running: $SCHEMA_CMD"
    fi
fi

if [ -n "$CONFIG_FILES" ]; then
    echo "⚙️  Configuration files changed:"
    echo "$CONFIG_FILES" | sed 's/^/  - /'
    echo ""
fi

# Suggested checks
echo "🔍 Suggested Review Checks:"
echo "=========================="

if [ -n "$JAVA_FILES" ]; then
    echo "□ Code style and conventions"
    echo "□ Error handling patterns"
    echo "□ Performance implications"
    echo "□ Security considerations"
fi

if [ -n "$TEST_FILES" ]; then
    echo "□ Test coverage adequacy"
    echo "□ Test assertion quality"
    echo "□ Happy path and error scenarios"
fi

if [ -n "$SCHEMA_FILES" ]; then
    echo "□ Backward compatibility"
    echo "□ Resolver implementations"
    echo "□ Schema generation needed"
fi

echo "□ Documentation completeness"
echo "□ Breaking change assessment"

# Automated checks section
echo ""
echo "🤖 Automated Checks Available:"
echo "=============================="

if [ -n "$BUILD_CMD" ]; then
    echo "□ Build: $BUILD_CMD"
fi

if [ -n "$TEST_CMD" ]; then
    echo "□ Tests: $TEST_CMD"
fi

if [ -n "$LINT_CMD" ]; then
    echo "□ Lint: $LINT_CMD"
fi

echo ""
log "PR review helper analysis complete"
log "Use this information to guide Claude's detailed review"

# Save analysis for Claude to read
cat > /tmp/pr_analysis.md << EOF
# PR Review Analysis

## PR Information
- **Title**: $PR_TITLE
- **Number**: #$PR_NUMBER
- **Branch**: $HEAD_BRANCH -> $BASE_BRANCH
- **Changes**: +$ADDITIONS -$DELETIONS lines, $CHANGED_FILES files

## Changed Files Analysis
$(if [ -n "$JAVA_FILES" ]; then echo "### Java Files"; echo "$JAVA_FILES" | sed 's/^/- /'; echo ""; fi)
$(if [ -n "$TEST_FILES" ]; then echo "### Test Files"; echo "$TEST_FILES" | sed 's/^/- /'; echo ""; fi)
$(if [ -n "$SCHEMA_FILES" ]; then echo "### Schema Files"; echo "$SCHEMA_FILES" | sed 's/^/- /'; echo ""; fi)
$(if [ -n "$CONFIG_FILES" ]; then echo "### Config Files"; echo "$CONFIG_FILES" | sed 's/^/- /'; echo ""; fi)

## Available Commands
$(if [ -n "$BUILD_CMD" ]; then echo "- **Build**: \`$BUILD_CMD\`"; fi)
$(if [ -n "$TEST_CMD" ]; then echo "- **Test**: \`$TEST_CMD\`"; fi)
$(if [ -n "$LINT_CMD" ]; then echo "- **Lint**: \`$LINT_CMD\`"; fi)
$(if [ -n "$SCHEMA_CMD" ]; then echo "- **Schema**: \`$SCHEMA_CMD\`"; fi)

## Review Focus Areas
$(if [ -n "$JAVA_FILES" ]; then echo "- Code quality and conventions"; fi)
$(if [ -n "$TEST_FILES" ]; then echo "- Test coverage and quality"; fi)
$(if [ -n "$SCHEMA_FILES" ]; then echo "- Schema compatibility and generation"; fi)
- Security and performance
- Documentation completeness
EOF

success "Analysis saved to /tmp/pr_analysis.md"
echo ""
echo "📋 Next steps:"
echo "1. Claude should read /tmp/pr_analysis.md for context"
echo "2. Claude should read project CLAUDE.md for specific conventions"
echo "3. Claude should analyze the actual PR diff and provide detailed review"

# Cleanup
rm -f /tmp/pr_info.json /tmp/changed_files.txt