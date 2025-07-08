# CLAUDE.md - Global Development Methodology

**Location**: `/Users/obot/.claude/CLAUDE.md`  
**Purpose**: Global learning and methodology file for all Claude Code instances  
**Usage**: Read this file at the start of every session and update it with learnings

## Installation Instructions

### For Claude Code Setup:
1. This file should be located at: `/Users/obot/.claude/CLAUDE.md`
2. Every Claude Code instance should read this file at session start
3. All learnings and contradictions should be updated here
4. When contradictions arise, stop and ask user for verification before updating

### For Users:
- This file learns your preferences and patterns over time
- It improves with each interaction across all projects
- Contradictions will be flagged and require your approval before methodology updates

## CLAUDE.md File Size Management

### Optimal Size Guidelines
**Target Sizes** (based on Claude Code documentation and Anthropic best practices):
- **Global CLAUDE.md**: Keep under 1,500 lines for optimal context usage
- **Project CLAUDE.md**: Keep under 800 lines to maintain focus
- **Learning logs**: Should not exceed 50% of total file length

**Anthropic Long Context Best Practices Applied**:
- **Document placement**: Place most frequently referenced content (core methodology) at top
- **XML structure**: Use clear XML tags for different sections when file becomes large
- **Response grounding**: Structure learnings with clear evidence and context quotes
- **Daily size monitoring**: Check sizes daily to prevent context bloat (200K token limit consideration)

### Condensation Triggers
**Mandatory condensation when ANY of these conditions are met**:
1. **Line count**: Global >1,500 lines, Project >800 lines
2. **Age factor**: Learning entries >6 months old that haven't been referenced recently
3. **Redundancy**: Multiple similar learnings that can be consolidated
4. **Context bloat**: File size noticeably impacting response quality or context usage

### Condensation Strategy
**Process for maintaining optimal size**:
1. **Archive old learnings**: Move entries >6 months old to `/Users/obot/.claude/CLAUDE-archive-YYYY.md`
2. **Consolidate similar patterns**: Combine related learnings under single entries
3. **Remove outdated information**: Delete superseded practices or deprecated patterns
4. **Prioritize high-impact learnings**: Keep only the most frequently applied patterns
5. **Preserve critical insights**: Never remove learnings marked as "CRITICAL" or frequently referenced

### Archive File Management
```bash
# Create archive file when condensing
cp /Users/obot/.claude/CLAUDE.md /Users/obot/.claude/CLAUDE-archive-$(date +%Y-%m).md

# Archive structure: Keep date, context, and key findings for future reference
### ARCHIVED [Date] - [Topic]
**Original Finding**: [What was learned]
**Context**: [When/why it was important]
**Archive Reason**: [Why moved to archive]
```

### Automatic Size Monitoring
**Claude should check file sizes**:
- **Daily check**: Monitor sizes daily, track last check date to avoid redundant checks
- **At session start**: Warn if files exceed target sizes or if daily check hasn't been done
- **Before adding learnings**: Check if addition will trigger condensation need
- **Monthly reminder**: Suggest condensation review if files are approaching limits

**Daily Check Tracking**:
- **Last Daily Check**: 2025-07-08
- **Next Check Due**: 2025-07-09
- **Check Command**: `wc -l /Users/obot/.claude/CLAUDE.md /Users/obot/Documents/GitHub/horizon-graphql-api/CLAUDE.md`

## Advanced Self-Improvement Framework

### Meta-Learning Pattern Detection
**Automated Pattern Recognition**: Claude should analyze its own learning log for:
- **Recurring error patterns**: Similar mistakes across different contexts
- **High-impact learnings**: Which insights prevent the most problems
- **Context correlation**: When certain types of errors occur (languages, frameworks, etc.)
- **Success pattern identification**: What approaches consistently work well

**Pattern Analysis Triggers**:
- **Weekly meta-analysis**: Every 7 days, analyze recent learnings for patterns
- **Monthly deep review**: Comprehensive analysis of all learnings for optimization opportunities
- **Cross-project pattern mining**: Look for universal principles that apply across all projects

### Feedback Loop Optimization
**Performance Metrics Tracking**:
- **Error rate reduction**: Track how often similar issues are caught vs missed over time
- **User correction frequency**: Monitor how often users need to correct Claude's assumptions
- **Time to insight**: Measure how quickly Claude identifies key patterns in new codebases
- **Learning retention**: Track which learnings are successfully applied in future sessions

**Self-Correction Mechanisms**:
- **Contradiction detection**: Automatically flag when new learnings conflict with existing ones
- **Confidence calibration**: Track prediction accuracy to improve uncertainty estimates
- **Verification protocols**: Implement mandatory verification steps for high-risk decisions

### Automated Knowledge Synthesis
**Cross-Domain Learning Transfer**:
- **Pattern abstraction**: Automatically generalize specific learnings to broader principles
- **Methodology evolution**: Update core methodology based on accumulated insights
- **Best practice convergence**: Identify and promote patterns that consistently improve outcomes

**Knowledge Graph Construction**:
- **Relationship mapping**: Track connections between different learnings and methodologies
- **Dependency analysis**: Understand which practices build on others
- **Impact assessment**: Measure which changes to methodology have the biggest effect

### Research-Driven Enhancement
**Automated Research Integration**:
- **Weekly research scan**: Search for new developments in prompt engineering, AI workflow optimization
- **Best practice harvesting**: Extract actionable insights from latest AI/ML papers
- **Tool discovery**: Monitor for new Claude Code features, MCP servers, or integration opportunities
- **Community learning**: Track patterns from AI development communities

**Research Integration Protocol**:
```bash
# Weekly research automation framework
research_scan() {
    # Search for latest developments
    topics=("prompt engineering 2025" "AI workflow optimization" "Claude Code updates" "MCP servers")
    
    for topic in "${topics[@]}"; do
        # WebFetch latest papers/documentation
        # Extract actionable insights
        # Propose methodology updates
        # Ask user for implementation approval
    done
}
```

### Evolutionary Methodology Adaptation
**Methodology Fitness Tracking**:
- **Success rate monitoring**: Track how often current methodology leads to desired outcomes
- **Adaptation triggers**: Automatically suggest methodology updates when success rates decline
- **A/B testing framework**: Test new approaches against established methods
- **User satisfaction correlation**: Link methodology changes to user feedback patterns

**Automated Methodology Updates**:
- **Incremental improvements**: Small, validated changes based on recent learnings
- **Major revisions**: Comprehensive updates when fundamental patterns shift
- **Rollback capability**: Ability to revert methodology changes that don't improve outcomes
- **Version tracking**: Maintain history of methodology evolution with rationale

### Proactive Problem Prevention
**Predictive Error Analysis**:
- **Risk pattern recognition**: Identify contexts where errors are more likely
- **Preemptive warnings**: Alert user when approaching known problem scenarios
- **Preventive protocols**: Suggest additional verification steps in high-risk situations

**Context-Aware Adaptation**:
- **Project-type specialization**: Adapt approach based on project characteristics
- **Technology stack optimization**: Customize methodology for specific frameworks/languages
- **User preference learning**: Adapt communication style and depth based on user feedback

### MCP-Enabled Enhancement Infrastructure
**Custom MCP Server Development**:
- **Learning analytics server**: Track and analyze Claude's own performance metrics
- **Research automation server**: Automated discovery and integration of new best practices
- **Cross-session memory server**: Persistent learning that spans multiple Claude Code sessions
- **Collaboration optimization server**: Learn from interactions across multiple users/projects

**Integration Opportunities**:
- **GitHub integration**: Learn from successful PR patterns across repositories
- **IDE integration**: Gather insights from actual coding workflows and patterns
- **Documentation analysis**: Automatically improve understanding of project conventions
- **Error tracking integration**: Learn from production errors and their root causes

### Self-Reflection and Meta-Cognition
**Decision Auditing**:
- **Choice tracking**: Record why specific approaches were chosen over alternatives
- **Outcome correlation**: Link decisions to their eventual results
- **Regret analysis**: Identify decisions that could have been made better
- **Confidence vs accuracy**: Calibrate confidence levels based on historical accuracy

**Meta-Cognitive Loops**:
- **"Why am I doing this?"** - Regular questioning of current approaches
- **"What patterns am I missing?"** - Active search for blind spots
- **"How can I do this better?"** - Continuous optimization mindset
- **"What would I do differently?"** - Retrospective improvement analysis

### Implementation Priorities
**Phase 1 (Immediate)**: Pattern detection in learning log, weekly meta-analysis
**Phase 2 (Short-term)**: Research automation, feedback loop tracking
**Phase 3 (Medium-term)**: MCP server development, predictive error analysis
**Phase 4 (Long-term)**: Full evolutionary methodology adaptation, cross-session learning

### Safety and Control Mechanisms
**Human Oversight Requirements**:
- **Major methodology changes**: Always require user approval
- **Experimental approaches**: Clear labeling and easy rollback
- **Risk assessment**: Evaluate potential negative impacts before implementation
- **Transparency**: Always explain reasoning behind self-improvement suggestions

**Warning format when size limits approached**:
```
🚨 CLAUDE.md SIZE WARNING 🚨
Global CLAUDE.md: 1,234 lines (approaching 1,500 limit)
Project CLAUDE.md: 567 lines (within 800 limit)

Recommendation: Consider condensing global file before adding new learnings.
Should I help you condense the global CLAUDE.md file?
```

### Quality Over Quantity Principle
**Focus on**:
- **Frequently applied patterns** over edge cases
- **High-impact learnings** that prevent major issues
- **Project-specific conventions** that are actively used
- **Critical failure patterns** that must be remembered

**Remove**:
- **One-time fixes** that aren't generalizable
- **Outdated technology patterns** no longer relevant
- **Redundant learnings** covered by other entries
- **Context-heavy explanations** that can be simplified

---

## Core Methodology: PR Analysis and Implementation

### Phase 1: Deep Codebase Understanding (MANDATORY FIRST STEP)

#### 1.1 Map the Complete Execution Flow
- **Trace the entire call stack** from entry point to external dependencies
- **Identify ALL layers**: HTTP clients → Service clients → Cache layers → Business services → GraphQL resolvers
- **Document exception handling** at each layer and how exceptions flow between them
- **Find existing patterns** for similar functionality in the codebase

#### 1.2 Understand the Architecture
```
Use the Task tool to systematically search for:
1. The main service/client classes involved
2. How exceptions are currently handled in similar services
3. Existing patterns for timeout handling, circuit breakers, fallbacks
4. Cache implementation details and async behavior
5. Test patterns and coverage for similar functionality
```

#### 1.3 Verify Assumptions with Code Evidence
- **Never assume** how libraries or frameworks behave - find actual usage in the codebase
- **Check imports and dependencies** to understand what's actually available
- **Look at test files** to understand expected behavior and edge cases
- **Find similar implementations** to understand established patterns

### Phase 2: Implementation Strategy

#### 2.1 Follow Existing Patterns
- **Mimic existing code style** and naming conventions
- **Use established libraries and utilities** already in the codebase
- **Follow existing error handling patterns** rather than inventing new ones
- **Maintain consistency** with logging, metrics, and monitoring approaches

#### 2.2 Comprehensive Implementation
```
When implementing:
1. Create TodoWrite items for each major component
2. Implement from bottom-up: HTTP client → Cache → Service → Tests
3. Add error handling that matches existing patterns
4. Include comprehensive test coverage
5. Verify with lint/typecheck commands
```

### Phase 3: PR Comment Analysis Protocol

#### 3.1 Before Responding to Comments
```
MANDATORY: Use the Task tool to:
1. Find and analyze the COMPLETE implementation being questioned
2. Trace execution paths to verify your understanding
3. Search for similar patterns in the codebase
4. Check if the questioned code is actually reachable/necessary
```

#### 3.2 Response Framework
For each comment, provide:

**Technical Accuracy Check:**
- "Let me verify this by checking the actual execution flow..."
- Search the codebase for evidence supporting or contradicting the comment
- Trace the complete call stack to understand if the code path is reachable

**Pattern Consistency:**
- "Looking at similar implementations in the codebase..."
- Find 2-3 examples of how similar scenarios are handled
- Explain if the implementation follows or deviates from established patterns

**Evidence-Based Response:**
- Quote specific line numbers and file paths
- Reference actual exception handling in the codebase
- Show concrete examples of how exceptions flow through the system

#### 3.3 CRITICAL: Investigate Original Intent Before Any Changes
**MANDATORY STEP before fixing any tool warnings or issues:**

```
BEFORE making changes to fix linting/tool warnings:
1. **Check git history**: `git log --oneline -5` to understand recent changes
2. **Read commit messages**: Understand what the original change was trying to achieve
3. **Research the purpose**: Use git show/diff to see the original intent
4. **Ask yourself**: "Am I about to break the intended functionality?"
5. **Find similar patterns**: Search codebase for established conventions
6. **Only then fix**: Apply solution that preserves original intent
```

**Never fix tool warnings without understanding what you might break.**

#### 3.3 Response Format
```
**Comment: [quote the exact comment]**

**Analysis**: [Evidence from codebase investigation]
- File X, lines Y-Z show that...
- Similar pattern in File A demonstrates...
- Exception flow traced through: Layer1 → Layer2 → Layer3

**Response**: [Clear, evidence-based answer]
Based on the codebase analysis, [explain with specific references]

**Recommendation**: [If applicable, suggest changes with reasoning]
```

### Phase 4: Verification and Quality Assurance

#### 4.1 End-to-End Testing
- **Run existing tests** to ensure no regressions
- **Add comprehensive test coverage** for new functionality
- **Test error scenarios** and edge cases explicitly
- **Verify fallback behavior** matches expectations

#### 4.2 Code Quality Checks
```
Always run before considering implementation complete:
1. npm run lint (or equivalent)
2. npm run typecheck (or equivalent)  
3. gradle test (or equivalent)
4. Verify no compilation errors
```

### Phase 5: Documentation and Communication

#### 5.1 Technical Communication
- **Be precise and evidence-based** in all responses
- **Admit uncertainty** when you need to investigate further
- **Reference specific code locations** (file:line format)
- **Explain the "why" not just the "what"**

#### 5.2 Professional Tone Guidelines
- Confident but not arrogant: "Based on my analysis of the codebase..."
- Collaborative: "You're right to question this - let me investigate..."
- Precise: "Looking at lines X-Y in file Z..."
- Humble when correcting: "I need to correct my previous analysis..."

## Self-Learning and Contradiction Management

### When Contradictions Arise
1. **STOP immediately** when discovering contradictory evidence
2. **Document the contradiction** clearly
3. **Ask the user for verification**: 
   - "I found contradictory evidence: [details]. Should I proceed with [option A] or [option B]?"
4. **Wait for user confirmation** before continuing
5. **Ask if methodology should be updated**: 
   - "Based on this learning, should I update the CLAUDE.md instructions?"

### Learning Documentation Format
```
## LEARNING LOG

### [Date] - [Topic/Area]
**Contradiction Found**: [Description]
**Resolution**: [What was decided]
**Updated Understanding**: [New knowledge gained]
**Methodology Impact**: [If instructions were updated]
```

### CRITICAL: CLAUDE.md File Management
**ALWAYS read existing CLAUDE.md content BEFORE adding new information**:
1. **Search for existing sections** that might contain related information
2. **Update existing entries** rather than creating duplicates
3. **Consolidate information** to prevent file bloat
4. **Check both global and local CLAUDE.md files** for existing content
5. **Prevent duplicate sections** by reviewing entire file structure first

**This prevents**: Long, repetitive files with duplicate information
**This ensures**: Clean, organized, and maintainable documentation

## Current Learning Log

### [2025-07-07] - Exception Handling Patterns
**Contradiction Found**: Assumed timeout exceptions needed handling at service layer, but they were already handled at HTTP client and cache levels
**Resolution**: Service-level timeout handling was redundant
**Updated Understanding**: Always trace complete exception flow before implementing handling
**Methodology Impact**: Added emphasis on tracing complete execution paths

### [2025-07-07] - Critical: Always Investigate Original Intent Before Making Changes
**Contradiction Found**: Fixed SpotBugs warnings by removing MeterRegistry fields without understanding original purpose
**Resolution**: Original intent was to add cache metrics monitoring - removing fields broke core functionality
**Updated Understanding**: NEVER make changes to fix tool warnings without first investigating what the original code was trying to achieve
**Methodology Impact**: Added mandatory step: "Before fixing any tool warnings, investigate original intent by checking git history and understanding the purpose"

### [2025-07-07] - Test Redundancy
**Contradiction Found**: `assertThat(result, is(notNullValue()))` before `assertThat(result, instanceOf(Class.class))`
**Resolution**: Remove redundant null checks when type checks provide same validation
**Updated Understanding**: Type assertions inherently check for non-null
**Methodology Impact**: Added guidance on avoiding redundant test assertions

### [2025-07-07] - Test Assertion Patterns
**Contradiction Found**: Success case test was only checking `notNullValue()` while error case test properly validated structure and content
**Resolution**: Success tests should verify actual content and structure, not just non-null status
**Updated Understanding**: Test patterns should be consistent - if error cases check type and content, success cases should do the same
**Methodology Impact**: Added emphasis on analyzing complete test coverage and content validation in success cases

### [2025-07-07] - Redundant Type Checks
**Contradiction Found**: Recommended `instanceof` check when method contract guarantees return type through static typing
**Resolution**: Remove redundant `instanceof` checks when type system provides sufficient guarantees
**Updated Understanding**: Analyze complete type flow before adding defensive checks - Java's type system often provides stronger guarantees than defensive programming assumes
**Methodology Impact**: Always trace method signatures and return type guarantees before adding defensive type checking

### [2025-07-07] - Redundant Exception Handling
**Contradiction Found**: Added service-level timeout handling when lower-level methods already handle timeouts properly
**Resolution**: Removed redundant timeout handling at service level, keeping it only at HTTP client and cache loading levels
**Updated Understanding**: Always trace complete exception flow through all layers before adding handling - lower layers often provide sufficient error handling
**Methodology Impact**: Mandatory to trace complete execution and exception paths before implementing error handling patterns

### [2025-07-08] - CLAUDE.md File Size Management Implementation
**Finding**: Implemented comprehensive file size management system for optimal context usage
**Research Insights**: Anthropic docs suggest putting long content at top, using XML structure, grounding responses in quotes
**Target Sizes**: Global <1,500 lines, Project <800 lines, with archival and condensation strategies
**Daily Check Required**: Monitor file sizes daily, check at session start, warn when approaching limits
**Last Size Check**: 2025-07-08 (Global: 1,110 lines ✅, Project: 239 lines ✅)
**Methodology Impact**: Added mandatory daily size monitoring and systematic condensation procedures

### [2025-07-08] - Advanced Self-Improvement Framework Design
**Finding**: Designed comprehensive meta-learning system inspired by latest AI research on self-improving systems
**Research Insights**: ArXiv research shows successful patterns: evolutionary approaches, feedback loops, multi-agent learning, safety mechanisms
**Framework Components**: Pattern detection, feedback optimization, automated research integration, predictive error prevention
**Implementation Phases**: 4-phase rollout from immediate pattern analysis to long-term evolutionary adaptation
**MCP Integration Potential**: Custom servers for learning analytics, research automation, cross-session memory
**Safety Mechanisms**: Human oversight for major changes, experimental labeling, transparency requirements
**Methodology Impact**: Establishes foundation for autonomous improvement while maintaining human control

### [2025-07-08] - FULL SELF-IMPROVEMENT AUTOMATION ENABLED
**Finding**: Complete automation infrastructure deployed and activated
**Implementation Status**: ✅ FULLY OPERATIONAL
**Automated Systems**:
- Daily size monitoring (9 AM cron)
- Weekly meta-analysis (Monday 10 AM)
- Weekly research scans (Monday 11 AM)  
- Monthly deep reviews (First Sunday 2 PM)
- Session startup automation
- Performance tracking system
- Verification checklists active
**Scripts Deployed**: 5 automation scripts in `/Users/obot/.claude/scripts/`
**Crontab Active**: 4 scheduled jobs for continuous improvement
**Cross-Session Persistence**: ✅ All capabilities will persist between sessions
**Methodology Impact**: Claude now has fully autonomous self-improvement with human oversight

### [2025-07-08] - PERFORMANCE REVIEW AUTOMATION SYSTEM
**Finding**: Automated performance tracking aligned with THG framework implemented
**Components**: Achievement tracking, CV data automation, monthly summaries, THG framework alignment
**THG Categories Tracked**: Deliverables, Ambition, Innovation, Decisiveness (where applicable to computer-based work)
**Automation Schedule**: Weekly summaries (Friday 5PM), Monthly CV reminders (First Monday)
**CV Data**: Clean, qualifier-free achievement descriptions for professional use
**Files Created**: Monthly achievements log, skills/CV data, deliverables JSON tracking
**Integration**: Automatic tracking after task completion, achievement detection from Claude interactions
**Methodology Impact**: Professional development now automatically documented for performance reviews

### [2025-07-08] - COMPLETE BACKUP AND CONTINUITY SYSTEM
**Finding**: Comprehensive backup system enabling full Claude knowledge transfer implemented
**Components**: GitHub integration, automated backup detection, restoration scripts, knowledge continuity
**Backup Scope**: Complete CLAUDE.md, scripts, performance data, learning patterns, methodology evolution
**Automation**: Every 4 hours change detection, daily backup verification, secure GitHub sync
**Restoration**: One-command setup for new Claude instances with complete knowledge transfer
**Security**: GitHub token encryption, sensitive data filtering, private repository support
**Continuity Features**: Learning patterns, performance achievements, professional development data
**Knowledge Transfer**: New Claude instances can seamlessly continue from previous knowledge
**Repository Structure**: Documentation, setup scripts, automated restoration, version control
**Methodology Impact**: Claude knowledge now fully portable and continuously preserved across instances

## Automatic Learning Integration

### Before Each Task
1. **Check for updates**: See "Self-Update Management" section below
2. **Check CLAUDE.md file sizes**: Daily size monitoring per file management guidelines
3. **Run meta-analysis if due**: Check if weekly meta-analysis is needed: `/Users/obot/.claude/scripts/claude-meta-analysis.sh`
4. **Load verification checklists**: Activate automated verification for task type
5. **Read this CLAUDE.md file** to understand current methodology
6. **Review recent learning log** for relevant patterns
7. **Apply established patterns** and avoid known pitfalls

### During Task Execution
1. **Document uncertainties** as they arise
2. **Stop and ask** when contradictions are found
3. **Reference this file** when making decisions

### After Task Completion
1. **Document new learnings** in the learning log
2. **Update methodology** if patterns have changed
3. **Track achievement** for performance review using `/Users/obot/.claude/scripts/claude-achievement-tracker.sh`
4. **Ask user** if instructions should be revised

## Self-Update Management

### Update Tracking
**Last Update Check**: [To be managed automatically]
**Update Frequency**: Every 2 days
**Last Claude Code Version**: [To be detected automatically]

### Update Check Process
Claude should check for updates when:
1. **2+ days since last update check**
2. **Starting a new session** (if update window has passed)
3. **User explicitly requests update check**

### Update Check Implementation
```bash
# Check current Claude Code version
claude_version=$(claude --version 2>/dev/null | head -1 || echo "Unknown")

# Get current date for comparison
current_date=$(date +%Y-%m-%d)

# Check if we need to update (implement date comparison)
should_check_updates() {
    local last_check_file="/Users/obot/.claude/last_update_check"
    local last_check_date=""
    
    if [ -f "$last_check_file" ]; then
        last_check_date=$(cat "$last_check_file")
    fi
    
    # Calculate days since last check
    if [ -n "$last_check_date" ]; then
        local days_diff=$(( ($(date -d "$current_date" +%s) - $(date -d "$last_check_date" +%s)) / 86400 ))
        [ $days_diff -ge 2 ]
    else
        true  # Never checked before
    fi
}
```

### Update Research Process
When checking for updates, Claude should:

1. **Web search for latest Claude Code releases**:
   - Check GitHub releases: `https://github.com/anthropics/claude-code`
   - Search for "Claude Code latest release" or "Claude Code changelog"
   - Look for new features, bug fixes, performance improvements

2. **Analyze release notes** for beneficial features:
   - New tools or capabilities
   - Performance improvements
   - Bug fixes that might affect workflows
   - New integrations or language support

3. **Assess relevance to user**:
   - Based on project types worked on
   - Based on tools frequently used
   - Based on past pain points or limitations encountered

### Update Recommendation Process
```
When updates are found:
1. **Summarize key improvements**: "Claude Code X.Y.Z introduces [key features]"
2. **Highlight user benefits**: "Based on your [workflow/projects], these features could help: [specific benefits]"
3. **Provide installation guidance**: "To update: [step-by-step instructions]"
4. **Ask for permission**: "Would you like me to guide you through updating to the latest version?"
5. **Wait for confirmation** before proceeding
```

### Update Installation Guidance
```
When user confirms update:
1. **Backup current state**: "Let me help you backup your current configuration..."
2. **Provide installation steps**: Platform-specific update commands
3. **Verify installation**: "Let's verify the update was successful..."
4. **Test new features**: "Would you like to try out the new [feature]?"
5. **Update tracking**: Record successful update date and version
```

### Self-Improvement Research
Every update check should also include:

1. **Prompt engineering research**:
   - Search for "Claude prompt engineering best practices 2024"
   - Look for new techniques or methodologies
   - Research "AI coding assistant improvement techniques"

2. **Methodology improvements**:
   - Search for "software development workflow optimization"
   - Look for new testing patterns or practices
   - Research "code review automation improvements"

3. **Integration improvements**:
   - Search for new tools that integrate with Claude Code
   - Look for workflow automation opportunities
   - Research IDE integration improvements

### Update Log Template
```markdown
## UPDATE LOG

### [Date] - Version Check
**Claude Code Version**: [Current] → [Available]
**Key New Features**: [List of relevant features]
**Recommended**: YES/NO
**User Decision**: [Updated/Postponed/Declined]
**Benefits Identified**: [Specific to user's workflow]

### [Date] - Self-Improvement Research
**Prompt Engineering**: [New techniques found]
**Methodology Updates**: [New practices discovered]
**Integration Opportunities**: [New tools or workflows]
**Applied Changes**: [What was updated in this CLAUDE.md]
```

### Auto-Update Commands
Create convenience script at `/Users/obot/.claude/check-updates.sh`:

```bash
#!/bin/bash

check_claude_updates() {
    echo "🔍 Checking for Claude Code updates..."
    
    # Record check date
    echo "$(date +%Y-%m-%d)" > /Users/obot/.claude/last_update_check
    
    # Get current version
    current_version=$(claude --version 2>/dev/null | head -1 || echo "Unknown")
    echo "📱 Current version: $current_version"
    
    echo "🌐 Researching latest releases and improvements..."
    echo "   Use web search to:"
    echo "   - Check GitHub releases"
    echo "   - Research new features"
    echo "   - Find prompt engineering improvements"
    echo "   - Look for workflow optimizations"
    
    echo "✅ Update check logged. Claude will analyze and recommend updates."
}

check_claude_updates
```

## PR Review Framework

### Review Philosophy
Claude should provide thorough, constructive PR reviews that:
1. **Follow established conventions** specific to each project
2. **Learn from feedback** and improve review quality over time
3. **Catch issues early** before they reach production
4. **Suggest improvements** rather than just pointing out problems
5. **Maintain consistency** with team standards and practices

### PR Review Process

#### Phase 1: Initial Analysis (MANDATORY)
```
When given a PR to review:
1. **Read project-specific review guidelines** from local CLAUDE.md
2. **Identify PR type**: Feature, bugfix, refactor, test, documentation
3. **Understand scope**: Files changed, lines added/removed, complexity
4. **Check description**: Does it explain what/why clearly?
5. **Verify requirements**: Are linked issues/tickets addressed?
```

#### Phase 2: Code Quality Review
```
For each changed file:
1. **Architecture adherence**: Follows project patterns and conventions
2. **Code style consistency**: Matches existing formatting and naming
3. **Error handling**: Appropriate exception handling and logging
4. **Performance considerations**: No obvious performance issues
5. **Security implications**: No security vulnerabilities introduced
6. **Test coverage**: Adequate tests for new/changed functionality
```

#### Phase 3: Deep Technical Analysis
```
Advanced checks:
1. **Design patterns**: Appropriate use of established patterns
2. **Coupling and cohesion**: Good separation of concerns
3. **Scalability**: Will this work at scale?
4. **Maintainability**: Is the code readable and maintainable?
5. **Edge cases**: Are error conditions and edge cases handled?
6. **Documentation**: Are complex parts documented?
```

#### Phase 4: Project-Specific Checks
```
Read from local CLAUDE.md:
1. **Build commands**: Verify build/test commands if applicable
2. **Specific conventions**: Project-specific naming, patterns, tools
3. **Required checks**: Mandatory validations (schema updates, migrations, etc.)
4. **Team preferences**: Learned preferences from previous reviews
```

### Review Output Format

#### Review Summary Template
```markdown
## PR Review Summary

**PR Type**: [Feature/Bugfix/Refactor/Test/Documentation]
**Scope**: [Brief description of changes]
**Complexity**: [Low/Medium/High]
**Risk Level**: [Low/Medium/High]

### ✅ Strengths
- [List positive aspects]
- [Good practices followed]
- [Well-implemented features]

### ⚠️ Issues Found
#### 🔴 Critical Issues (Must Fix)
- [Security vulnerabilities]
- [Breaking changes]
- [Major bugs]

#### 🟡 Suggestions (Should Fix)
- [Code style issues]
- [Performance improvements]
- [Better practices]

#### 🔵 Nitpicks (Consider)
- [Minor style preferences]
- [Optional improvements]

### 🧪 Testing
- [Test coverage assessment]
- [Missing test scenarios]
- [Test quality evaluation]

### 📚 Documentation
- [Documentation needs]
- [Code comment suggestions]

### 🏗️ Architecture
- [Design pattern usage]
- [Architectural concerns]
- [Future maintainability]

### ✅ Approval Status
**Recommendation**: [APPROVE/REQUEST_CHANGES/COMMENT]
**Rationale**: [Why this recommendation]
```

### Learning System for Reviews

#### Review Quality Tracking
```
After each review, track:
1. **Issues found vs missed**: Were there issues not caught?
2. **False positives**: Were "issues" actually acceptable?
3. **Team feedback**: How did the team respond to the review?
4. **Convention updates**: Did the review reveal new conventions?
```

#### Continuous Learning Process
```
When review patterns emerge:
1. **Detect new conventions**: "I notice this pattern is always preferred"
2. **Ask for confirmation**: "Should I add this to review guidelines?"
3. **Update guidelines**: Add to project-specific CLAUDE.md
4. **Promote to global**: Ask if it should be a universal practice
```

### Project-Specific Review Configuration
Each project's CLAUDE.md should include:

```markdown
## PR Review Configuration

### Review Priorities
**Critical**: [Security, breaking changes, etc.]
**Important**: [Performance, maintainability, etc.]
**Preferences**: [Team style preferences]

### Code Conventions
**Naming**: [Specific naming conventions]
**Structure**: [File organization patterns]
**Error Handling**: [Preferred exception patterns]
**Logging**: [Logging standards and formats]
**Testing**: [Test structure and coverage expectations]

### Automated Checks
**Build Command**: [Command to verify build]
**Test Command**: [Command to run tests]
**Lint Command**: [Command for style checking]
**Security Scan**: [Security validation steps]

### Review Learning Log
### [Date] - [Convention/Pattern]
**Finding**: [What was learned]
**Context**: [From which PR/review]
**Application**: [How to apply in future reviews]
**Scope**: LOCAL/GLOBAL
```

### Review Automation Integration
```
When reviewing a PR:
1. **Check if build/test automation is needed**
2. **Offer to run automated checks**: "Should I run the full test suite?"
3. **Validate with project tools**: Use linting, testing, security scanning
4. **Report automation results**: Include in review summary
```

### Commit Message Cleanup
```
When creating commit messages:
1. **Remove all Claude attribution**: Never include "Generated with Claude Code" or "Co-Authored-By: Claude" when user asks for commit with original message
2. **Use user's original message**: When user specifically requests using their original commit message, use it exactly as provided
3. **Only add Claude attribution for new commits**: Only include Claude attribution when creating new commits, not when preserving user's original work
4. **Respect user intent**: If user wants their original message preserved, don't modify it with Claude branding
```

### Advanced Review Techniques

#### Security Review Checklist
- Input validation and sanitization
- Authentication and authorization
- SQL injection prevention
- XSS prevention
- Secure data handling
- Dependency vulnerabilities

#### Performance Review Checklist
- Database query efficiency
- Caching strategy
- Memory usage patterns
- Algorithm complexity
- Network call optimization
- Resource cleanup

#### Maintainability Review Checklist
- Code readability and clarity
- Proper abstraction levels
- Documentation completeness
- Error message quality
- Configuration management
- Dependency management

### Review Learning Examples
```markdown
### [Date] - Exception Handling Pattern
**Finding**: Team prefers specific exception wrapping pattern
**Context**: Multiple PRs showed same pattern
**Application**: Always check for consistent DownstreamClientException usage
**Scope**: LOCAL

### [Date] - Test Assertion Style
**Finding**: Team uses Hamcrest matchers consistently
**Context**: Style feedback on multiple test PRs
**Application**: Suggest Hamcrest over assertEquals in reviews
**Scope**: GLOBAL
```

## Workflow Automation Framework

### Automation Philosophy
Claude should learn and automate commonly used command sequences to minimize interruptions and improve efficiency.

### Command Pattern Detection
Claude should track and identify patterns:
1. **Sequence frequency**: Commands often run together
2. **Context triggers**: When certain commands are typically needed
3. **Error recovery**: Common failure points and recovery steps
4. **User confirmation points**: Where approval is always required

### Automation Script Management
**Global Scripts Directory**: `/Users/obot/.claude/scripts/`
**Project Scripts**: Reference global scripts from local CLAUDE.md
**Naming Convention**: `{project-name}-{workflow-name}.sh`

### Script Creation Process
```
When creating new automation:
1. **Detect pattern**: "I notice you often run [command sequence]. Should I automate this?"
2. **Define workflow**: Outline steps and confirmation points
3. **Create script**: Generate with error handling and logging
4. **Test with user**: Run through workflow with confirmation
5. **Learn from errors**: Update script based on failures (with permission)
6. **Document usage**: Add to project CLAUDE.md
```

### Error Learning System
```
When automation fails:
1. **Capture error context**: Command, output, environment
2. **Analyze failure point**: Which step failed and why
3. **Research solutions**: Web search for common fixes
4. **Propose improvements**: "I found the issue. Can I update the script to handle [error]?"
5. **Wait for permission**: Never auto-update without approval
6. **Document learning**: Add to both global and project learning logs
```

### Automation Templates

#### Full Integration Test Template
```bash
#!/bin/bash

# Project: {{PROJECT_NAME}}
# Workflow: Full Integration Test
# Generated: {{DATE}}

set -e  # Exit on any error

PROJECT_NAME="{{PROJECT_NAME}}"
CONTAINER_NAME="{{CONTAINER_NAME}}"
GRAPHQL_URL="{{GRAPHQL_URL}}"

log() {
    echo "🔄 [$PROJECT_NAME] $1"
}

error() {
    echo "❌ [$PROJECT_NAME] $1"
    exit 1
}

success() {
    echo "✅ [$PROJECT_NAME] $1"
}

# Step 1: Schema regeneration (if applicable)
schema_regen() {
    if [ -f "build.gradle" ] && grep -q "graphqlCodegen" build.gradle; then
        log "Regenerating GraphQL schema..."
        ./gradlew clean graphqlCodegen || error "Schema generation failed"
        success "Schema regenerated"
    fi
}

# Step 2: Code quality check
quality_check() {
    log "Running code quality checks..."
    {{QUALITY_COMMAND}} || error "Quality checks failed"
    success "Quality checks passed"
}

# Step 3: Docker cleanup
docker_cleanup() {
    log "Checking for existing containers..."
    existing=$(docker ps -q --filter "name=$CONTAINER_NAME" 2>/dev/null || true)
    if [ -n "$existing" ]; then
        log "Stopping existing $CONTAINER_NAME containers..."
        docker stop $existing
        docker rm $existing
        success "Cleaned up existing containers"
    else
        log "No existing containers found"
    fi
}

# Step 4: Build and run
build_and_run() {
    log "Building and running Docker image..."
    {{BUILD_COMMAND}} || error "Docker build failed"
    success "Docker container started"
}

# Step 5: Wait for startup and show logs
monitor_startup() {
    log "Monitoring container startup..."
    sleep 5
    
    # Follow logs in background
    docker logs -f $CONTAINER_NAME &
    LOG_PID=$!
    
    # Wait for service to be ready
    local retries=30
    while [ $retries -gt 0 ]; do
        if curl -s "$GRAPHQL_URL" >/dev/null 2>&1; then
            success "Service is ready at $GRAPHQL_URL"
            return 0
        fi
        log "Waiting for service... ($retries retries left)"
        sleep 2
        retries=$((retries - 1))
    done
    
    error "Service failed to start within timeout"
}

# Main execution
main() {
    log "Starting full integration test workflow..."
    
    schema_regen
    quality_check
    docker_cleanup
    build_and_run
    monitor_startup
    
    success "Full integration test setup complete!"
    log "GraphQL endpoint: $GRAPHQL_URL"
    log "Logs are being followed in background (PID: $LOG_PID)"
    log "Press Ctrl+C to stop log monitoring"
    
    # Keep logs visible
    wait $LOG_PID
}

# Run if executed directly
if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
    main "$@"
fi
```

### Project-Specific Script Configuration
Each project's CLAUDE.md should define:
```markdown
### Automation Configuration
**Container Name**: horizon-graphql-api
**GraphQL URL**: http://localhost:8080/graphql
**Quality Command**: ./gradlew check -x dependencyCheckAnalyze -x dependencyCheckParse -x test
**Build Command**: ./gradlew clean buildAndRunDockerImage
**Schema Command**: ./gradlew clean graphqlCodegen

### Automation Scripts
**Full Integration Test**: `/Users/obot/.claude/scripts/horizon-full-test.sh`
```

### Usage Instructions for Claude
```
When user mentions needing comprehensive testing:
1. **Check for automation**: Look for existing workflow scripts
2. **Offer automation**: "Should I run the full integration test workflow?"
3. **Execute with confirmation**: Run each major step with status updates
4. **Monitor and report**: Provide real-time feedback on progress
5. **Handle errors gracefully**: Pause on failures, offer solutions
6. **Learn from issues**: Propose script improvements if errors occur
```

### PR Review Usage Instructions for Claude
```
When user provides a PR for review:
1. **Run PR analysis helper**: /Users/obot/.claude/scripts/pr-review-helper.sh <PR_URL>
2. **Read analysis output**: /tmp/pr_analysis.md for PR context
3. **Read project configuration**: ./CLAUDE.md for project-specific conventions
4. **Fetch PR content**: Use gh pr diff or WebFetch to get actual changes
5. **Apply review framework**: Follow the 4-phase review process
6. **Generate structured review**: Use the review template format
7. **Suggest automation**: Offer to run build/test/lint if needed
8. **Learn from feedback**: Update review guidelines based on responses
```

### PR Review Example Usage
```
User: "Please review this PR: https://github.com/THG-Engagement/horizon-graphql-api/pull/123"

Claude process:
1. Run: /Users/obot/.claude/scripts/pr-review-helper.sh https://github.com/THG-Engagement/horizon-graphql-api/pull/123
2. Read: /tmp/pr_analysis.md and ./CLAUDE.md
3. Fetch PR diff and analyze code changes
4. Apply Horizon-specific review guidelines
5. Generate comprehensive review with categorized issues
6. Offer: "Should I run the automated checks (build/test/lint)?"
7. Learn: Update review guidelines based on any new patterns found
```

## Project-Specific Learning Management

### Local CLAUDE.md Creation and Management

#### 4.1 Automatic Project Setup
When entering a new project directory, Claude should:

1. **Check for existing local CLAUDE.md**: `Read ./CLAUDE.md` 
2. **If none exists, create one**: Use the template below
3. **Immediately untrack from git**: Add to `.gitignore` and remove from tracking
4. **Initialize project-specific learning**: Start documenting patterns unique to this project

#### 4.2 Local CLAUDE.md Template
```markdown
# CLAUDE.md - Project-Specific Configuration

**Global Methodology**: See `/Users/obot/.claude/CLAUDE.md` for the complete development methodology.
**Project**: [Auto-detect from directory name or git remote]
**Created**: [Date]

## Project-Specific Patterns

### Build and Test Commands
- **Build**: [Auto-detect from package.json, build.gradle, Makefile, etc.]
- **Test**: [Auto-detect test commands]
- **Lint**: [Auto-detect linting commands]

### Code Style and Conventions
[Learn from codebase analysis]

### Architecture Patterns
[Document specific patterns found in this project]

## Project-Specific Learnings

### [Topic] - [Date]
**Finding**: [What was learned]
**Pattern**: [Specific to this project]
**Scope**: LOCAL/GLOBAL [Whether this should be promoted to global]
```

#### 4.3 Git Ignore Management
Claude should ensure CLAUDE.md is not committed WITHOUT modifying the project's .gitignore:

```bash
# Use git's local exclude file instead of modifying .gitignore
# This prevents unrelated changes to the project
git_dir=$(git rev-parse --git-dir 2>/dev/null)
if [ -n "$git_dir" ]; then
    exclude_file="$git_dir/info/exclude"
    
    # Add CLAUDE.md to local exclude if not already present
    if [ ! -f "$exclude_file" ] || ! grep -qxF "CLAUDE.md" "$exclude_file"; then
        echo "CLAUDE.md" >> "$exclude_file"
    fi
    
    # Remove from git tracking if already tracked
    git rm --cached CLAUDE.md 2>/dev/null || true
fi
```

**Why this approach is better:**
- `.git/info/exclude` works like `.gitignore` but is local-only
- No changes to the project's actual `.gitignore` file
- No unrelated modifications in your commits/PRs
- CLAUDE.md is still ignored by git

#### 4.4 Learning Classification System
When documenting learnings, Claude should classify them:

**LOCAL (Project-specific)**:
- Build/test commands specific to this project
- Framework-specific patterns (React vs Vue vs Angular)
- Project-specific naming conventions
- Codebase-specific architecture patterns
- Team-specific preferences learned from code reviews

**GLOBAL (Transferable)**:
- General development principles
- Common anti-patterns across projects
- Universal testing patterns
- General error handling principles
- Communication patterns with humans

#### 4.5 Learning Promotion Process
```
When adding a learning:
1. Classify as LOCAL or GLOBAL
2. If GLOBAL: Ask user "Should this learning be promoted to global CLAUDE.md?"
3. If confirmed: Add to global learning log
4. If LOCAL: Keep in project-specific file only
```

### Automated Setup Script

Create this as a reusable setup script at `/Users/obot/.claude/setup-project.sh`:

```bash
#!/bin/bash

# Auto-setup project-specific CLAUDE.md
setup_project_claude() {
    local project_dir=$(pwd)
    local project_name=$(basename "$project_dir")
    
    # Detect project type and build commands
    local build_cmd="[To be detected]"
    local test_cmd="[To be detected]"
    local lint_cmd="[To be detected]"
    
    if [ -f "package.json" ]; then
        build_cmd="npm run build"
        test_cmd="npm test"
        lint_cmd="npm run lint"
    elif [ -f "build.gradle" ] || [ -f "build.gradle.kts" ]; then
        build_cmd="./gradlew build"
        test_cmd="./gradlew test"
        lint_cmd="./gradlew check"
    elif [ -f "Makefile" ]; then
        build_cmd="make"
        test_cmd="make test"
        lint_cmd="make lint"
    elif [ -f "pom.xml" ]; then
        build_cmd="mvn compile"
        test_cmd="mvn test"
        lint_cmd="mvn checkstyle:check"
    fi
    
    # Create CLAUDE.md if it doesn't exist
    if [ ! -f "CLAUDE.md" ]; then
        cat > CLAUDE.md << EOF
# CLAUDE.md - Project-Specific Configuration

**Global Methodology**: See \`/Users/obot/.claude/CLAUDE.md\` for the complete development methodology.
**Project**: $project_name
**Created**: $(date +%Y-%m-%d)

## Project-Specific Patterns

### Build and Test Commands
- **Build**: \`$build_cmd\`
- **Test**: \`$test_cmd\`
- **Lint**: \`$lint_cmd\`

### Code Style and Conventions
[To be learned from codebase analysis]

### Architecture Patterns
[To be documented from project exploration]

## Project-Specific Learnings

### Initial Setup - $(date +%Y-%m-%d)
**Finding**: Project auto-setup completed
**Pattern**: Using detected build system
**Scope**: LOCAL
EOF
    fi
    
    # Use git's local exclude file (doesn't modify project .gitignore)
    git_dir=$(git rev-parse --git-dir 2>/dev/null)
    if [ -n "$git_dir" ]; then
        exclude_file="$git_dir/info/exclude"
        
        # Add CLAUDE.md to local exclude if not already present
        if [ ! -f "$exclude_file" ] || ! grep -qxF "CLAUDE.md" "$exclude_file"; then
            echo "CLAUDE.md" >> "$exclude_file"
        fi
        
        # Remove from git tracking if already tracked
        git rm --cached CLAUDE.md 2>/dev/null || true
    fi
    
    echo "✅ Project-specific CLAUDE.md setup complete"
    echo "📁 Location: $(pwd)/CLAUDE.md"
    echo "🚫 Added to local git exclude to prevent commits"
}

# Run setup
setup_project_claude
```

#### 4.6 Claude Instructions for Project Management

**At the start of every session:**
1. **Read global CLAUDE.md**: `/Users/obot/.claude/CLAUDE.md`
2. **Check for local CLAUDE.md**: `./CLAUDE.md`
3. **If no local file exists**: Create one using the template and run git ignore setup
4. **Load project context**: Understand project-specific patterns and previous learnings

**During work:**
1. **Document new learnings**: Classify as LOCAL or GLOBAL
2. **Update appropriate file**: Local patterns to `./CLAUDE.md`, global principles to `/Users/obot/.claude/CLAUDE.md`
3. **Ask for promotion**: When LOCAL learnings might be GLOBAL

**Before ending session:**
1. **Update learning logs**: Document what was learned
2. **Verify git ignore**: Ensure CLAUDE.md won't be committed
3. **Suggest global updates**: If significant transferable learnings occurred

## Usage Instructions

### For PR Analysis:
```
Given PR: [URL or description]

1. Execute Phase 1: Deep Understanding (use Task tool extensively)
2. Trace complete execution flow
3. Document findings with specific file:line references
4. Respond to comments using Phase 3 protocol
5. Update learning log with new insights
```

### For Implementation:
```
Given Feature Request: [Description]

1. Research existing patterns (Phase 1)
2. Create TodoWrite plan (Phase 2)
3. Implement following established patterns
4. Add comprehensive tests (Phase 4)
5. Verify quality and run checks
6. Document learnings
```

### For Learning Updates:
```
When contradiction found:
1. STOP current work
2. Document contradiction clearly
3. Ask user: "Found contradiction: [details]. How should I proceed?"
4. Wait for guidance
5. Ask: "Should I update CLAUDE.md based on this learning?"
6. Update methodology if confirmed
```

---

**Remember**: This file is your memory across all sessions. Trust it, but verify against the current codebase. When in doubt, investigate thoroughly and ask for user guidance.