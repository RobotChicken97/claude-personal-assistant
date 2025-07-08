# Global Development Knowledge and Patterns

**Purpose**: Shared development knowledge across all AI systems  
**Scope**: Universal programming patterns, methodologies, and practices

## Core Development Principles

### Code Quality Standards
- Follow existing codebase conventions
- Implement comprehensive error handling
- Write tests for all new functionality
- Document complex logic and decisions
- Use meaningful variable and function names

### Error Handling Patterns
- Trace complete exception flow before implementing handling
- Avoid redundant exception handling at multiple layers
- Implement graceful degradation where appropriate
- Log errors with sufficient context for debugging
- Use established patterns from the codebase

### Testing Methodologies
- Success tests should verify actual content, not just non-null
- Error tests should verify graceful fallback behavior
- Use consistent assertion patterns throughout codebase
- Verify both return values and service interactions
- Follow existing test naming and structure conventions

### Performance Optimization
- Profile before optimizing
- Use appropriate caching strategies
- Implement circuit breakers for external services
- Monitor and measure performance impacts
- Consider scalability implications

## Framework-Specific Knowledge

### Java/Spring Boot
- Use existing exception wrapping patterns (DownstreamClientException)
- Follow established service client patterns
- Implement proper retry logic for transient failures
- Use ThemisCache for service-level caching
- Maintain service interface contracts

### Git and Version Control
- Use conventional commit message formats
- Follow branching strategies established by team
- Use .git/info/exclude for local-only ignores
- Investigate original intent before fixing tool warnings
- Write clear, descriptive commit messages

## AI Methodology Guidelines

### Investigation and Analysis
1. **Deep understanding first**: Map complete execution flow
2. **Trace exception paths**: Understand error handling at all layers
3. **Research existing patterns**: Find similar implementations in codebase
4. **Verify assumptions**: Check actual usage vs assumed behavior
5. **Document findings**: Reference specific file:line locations

### Implementation Strategy
1. **Follow existing patterns**: Mimic established code style and conventions
2. **Comprehensive testing**: Cover both success and error scenarios
3. **Error handling**: Match existing exception handling patterns
4. **Quality checks**: Run lint, typecheck, and build commands
5. **Documentation**: Add clear comments for complex logic

### Learning and Improvement
1. **Document contradictions**: Stop and ask user when conflicts arise
2. **Update methodology**: Incorporate learnings into shared knowledge
3. **Cross-AI consistency**: Ensure patterns work across different AI systems
4. **Continuous verification**: Validate approaches against real-world results

