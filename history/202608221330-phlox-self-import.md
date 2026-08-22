# Phlox self-import cleanup

- Removed `phlox.core/` qualification from references inside the `phlox.core` namespace.
- This prevents JS codegen from emitting imports from `phlox.core.mjs` back into itself.
- Verified Calcit 0.13.29 check-only and JS codegen; the generated `phlox.core.mjs` no longer contains self-imports.
