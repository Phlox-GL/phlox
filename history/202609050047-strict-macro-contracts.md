# 2026-09-05 00:47 UTC Strict macro contracts

Agent / 身份: `codex-01a06771-786-phlox-4d2a`

## English

- Migrated `inline-file`, `dev-check`, `dev-check-message`, and `defcomp` through the Calcit 0.13.51 compatibility window into complete strict `Macro` contracts without changing their expansions.
- Declared the compile-time filesystem-read capability on `inline-file`; the no-op development checks expand to `Nil`, and `defcomp` expands to an `Fn` definition.
- Aligned Calcit and `@calcit/procs` exactly at 0.13.77 and added Linux validation for canonical formatting, check-only mode, attached tests, JavaScript generation, and the Vite build.
- Kept pull-request validation credential-free and restricted the verified-host deployment to successful pushes on `main`.

## 中文

- 经由 Calcit 0.13.51 兼容窗口，将 `inline-file`、`dev-check`、`dev-check-message` 与 `defcomp` 迁移为完整严格的 `Macro` 契约，不改变宏展开行为。
- 为 `inline-file` 声明编译期文件读取能力；开发检查宏展开为 `Nil`，`defcomp` 展开为 `Fn` 定义。
- 将 Calcit 与 `@calcit/procs` 精确对齐到 0.13.77，并在 Linux 验证规范格式、check-only、附着测试、JavaScript 生成与 Vite 构建。
- PR 验证不接触部署凭据；仅在 `main` push 验证成功后执行带主机密钥校验的部署。
