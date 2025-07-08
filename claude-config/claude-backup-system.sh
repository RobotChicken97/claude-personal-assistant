#!/bin/bash

# Claude Personal Assistant Backup System
# Comprehensive backup and restoration for Claude setup
# Enables seamless transfer to new Claude instances

set -e

CLAUDE_DIR="/Users/obot/.claude"
BACKUP_DIR="$CLAUDE_DIR/backup-staging"
CONFIG_FILE="$CLAUDE_DIR/backup-config.json"

# Configuration
REPO_NAME="claude-personal-assistant"
COMMIT_MESSAGE_PREFIX="🤖 Claude Auto-Backup:"

# Initialize backup configuration
init_backup_config() {
    if [ ! -f "$CONFIG_FILE" ]; then
        cat > "$CONFIG_FILE" << 'EOF'
{
  "github": {
    "username": "",
    "token": "",
    "repo_name": "claude-personal-assistant"
  },
  "backup": {
    "auto_commit": true,
    "backup_frequency": "daily",
    "last_backup": "",
    "exclude_patterns": [
      "*.log",
      "session-*.json",
      ".DS_Store",
      "*.tmp"
    ]
  },
  "sync": {
    "include_performance_data": true,
    "include_learning_data": true,
    "include_session_data": false
  }
}
EOF
        echo "📝 Backup configuration created at: $CONFIG_FILE"
        echo "⚠️  Please update with your GitHub credentials using: $0 config"
        return 1
    fi
    return 0
}

# Configure GitHub credentials
configure_github() {
    echo "🔐 GitHub Configuration Setup"
    echo "=============================="
    echo ""
    
    read -p "GitHub username: " github_username
    echo ""
    echo "🔑 GitHub Personal Access Token Required"
    echo "   Permissions needed: repo (full repository access)"
    echo "   Create at: https://github.com/settings/tokens"
    echo ""
    read -s -p "GitHub token: " github_token
    echo ""
    
    # Update config file (would use jq in production)
    # For now, simple replacement
    sed -i.bak "s/\"username\": \"\"/\"username\": \"$github_username\"/" "$CONFIG_FILE"
    sed -i.bak "s/\"token\": \"\"/\"token\": \"$github_token\"/" "$CONFIG_FILE"
    
    echo "✅ GitHub configuration saved"
    echo "⚠️  Token stored locally - keep this secure!"
}

# Create backup staging area
prepare_backup_staging() {
    echo "📦 Preparing backup staging area..."
    
    rm -rf "$BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    
    # Create repository structure
    mkdir -p "$BACKUP_DIR/"{claude-config,performance-reviews,learning-data,session-data,docs,scripts}
    
    echo "✅ Staging area prepared"
}

# Backup Claude configuration
backup_claude_config() {
    echo "📋 Backing up Claude configuration..."
    
    # Main CLAUDE.md
    if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
        cp "$CLAUDE_DIR/CLAUDE.md" "$BACKUP_DIR/claude-config/"
    fi
    
    # Scripts directory
    if [ -d "$CLAUDE_DIR/scripts" ]; then
        cp -r "$CLAUDE_DIR/scripts/" "$BACKUP_DIR/claude-config/"
    fi
    
    # Backup configuration (without sensitive data)
    if [ -f "$CONFIG_FILE" ]; then
        # Remove token for public backup
        cat "$CONFIG_FILE" | sed 's/"token": "[^"]*"/"token": "REDACTED"/' > "$BACKUP_DIR/claude-config/backup-config-template.json"
    fi
    
    echo "✅ Claude configuration backed up"
}

# Backup performance review data
backup_performance_data() {
    echo "📊 Backing up performance review data..."
    
    if [ -d "$CLAUDE_DIR/performance-reviews" ]; then
        cp -r "$CLAUDE_DIR/performance-reviews/"* "$BACKUP_DIR/performance-reviews/" 2>/dev/null || true
    fi
    
    echo "✅ Performance data backed up"
}

# Backup learning data
backup_learning_data() {
    echo "🧠 Backing up learning and meta-analysis data..."
    
    # Meta-analysis results
    find "$CLAUDE_DIR" -name "meta-analysis-*.md" -exec cp {} "$BACKUP_DIR/learning-data/" \; 2>/dev/null || true
    
    # Research logs
    find "$CLAUDE_DIR" -name "research-log-*.md" -exec cp {} "$BACKUP_DIR/learning-data/" \; 2>/dev/null || true
    
    # Achievement logs
    if [ -f "$CLAUDE_DIR/daily-achievements.log" ]; then
        cp "$CLAUDE_DIR/daily-achievements.log" "$BACKUP_DIR/learning-data/"
    fi
    
    echo "✅ Learning data backed up"
}

# Create setup documentation
create_setup_docs() {
    echo "📚 Creating setup documentation..."
    
    cat > "$BACKUP_DIR/README.md" << 'EOF'
# Claude Personal Assistant Backup

This repository contains a complete backup of Claude's personal assistant setup, including:

- 🧠 Learning methodology and patterns
- 📊 Performance tracking system
- 🔧 Automation scripts and workflows
- 📈 Achievement and CV data

## Quick Setup for New Claude Instance

```bash
# 1. Clone this repository
git clone https://github.com/YOUR_USERNAME/claude-personal-assistant.git
cd claude-personal-assistant

# 2. Run automated setup
chmod +x setup.sh
./setup.sh

# 3. Configure your GitHub credentials
./scripts/backup-restore.sh config
```

## What Gets Restored

### ✅ Automated Setup
- Complete CLAUDE.md methodology
- All automation scripts
- Crontab scheduling
- Performance tracking system
- Learning frameworks

### ✅ Knowledge Transfer
- Previous learning patterns
- Performance achievements
- Professional development data
- Methodology improvements

### ✅ Continuity
- Same verification protocols
- Established patterns and conventions
- Error prevention mechanisms
- Self-improvement capabilities

## Manual Steps After Setup

1. Update backup configuration with your GitHub token
2. Review and customize automation schedules
3. Verify all scripts have proper permissions
4. Test the backup system with a manual backup

## Files Structure

```
claude-config/          # Core Claude methodology and scripts
performance-reviews/    # Achievement tracking and CV data
learning-data/         # Meta-analysis and research logs
docs/                  # Documentation and guides
setup.sh              # Automated setup script
```

## Maintenance

The backup system runs automatically via cron:
- Daily: Check for changes and backup if needed
- Weekly: Full backup verification
- Monthly: Cleanup and optimization

Your Claude instance will continue learning and improving from where the previous one left off!
EOF

    cat > "$BACKUP_DIR/setup.sh" << 'EOF'
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
EOF

    chmod +x "$BACKUP_DIR/setup.sh"
    
    echo "✅ Setup documentation created"
}

# Initialize or update Git repository
setup_git_repo() {
    local github_username="$1"
    local github_token="$2"
    
    echo "📡 Setting up Git repository..."
    
    cd "$BACKUP_DIR"
    
    # Initialize git if needed
    if [ ! -d ".git" ]; then
        git init
        git branch -M main
    fi
    
    # Configure git for automation
    git config user.name "Claude Assistant"
    git config user.email "claude@assistant.local"
    
    # Add all files
    git add .
    
    # Create .gitignore
    cat > .gitignore << 'EOF'
# Sensitive files
backup-config.json
*.token
*.key

# Temporary files
*.tmp
*.log
.DS_Store

# Session data (optional - can be excluded)
session-*.json
EOF

    git add .gitignore
    
    # Check if we need to create remote repository
    if ! git remote get-url origin >/dev/null 2>&1; then
        echo "🌐 Setting up GitHub repository..."
        
        # Create repository using GitHub API
        curl -u "$github_username:$github_token" \
             -X POST \
             -H "Accept: application/vnd.github.v3+json" \
             https://api.github.com/user/repos \
             -d "{\"name\":\"$REPO_NAME\",\"description\":\"Claude Personal Assistant Backup and Setup\",\"private\":false}" \
             >/dev/null 2>&1 || echo "⚠️  Repository might already exist"
        
        # Add remote
        git remote add origin "https://$github_username:$github_token@github.com/$github_username/$REPO_NAME.git"
    fi
    
    echo "✅ Git repository configured"
}

# Commit and push changes
commit_and_push() {
    local message="$1"
    local github_username="$2"
    local github_token="$3"
    
    cd "$BACKUP_DIR"
    
    # Check for changes
    if git diff --quiet && git diff --staged --quiet; then
        echo "ℹ️  No changes to backup"
        return 0
    fi
    
    echo "📤 Committing and pushing changes..."
    
    # Commit changes
    git add .
    git commit -m "$COMMIT_MESSAGE_PREFIX $message - $(date '+%Y-%m-%d %H:%M')"
    
    # Push to GitHub
    git push -u origin main
    
    echo "✅ Backup pushed to GitHub"
}

# Full backup process
perform_full_backup() {
    echo "🔄 Starting full backup process..."
    
    if ! init_backup_config; then
        echo "❌ Backup not configured. Run: $0 config"
        exit 1
    fi
    
    # Read configuration (simplified - would use jq in production)
    github_username=$(grep '"username"' "$CONFIG_FILE" | cut -d'"' -f4)
    github_token=$(grep '"token"' "$CONFIG_FILE" | cut -d'"' -f4)
    
    if [ -z "$github_username" ] || [ -z "$github_token" ] || [ "$github_token" = "" ]; then
        echo "❌ GitHub credentials not configured. Run: $0 config"
        exit 1
    fi
    
    prepare_backup_staging
    backup_claude_config
    backup_performance_data
    backup_learning_data
    create_setup_docs
    setup_git_repo "$github_username" "$github_token"
    commit_and_push "Automated backup" "$github_username" "$github_token"
    
    # Update last backup time
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ)" > "$CLAUDE_DIR/last-backup-time"
    
    echo ""
    echo "🎉 Backup Complete!"
    echo "=================="
    echo "📍 Repository: https://github.com/$github_username/$REPO_NAME"
    echo "📋 Setup URL: https://github.com/$github_username/$REPO_NAME#quick-setup-for-new-claude-instance"
    echo ""
}

# Check for changes and backup if needed
check_and_backup() {
    echo "🔍 Checking for changes..."
    
    # Simple change detection based on file modification times
    last_backup_file="$CLAUDE_DIR/last-backup-time"
    
    if [ ! -f "$last_backup_file" ]; then
        echo "📅 No previous backup found - performing full backup"
        perform_full_backup
        return
    fi
    
    last_backup=$(cat "$last_backup_file")
    
    # Check for files modified since last backup
    modified_files=$(find "$CLAUDE_DIR" -name "*.md" -o -name "*.sh" -o -name "*.json" -newer "$last_backup_file" 2>/dev/null | wc -l)
    
    if [ "$modified_files" -gt 0 ]; then
        echo "📝 Found $modified_files modified files - backing up"
        perform_full_backup
    else
        echo "✅ No changes detected since last backup ($last_backup)"
    fi
}

# Command interface
case "$1" in
    "init")
        init_backup_config
        echo "🎯 Next step: Run '$0 config' to setup GitHub credentials"
        ;;
    "config")
        init_backup_config || true
        configure_github
        ;;
    "backup")
        perform_full_backup
        ;;
    "check")
        check_and_backup
        ;;
    "status")
        if [ -f "$CONFIG_FILE" ]; then
            github_username=$(grep '"username"' "$CONFIG_FILE" | cut -d'"' -f4)
            if [ -n "$github_username" ]; then
                echo "📊 Backup Status:"
                echo "   GitHub: $github_username/$REPO_NAME"
                if [ -f "$CLAUDE_DIR/last-backup-time" ]; then
                    echo "   Last backup: $(cat "$CLAUDE_DIR/last-backup-time")"
                else
                    echo "   Last backup: Never"
                fi
            else
                echo "⚠️  Backup not configured"
            fi
        else
            echo "❌ Backup system not initialized"
        fi
        ;;
    *)
        echo "Claude Personal Assistant Backup System"
        echo "Usage: $0 {init|config|backup|check|status}"
        echo ""
        echo "Commands:"
        echo "  init    - Initialize backup configuration"
        echo "  config  - Configure GitHub credentials"
        echo "  backup  - Perform full backup"
        echo "  check   - Check for changes and backup if needed"
        echo "  status  - Show backup status"
        echo ""
        echo "Setup Process:"
        echo "1. $0 init"
        echo "2. $0 config  (provide GitHub username and token)"
        echo "3. $0 backup  (perform initial backup)"
        echo ""
        ;;
esac