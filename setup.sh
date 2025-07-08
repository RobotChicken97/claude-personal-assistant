#!/bin/bash

# Claude Personal Assistant Setup Script
# Automatically restores complete Claude setup from backup

set -e

echo "🚀 Claude Personal Assistant Setup"
echo "================================="
echo ""

CLAUDE_DIR="/Users/obot/.claude"
REPO_DIR="$(pwd)"

# Create Claude directory structure
echo "📁 Creating Claude directory structure..."
mkdir -p "$CLAUDE_DIR"/{scripts,performance-reviews,learning-data}

# Restore Claude configuration
echo "📋 Restoring Claude configuration..."
if [ -d "$REPO_DIR/claude-config" ]; then
    cp -r "$REPO_DIR/claude-config/"* "$CLAUDE_DIR/"
fi

# Restore performance data
echo "📊 Restoring performance tracking..."
if [ -d "$REPO_DIR/performance-reviews" ]; then
    cp -r "$REPO_DIR/performance-reviews/"* "$CLAUDE_DIR/performance-reviews/"
fi

# Restore learning data
echo "🧠 Restoring learning data..."
if [ -d "$REPO_DIR/learning-data" ]; then
    cp -r "$REPO_DIR/learning-data/"* "$CLAUDE_DIR/learning-data/"
fi

# Make scripts executable
echo "🔧 Setting up script permissions..."
chmod +x "$CLAUDE_DIR/scripts/"*.sh

# Setup crontab if it doesn't exist
if ! crontab -l >/dev/null 2>&1; then
    echo "⏰ Setting up automation schedule..."
    if [ -f "$CLAUDE_DIR/scripts/claude-session-startup.sh" ]; then
        # Create basic crontab from backup
        cat > /tmp/claude_restored_crontab.txt << 'CRON_EOF'
# Claude Self-Improvement Automation - Restored
0 9 * * * /Users/obot/.claude/scripts/claude-session-startup.sh >/dev/null 2>&1
0 10 * * 1 /Users/obot/.claude/scripts/claude-meta-analysis.sh
0 11 * * 1 /Users/obot/.claude/scripts/claude-research-scan.sh
0 17 * * 5 /Users/obot/.claude/scripts/performance-review-tracker.sh summary
CRON_EOF
        crontab /tmp/claude_restored_crontab.txt
        rm /tmp/claude_restored_crontab.txt
        echo "✅ Automation schedule restored"
    fi
fi

# Initialize backup system
echo "💾 Initializing backup system..."
if [ -f "$CLAUDE_DIR/scripts/claude-backup-system.sh" ]; then
    "$CLAUDE_DIR/scripts/claude-backup-system.sh" init
fi

echo ""
echo "🎉 Setup Complete!"
echo "=================="
echo ""
echo "✅ Claude methodology restored"
echo "✅ Automation scripts active"
echo "✅ Performance tracking ready"
echo "✅ Learning data available"
echo ""
echo "📝 Next Steps:"
echo "1. Configure GitHub backup: $CLAUDE_DIR/scripts/claude-backup-system.sh config"
echo "2. Test systems: $CLAUDE_DIR/scripts/claude-session-startup.sh"
echo "3. Review automation: crontab -l"
echo ""
echo "Your Claude instance now has complete continuity with previous knowledge!"
