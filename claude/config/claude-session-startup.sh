#!/bin/bash

# Claude Session Startup Script
# Automatically runs all self-improvement checks and initialization
# Called at the start of each Claude Code session

echo "🚀 Claude Self-Improvement System Startup"
echo "=========================================="

# Track session start
/Users/obot/.claude/scripts/claude-performance-tracker.sh session_start

# Check if daily size monitoring is needed
echo "📏 Checking CLAUDE.md file sizes..."
current_date=$(date +%Y-%m-%d)
last_check_file="/Users/obot/.claude/last-size-check"

if [ -f "$last_check_file" ]; then
    last_check=$(cat "$last_check_file")
    if [ "$last_check" != "$current_date" ]; then
        echo "📊 Running daily size check..."
        wc -l /Users/obot/.claude/CLAUDE.md /Users/obot/Documents/GitHub/horizon-graphql-api/CLAUDE.md 2>/dev/null || echo "Some files not found"
        echo "$current_date" > "$last_check_file"
    else
        echo "✅ Daily size check already completed today"
    fi
else
    echo "📊 First-time size check..."
    wc -l /Users/obot/.claude/CLAUDE.md /Users/obot/Documents/GitHub/horizon-graphql-api/CLAUDE.md 2>/dev/null || echo "Some files not found"
    echo "$current_date" > "$last_check_file"
fi

# Check if weekly meta-analysis is needed
echo "🧠 Checking meta-analysis schedule..."
last_meta_file="/Users/obot/.claude/last-meta-analysis"

if [ -f "$last_meta_file" ]; then
    last_meta=$(cat "$last_meta_file")
    # Simple check - if different date, might need analysis
    if [ "$last_meta" != "$current_date" ]; then
        echo "⏰ Meta-analysis may be due (last: $last_meta)"
        echo "   Run: /Users/obot/.claude/scripts/claude-meta-analysis.sh"
    else
        echo "✅ Meta-analysis completed today"
    fi
else
    echo "🆕 No previous meta-analysis found"
    echo "   Consider running: /Users/obot/.claude/scripts/claude-meta-analysis.sh"
fi

# Check research scan schedule
echo "🔬 Checking research scan schedule..."
last_research_file="/Users/obot/.claude/last-research-scan"

if [ -f "$last_research_file" ]; then
    last_research=$(cat "$last_research_file")
    if [ "$last_research" != "$current_date" ]; then
        # Check if it's Monday (research day)
        day_of_week=$(date +%u)
        if [ "$day_of_week" -eq 1 ]; then
            echo "📅 Monday research scan due"
            echo "   Run: /Users/obot/.claude/scripts/claude-research-scan.sh"
        else
            echo "✅ Research scan scheduled for next Monday"
        fi
    else
        echo "✅ Research scan completed today"
    fi
else
    echo "🆕 No previous research scan found"
    echo "   Consider running: /Users/obot/.claude/scripts/claude-research-scan.sh"
fi

# Load available capabilities
echo "🛠️  Available Self-Improvement Tools:"
echo "   📊 Meta-analysis: /Users/obot/.claude/scripts/claude-meta-analysis.sh"
echo "   ✅ Verification: /Users/obot/.claude/scripts/automated-verification-checklist.sh"
echo "   🔬 Research: /Users/obot/.claude/scripts/claude-research-scan.sh"
echo "   📈 Performance: /Users/obot/.claude/scripts/claude-performance-tracker.sh"

# Check CLAUDE.md accessibility
echo "📚 Checking methodology access..."
if [ -f "/Users/obot/.claude/CLAUDE.md" ]; then
    learning_count=$(grep -c "### \[.*\] -" /Users/obot/.claude/CLAUDE.md)
    echo "✅ Global CLAUDE.md accessible ($learning_count learnings)"
else
    echo "❌ Global CLAUDE.md not found"
fi

if [ -f "./CLAUDE.md" ]; then
    echo "✅ Project CLAUDE.md accessible"
else
    echo "ℹ️  No project-specific CLAUDE.md found"
fi

echo ""
echo "🎯 Claude is now ready with enhanced self-improvement capabilities!"
echo "✨ All patterns, learnings, and verification protocols are active."
echo ""