# 2026-09-05 15:00 — Release Phlox 0.7.7

## English

- Release the strict Calcit 0.13.77 macro contracts and the fixed `pointed-prompt` and `touch-control` dependency versions for downstream consumers.
- Pin the independently verified public `tiye.me` ED25519 host key in the repository so deployment does not depend on an unconfigured `rsync_known_hosts` secret.
- Require exactly one matching host entry and verify its SHA256 fingerprint before any deployment; keep the private deploy key in the existing secret.

## 中文

- 发布严格的 Calcit 0.13.77 宏契约，以及已修复的 `pointed-prompt` 与 `touch-control` 依赖版本，供下游项目使用。
- 在仓库中固定经独立验证的 `tiye.me` ED25519 公开主机密钥，使部署不再依赖未配置的 `rsync_known_hosts` secret。
- 部署前要求唯一匹配的 host 记录并校验其 SHA256 指纹；私有部署密钥继续保存在原有 secret 中。
