#!/bin/bash

# Claude Achievement Auto-Tracker
# Automatically tracks professional achievements based on Claude interactions
# Integrates with THG Performance Framework

CLAUDE_DIR="/Users/obot/.claude"
PERF_TRACKER="$CLAUDE_DIR/scripts/performance-review-tracker.sh"

# Track achievement from Claude interaction
track_claude_achievement() {
    local achievement_type="$1"
    local description="$2"
    local impact="$3"
    local evidence="$4"
    
    # Log to performance tracker
    "$PERF_TRACKER" log "$achievement_type" "$description" "$impact" "$evidence"
    
    # Also log to Claude's own tracking
    echo "$(date): $achievement_type - $description" >> "$CLAUDE_DIR/daily-achievements.log"
}

# Auto-detect achievements from common Claude tasks
auto_detect_achievement() {
    local task_type="$1"
    local task_details="$2"
    
    case "$task_type" in
        "pr_review_completed")
            track_claude_achievement "pr_review" \
                "Conducted comprehensive PR review with structured analysis" \
                "Identified issues early, improved code quality, prevented production problems" \
                "PR analysis with categorized findings and recommendations"
            ;;
        "bug_investigation")
            track_claude_achievement "bug_fix" \
                "Investigated and resolved technical issue" \
                "Prevented system failures, improved reliability" \
                "$task_details"
            ;;
        "feature_development")
            track_claude_achievement "feature_implementation" \
                "Developed new feature or functionality" \
                "Enhanced product capabilities, improved user experience" \
                "$task_details"
            ;;
        "learning_applied")
            track_claude_achievement "learning" \
                "Applied new knowledge or methodology" \
                "Improved technical approach, prevented known issues" \
                "$task_details"
            ;;
        "process_improved")
            track_claude_achievement "process_improvement" \
                "Enhanced development workflow or methodology" \
                "Increased team efficiency, improved code quality" \
                "$task_details"
            ;;
        "knowledge_shared")
            track_claude_achievement "mentoring" \
                "Provided technical guidance or knowledge transfer" \
                "Supported team learning, improved development practices" \
                "$task_details"
            ;;
        "automation_created")
            track_claude_achievement "process_improvement" \
                "Created automation tools or scripts" \
                "Reduced manual effort, improved consistency" \
                "$task_details"
            ;;
    esac
}

# THG Framework assessment helper
assess_thg_framework() {
    local category="$1"
    
    case "$category" in
        "deliverables")
            echo "📋 Deliverables Assessment (1-5 scale):"
            echo "- Goal Setting: Clear, measurable objectives"
            echo "- Completion: Quality and timeliness"
            echo "- Additional Work: Beyond expectations"
            ;;
        "ambition")
            echo "🎯 Ambition Assessment (1-5 scale):"
            echo "- Goal Achievement: Personal and professional targets"
            echo "- Adaptability: Response to challenges"
            echo "- Development: Continuous learning"
            ;;
        "innovation")
            echo "💡 Innovation Assessment (1-5 scale):"
            echo "- Problem Solving: Creative approaches"
            echo "- Process Improvement: Efficiency gains"
            echo "- Knowledge Sharing: Team contributions"
            ;;
        "decisiveness")
            echo "⚡ Decisiveness Assessment (1-5 scale):"
            echo "- Decision Making: Quality and timeliness"
            echo "- Risk Management: Calculated risks"
            echo "- Initiative: Proactive identification"
            ;;
    esac
}

# Generate CV-friendly achievement descriptions
generate_cv_entry() {
    local achievement="$1"
    local impact="$2"
    
    # Convert to CV-appropriate language (no AI qualifiers)
    case "$achievement" in
        *"PR review"*)
            echo "Conducted code reviews improving software quality and preventing production issues"
            ;;
        *"bug"*|*"issue"*)
            echo "Resolved critical technical issues ensuring system reliability"
            ;;
        *"feature"*|*"implementation"*)
            echo "Delivered new functionality enhancing product capabilities"
            ;;
        *"process"*|*"automation"*)
            echo "Implemented process improvements increasing team efficiency"
            ;;
        *"learning"*|*"methodology"*)
            echo "Applied advanced methodologies improving development practices"
            ;;
        *"mentoring"*|*"guidance"*)
            echo "Provided technical leadership supporting team development"
            ;;
        *)
            echo "Contributed to technical excellence and project delivery"
            ;;
    esac
}

# Command interface
case "$1" in
    "track")
        if [ $# -lt 4 ]; then
            echo "Usage: $0 track <type> <description> <impact> [evidence]"
            exit 1
        fi
        auto_detect_achievement "$2" "$3 | $4 | ${5:-}"
        ;;
    "assess")
        assess_thg_framework "$2"
        ;;
    "cv_entry")
        generate_cv_entry "$2" "$3"
        ;;
    "daily_summary")
        echo "📊 Today's Achievements:"
        if [ -f "$CLAUDE_DIR/daily-achievements.log" ]; then
            grep "$(date +%Y-%m-%d)" "$CLAUDE_DIR/daily-achievements.log" || echo "No achievements logged today"
        else
            echo "No achievements logged yet"
        fi
        ;;
    *)
        echo "Claude Achievement Tracker"
        echo "Usage: $0 {track|assess|cv_entry|daily_summary}"
        echo ""
        echo "Commands:"
        echo "  track <type> <desc> <impact> [evidence] - Track achievement"
        echo "  assess <category>                       - THG framework assessment"
        echo "  cv_entry <achievement> <impact>         - Generate CV entry"
        echo "  daily_summary                          - Show today's achievements"
        echo ""
        echo "Achievement Types:"
        echo "  pr_review_completed, bug_investigation, feature_development,"
        echo "  learning_applied, process_improved, knowledge_shared, automation_created"
        ;;
esac