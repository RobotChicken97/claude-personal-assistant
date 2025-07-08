#!/bin/bash

# ChatGPT-Specific Setup Script
# Sets up ChatGPT with shared knowledge and templates

CHATGPT_LOCAL_DIR="/Users/obot/.chatgpt"
REPO_DIR="$(pwd)"

echo "💬 Setting up ChatGPT AI System"
echo "==============================="

# Create ChatGPT directory structure
mkdir -p "$CHATGPT_LOCAL_DIR"/{config,conversation-data,templates}

# Copy global knowledge
mkdir -p "$CHATGPT_LOCAL_DIR/global-knowledge"
cp -r "$REPO_DIR/global-ai/"* "$CHATGPT_LOCAL_DIR/global-knowledge/"

# Copy ChatGPT-specific configuration
cp -r "$REPO_DIR/chatgpt/config/"* "$CHATGPT_LOCAL_DIR/config/" 2>/dev/null || true

echo "✅ ChatGPT setup complete!"
echo "📁 Configuration: $CHATGPT_LOCAL_DIR"
echo "📚 Global knowledge: $CHATGPT_LOCAL_DIR/global-knowledge"

