# Clear Phlox-owned Calcit check warnings

- Add concrete defaults at legacy map and list boundaries before numeric and collection operations.
- Guard dynamically supplied event listeners and provide safe no-op callback defaults where the existing component contracts require callbacks.
- Normalize missing alignment values to a tag and preserve empty-list behavior for optional geometry, messages, and keyboard children.
- Convert mapped property pairs back to a list before constructing a map under Calcit 0.13.77 collection contracts.
- Keep the four strict macro contracts unchanged.
