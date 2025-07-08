#!/bin/bash

# Claude Performance Tracking Script
# Tracks metrics for self-improvement analysis
# Part of Advanced Self-Improvement Framework

PERFORMANCE_LOG="/Users/obot/.claude/performance-metrics.json"
SESSION_LOG="/Users/obot/.claude/session-$(date +%Y-%m-%d-%H%M).json"

# Initialize performance log if it doesn't exist
if [ ! -f "$PERFORMANCE_LOG" ]; then
    cat > "$PERFORMANCE_LOG" << 'EOF'
{
  "tracking_started": "",
  "total_sessions": 0,
  "learning_entries": 0,
  "contradiction_count": 0,
  "successful_patterns": 0,
  "methodology_updates": 0,
  "last_meta_analysis": "",
  "file_sizes": {
    "global_claude_md": 0,
    "project_claude_md": 0
  },
  "improvement_metrics": {
    "verification_usage": 0,
    "pattern_applications": 0,
    "research_integrations": 0
  }
}
EOF
fi

# Update session metrics
update_metrics() {
    local action="$1"
    local value="$2"
    
    case "$action" in
        "session_start")
            # Count current learning entries
            learning_count=$(grep -c "### \[.*\] -" /Users/obot/.claude/CLAUDE.md 2>/dev/null || echo 0)
            contradiction_count=$(grep -c "Contradiction Found" /Users/obot/.claude/CLAUDE.md 2>/dev/null || echo 0)
            methodology_count=$(grep -c "Methodology Impact" /Users/obot/.claude/CLAUDE.md 2>/dev/null || echo 0)
            
            # Get file sizes
            global_size=$(wc -l < /Users/obot/.claude/CLAUDE.md 2>/dev/null || echo 0)
            project_size=0
            if [ -f "./CLAUDE.md" ]; then
                project_size=$(wc -l < ./CLAUDE.md)
            fi
            
            # Create session start log
            cat > "$SESSION_LOG" << EOF
{
  "session_start": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "learning_entries_start": $learning_count,
  "contradiction_count_start": $contradiction_count,
  "methodology_updates_start": $methodology_count,
  "global_file_size": $global_size,
  "project_file_size": $project_size,
  "actions_taken": []
}
EOF
            
            echo "📊 Session tracking initialized: $SESSION_LOG"
            ;;
            
        "learning_added")
            # Record learning addition
            if [ -f "$SESSION_LOG" ]; then
                # Add to actions array (simplified - would need jq for proper JSON manipulation)
                echo "Learning added: $(date)" >> "${SESSION_LOG}.actions"
            fi
            ;;
            
        "verification_used")
            # Record verification checklist usage
            if [ -f "$SESSION_LOG" ]; then
                echo "Verification used: $value at $(date)" >> "${SESSION_LOG}.actions"
            fi
            ;;
            
        "pattern_applied")
            # Record pattern application
            if [ -f "$SESSION_LOG" ]; then
                echo "Pattern applied: $value at $(date)" >> "${SESSION_LOG}.actions"
            fi
            ;;
    esac
}

# Command line interface
case "$1" in
    "session_start")
        update_metrics "session_start"
        ;;
    "learning_added")
        update_metrics "learning_added" "$2"
        ;;
    "verification_used")
        update_metrics "verification_used" "$2"
        ;;
    "pattern_applied")
        update_metrics "pattern_applied" "$2"
        ;;
    "show_metrics")
        echo "📊 Current Performance Metrics:"
        if [ -f "$PERFORMANCE_LOG" ]; then
            cat "$PERFORMANCE_LOG"
        else
            echo "No metrics available yet."
        fi
        ;;
    *)
        echo "Usage: $0 {session_start|learning_added|verification_used|pattern_applied|show_metrics} [value]"
        echo ""
        echo "Examples:"
        echo "  $0 session_start"
        echo "  $0 learning_added 'Exception handling pattern'"
        echo "  $0 verification_used 'PR review checklist'"
        echo "  $0 pattern_applied 'Hamcrest assertions'"
        echo "  $0 show_metrics"
        ;;
esac