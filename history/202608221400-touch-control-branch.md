# touch-control Calcit 0.13.29 branch dependency

- Phlox's 0.13.29 migration now resolves the validated `Triadica/touch-control` migration branch.
- This keeps downstream projects on the same typed FFI boundary instead of pulling the legacy Quatrefoil module through a second module path.
- The dependency is temporary until the touch-control migration is merged and released.
