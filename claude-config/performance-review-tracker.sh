#!/bin/bash

# Professional Performance Review Tracker
# Automatically tracks achievements, deliverables, and professional development
# Based on THG Performance Framework

PERFORMANCE_DIR="/Users/obot/.claude/performance-reviews"
CURRENT_YEAR=$(date +%Y)
CURRENT_MONTH=$(date +%m)
MONTHLY_FILE="$PERFORMANCE_DIR/$CURRENT_YEAR-monthly-achievements.md"
SKILLS_FILE="$PERFORMANCE_DIR/skills-and-cv-data.md"
DELIVERABLES_FILE="$PERFORMANCE_DIR/$CURRENT_YEAR-deliverables-log.json"

# Create performance directory if it doesn't exist
mkdir -p "$PERFORMANCE_DIR"

# Initialize files if they don't exist
initialize_files() {
    if [ ! -f "$MONTHLY_FILE" ]; then
        cat > "$MONTHLY_FILE" << EOF
# Professional Achievements Tracker - $CURRENT_YEAR

## Performance Framework Alignment

### Deliverables (THG Framework: 1-5 Scale)
**Current Level Assessment**: 
- Goal Setting: Clear, measurable objectives established
- Delivery: Completion rate and quality
- Additional Work: Projects beyond expectations

### Ambition (THG Framework: 1-5 Scale)
**Current Level Assessment**:
- Goal Achievement: Personal and professional targets
- Adaptability: Response to challenges and setbacks
- Development: Skill building and learning initiatives

### Innovation (THG Framework: 1-5 Scale)
**Current Level Assessment**:
- Problem Solving: Creative approaches to challenges
- Process Improvement: Efficiency and effectiveness gains
- Knowledge Sharing: Contribution to team learning

### Decisiveness (THG Framework: 1-5 Scale)
**Current Level Assessment**:
- Decision Making: Quality and timeliness of choices
- Risk Management: Calculated risk-taking
- Initiative: Proactive problem identification

---

EOF
    fi

    if [ ! -f "$SKILLS_FILE" ]; then
        cat > "$SKILLS_FILE" << EOF
# Professional Skills & CV Data

## Technical Skills
- Programming Languages: [Auto-tracked from code interactions]
- Frameworks/Technologies: [Auto-tracked from project work]
- Development Tools: [Auto-tracked from tool usage]
- Architecture Patterns: [Auto-tracked from design work]

## Professional Achievements
- Projects Delivered: [Auto-tracked from completed work]
- Process Improvements: [Auto-tracked from methodology updates]
- Knowledge Contributions: [Auto-tracked from documentation/learnings]
- Problem Resolution: [Auto-tracked from issue handling]

## Leadership & Collaboration
- Code Reviews: [Auto-tracked from PR reviews]
- Mentoring: [Auto-tracked from help provided]
- Knowledge Transfer: [Auto-tracked from explanations/documentation]
- Team Contributions: [Auto-tracked from collaborative work]

## Continuous Learning
- New Technologies: [Auto-tracked from learning experiences]
- Best Practices: [Auto-tracked from methodology improvements]
- Industry Knowledge: [Auto-tracked from research and application]

---
*Last Updated: $(date)*
EOF
    fi

    if [ ! -f "$DELIVERABLES_FILE" ]; then
        cat > "$DELIVERABLES_FILE" << EOF
{
  "year": $CURRENT_YEAR,
  "tracking_started": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "deliverables": {
    "completed_projects": [],
    "code_reviews": [],
    "bug_fixes": [],
    "feature_implementations": [],
    "process_improvements": [],
    "documentation_contributions": [],
    "learning_achievements": []
  },
  "monthly_summaries": {},
  "skills_developed": [],
  "technologies_used": []
}
EOF
    fi
}

# Log achievement function
log_achievement() {
    local category="$1"
    local description="$2"
    local impact="$3"
    local evidence="$4"
    
    local date_stamp=$(date +%Y-%m-%d)
    local month_name=$(date +%B)
    
    # Add to monthly file
    echo "" >> "$MONTHLY_FILE"
    echo "## $month_name Achievement: $category" >> "$MONTHLY_FILE"
    echo "**Date**: $date_stamp" >> "$MONTHLY_FILE"
    echo "**Description**: $description" >> "$MONTHLY_FILE"
    echo "**Impact**: $impact" >> "$MONTHLY_FILE"
    if [ -n "$evidence" ]; then
        echo "**Evidence**: $evidence" >> "$MONTHLY_FILE"
    fi
    echo "**THG Framework Alignment**: [To be assessed]" >> "$MONTHLY_FILE"
    echo "" >> "$MONTHLY_FILE"
}

# Auto-track from Claude interactions
auto_track_interaction() {
    local interaction_type="$1"
    local details="$2"
    
    case "$interaction_type" in
        "pr_review")
            log_achievement "Code Review" "Conducted comprehensive PR review" "Improved code quality and prevented issues" "$details"
            ;;
        "bug_fix")
            log_achievement "Problem Resolution" "Identified and resolved technical issue" "Prevented production problems or improved reliability" "$details"
            ;;
        "feature_implementation")
            log_achievement "Feature Delivery" "Implemented new functionality" "Enhanced product capabilities or user experience" "$details"
            ;;
        "learning")
            log_achievement "Professional Development" "Acquired new knowledge or skill" "Improved technical capability and methodology" "$details"
            ;;
        "process_improvement")
            log_achievement "Innovation" "Improved development process or methodology" "Increased team efficiency or code quality" "$details"
            ;;
        "mentoring")
            log_achievement "Leadership" "Provided guidance or knowledge transfer" "Supported team member development" "$details"
            ;;
    esac
}

# Generate monthly summary
generate_monthly_summary() {
    local month="$1"
    local year="${2:-$CURRENT_YEAR}"
    
    echo "## Monthly Summary: $month $year" >> "$MONTHLY_FILE"
    echo "" >> "$MONTHLY_FILE"
    echo "### THG Framework Self-Assessment" >> "$MONTHLY_FILE"
    echo "" >> "$MONTHLY_FILE"
    echo "**Deliverables (1-5)**: [Score] - [Justification]" >> "$MONTHLY_FILE"
    echo "- Goals set and achieved this month" >> "$MONTHLY_FILE"
    echo "- Quality of deliverables" >> "$MONTHLY_FILE"
    echo "- Additional work undertaken" >> "$MONTHLY_FILE"
    echo "" >> "$MONTHLY_FILE"
    echo "**Ambition (1-5)**: [Score] - [Justification]" >> "$MONTHLY_FILE"
    echo "- Proactive goal setting" >> "$MONTHLY_FILE"
    echo "- Response to challenges" >> "$MONTHLY_FILE"
    echo "- Development initiatives" >> "$MONTHLY_FILE"
    echo "" >> "$MONTHLY_FILE"
    echo "**Innovation (1-5)**: [Score] - [Justification]" >> "$MONTHLY_FILE"
    echo "- Creative problem solving" >> "$MONTHLY_FILE"
    echo "- Process improvements" >> "$MONTHLY_FILE"
    echo "- Knowledge sharing" >> "$MONTHLY_FILE"
    echo "" >> "$MONTHLY_FILE"
    echo "**Decisiveness (1-5)**: [Score] - [Justification]" >> "$MONTHLY_FILE"
    echo "- Quality of decisions made" >> "$MONTHLY_FILE"
    echo "- Initiative demonstrated" >> "$MONTHLY_FILE"
    echo "- Risk management" >> "$MONTHLY_FILE"
    echo "" >> "$MONTHLY_FILE"
    echo "### Key Achievements This Month" >> "$MONTHLY_FILE"
    echo "- [Achievement 1]" >> "$MONTHLY_FILE"
    echo "- [Achievement 2]" >> "$MONTHLY_FILE"
    echo "- [Achievement 3]" >> "$MONTHLY_FILE"
    echo "" >> "$MONTHLY_FILE"
    echo "---" >> "$MONTHLY_FILE"
    echo "" >> "$MONTHLY_FILE"
}

# Update CV data
update_cv_data() {
    local skill_type="$1"
    local skill_name="$2"
    local context="$3"
    
    # Simple append to skills file (would be enhanced with proper parsing)
    echo "- **$skill_name** ($skill_type): $context - $(date +%Y-%m-%d)" >> "$SKILLS_FILE"
}

# Command line interface
case "$1" in
    "init")
        initialize_files
        echo "✅ Performance tracking files initialized"
        echo "📁 Files created in: $PERFORMANCE_DIR"
        ;;
    "log")
        if [ $# -lt 4 ]; then
            echo "Usage: $0 log <category> <description> <impact> [evidence]"
            echo "Categories: pr_review, bug_fix, feature_implementation, learning, process_improvement, mentoring"
            exit 1
        fi
        auto_track_interaction "$2" "$3 | Impact: $4 | Evidence: ${5:-N/A}"
        echo "✅ Achievement logged: $2"
        ;;
    "summary")
        month_name=$(date +%B)
        generate_monthly_summary "$month_name"
        echo "✅ Monthly summary template added"
        ;;
    "cv_update")
        if [ $# -lt 3 ]; then
            echo "Usage: $0 cv_update <skill_type> <skill_name> <context>"
            exit 1
        fi
        update_cv_data "$2" "$3" "$4"
        echo "✅ CV data updated: $3"
        ;;
    "view")
        echo "📊 Current Performance Data:"
        echo ""
        if [ -f "$MONTHLY_FILE" ]; then
            echo "=== Recent Achievements ==="
            tail -20 "$MONTHLY_FILE"
        fi
        ;;
    "files")
        echo "📁 Performance Tracking Files:"
        echo "- Monthly: $MONTHLY_FILE"
        echo "- Skills/CV: $SKILLS_FILE"
        echo "- Deliverables: $DELIVERABLES_FILE"
        ;;
    *)
        echo "Performance Review Tracker"
        echo "Usage: $0 {init|log|summary|cv_update|view|files}"
        echo ""
        echo "Commands:"
        echo "  init                     - Initialize tracking files"
        echo "  log <type> <desc> <impact> [evidence] - Log achievement"
        echo "  summary                  - Generate monthly summary template"
        echo "  cv_update <type> <skill> <context> - Update CV/skills data"
        echo "  view                     - View recent achievements"
        echo "  files                    - Show file locations"
        echo ""
        echo "Achievement Types:"
        echo "  pr_review, bug_fix, feature_implementation, learning,"
        echo "  process_improvement, mentoring"
        ;;
esac