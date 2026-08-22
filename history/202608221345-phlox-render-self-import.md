# Phlox render self-import cleanup

- Removed `phlox.render/` self-qualified references from `update-children`.
- This prevents duplicate `first_value`/`last_value` declarations in the generated `phlox.render.mjs` module.
- Verified Calcit 0.13.29 check-only and JS codegen after the cleanup.
