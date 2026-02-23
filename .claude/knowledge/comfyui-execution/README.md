# Hanzo Studio Execution System

This folder contains knowledge about Hanzo Studio's execution and validation systems.

## Files

- **validation-flow.md**: Sequential validation order and timing dependencies
- **VALIDATE_INPUTS.md**: Custom validation implementation patterns and examples

## Key Concepts

- **Validation Timing**: Static validation must pass before custom validation runs
- **Input Types**: String types vs list types have different validation paths  
- **Custom Validation**: VALIDATE_INPUTS provides runtime validation with full context
- **Execution Order**: Understanding the pipeline prevents debugging confusion

## Related Knowledge

- See `hanzo-studio-terminology/` for basic Hanzo Studio concepts
- See `custom-node-descrips/` for node development patterns