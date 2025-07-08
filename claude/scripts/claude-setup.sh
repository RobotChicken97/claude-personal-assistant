#!/bin/bash

# Claude-Specific Setup Script
# Sets up Claude with methodology and automation

CLAUDE_LOCAL_DIR="/Users/obot/.claude"
REPO_DIR="$(pwd)"

echo "🤖 Setting up Claude AI System"
echo "=============================="

# Create Claude directory structure
mkdir -p "$CLAUDE_LOCAL_DIR"/{scripts,performance-reviews,learning-data,backup-queue}

# Copy Claude configuration
cp -r "$REPO_DIR/claude/config/"* "$CLAUDE_LOCAL_DIR/"
cp -r "$REPO_DIR/claude/scripts/"* "$CLAUDE_LOCAL_DIR/scripts/"
cp -r "$REPO_DIR/claude/learning-data/"* "$CLAUDE_LOCAL_DIR/learning-data/" 2>/dev/null || true
cp -r "$REPO_DIR/claude/performance-reviews/"* "$CLAUDE_LOCAL_DIR/performance-reviews/" 2>/dev/null || true

# Copy global knowledge to Claude directory for reference
mkdir -p "$CLAUDE_LOCAL_DIR/global-knowledge"
cp -r "$REPO_DIR/global-ai/"* "$CLAUDE_LOCAL_DIR/global-knowledge/"

# Make scripts executable
chmod +x "$CLAUDE_LOCAL_DIR/scripts/"*.sh

# Set up automation (crontab)
if [ -f "$CLAUDE_LOCAL_DIR/scripts/claude-session-startup.sh" ]; then
    echo "Setting up automation..."
    # Add crontab entries for Claude automation
    # (Implementation would depend on existing automation setup)
fi

echo "✅ Claude setup complete!"
echo "📁 Configuration: $CLAUDE_LOCAL_DIR"
echo "📚 Global knowledge: $CLAUDE_LOCAL_DIR/global-knowledge"
echo "🔧 Scripts: $CLAUDE_LOCAL_DIR/scripts"

