#!/bin/bash

# Automated Verification Checklist
# Based on meta-analysis showing 59 verification mentions
# Implements systematic verification to prevent "Contradiction Found" errors

echo "🔍 AUTOMATED VERIFICATION CHECKLIST"
echo "=================================="
echo ""

# Function to create verification prompts for Claude
create_verification_checklist() {
    local task_type="$1"
    
    case "$task_type" in
        "pr_review")
            echo "📋 PR Review Verification Checklist:"
            echo "□ Read project CLAUDE.md for specific conventions"
            echo "□ Search codebase for similar patterns before flagging deviations"
            echo "□ Verify documented conventions match actual usage"
            echo "□ Check if exceptions follow established patterns"
            echo "□ Trace complete execution flow before suggesting changes"
            echo ""
            ;;
        "code_fix")
            echo "📋 Code Fix Verification Checklist:"
            echo "□ Check git history to understand original intent"
            echo "□ Research existing patterns in codebase"
            echo "□ Verify changes won't break intended functionality"
            echo "□ Test that fix follows established conventions"
            echo "□ Ensure fix doesn't introduce redundant patterns"
            echo ""
            ;;
        "learning_addition")
            echo "📋 Learning Addition Verification Checklist:"
            echo "□ Search existing CLAUDE.md for related content"
            echo "□ Check if learning contradicts existing entries"
            echo "□ Determine if LOCAL or GLOBAL scope"
            echo "□ Verify learning is based on concrete evidence"
            echo "□ Assess if this consolidates with existing patterns"
            echo ""
            ;;
        *)
            echo "📋 General Verification Checklist:"
            echo "□ Question assumptions before proceeding"
            echo "□ Search for existing patterns/precedents"
            echo "□ Verify with concrete evidence"
            echo "□ Check for contradictions with established knowledge"
            echo "□ Consider unintended consequences"
            echo ""
            ;;
    esac
}

# Make verification checklists available
if [ $# -eq 0 ]; then
    echo "Usage: $0 [pr_review|code_fix|learning_addition|general]"
    echo ""
    echo "Available checklists:"
    create_verification_checklist "pr_review"
    create_verification_checklist "code_fix" 
    create_verification_checklist "learning_addition"
    create_verification_checklist "general"
else
    create_verification_checklist "$1"
fi