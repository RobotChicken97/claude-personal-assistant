#!/bin/bash

# Grok-Specific Setup Script
# Sets up Grok with analysis patterns and knowledge base

GROK_LOCAL_DIR="/Users/obot/.grok"
REPO_DIR="$(pwd)"

echo "🚀 Setting up Grok AI System"
echo "============================"

# Create Grok directory structure
mkdir -p "$GROK_LOCAL_DIR"/{config,analysis-data,patterns}

# Copy global knowledge
mkdir -p "$GROK_LOCAL_DIR/global-knowledge"
cp -r "$REPO_DIR/global-ai/"* "$GROK_LOCAL_DIR/global-knowledge/"

# Copy Grok-specific configuration
cp -r "$REPO_DIR/grok/config/"* "$GROK_LOCAL_DIR/config/" 2>/dev/null || true

echo "✅ Grok setup complete!"
echo "📁 Configuration: $GROK_LOCAL_DIR"
echo "📚 Global knowledge: $GROK_LOCAL_DIR/global-knowledge"

