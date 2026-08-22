# Phlox math self-import cleanup

- Removed the remaining `phlox.math/` self-qualified reference from `radian-ratio`.
- This keeps JS codegen free of self-imports in the math module as well as the core module.
- Verified Calcit 0.13.29 check-only after the change.
