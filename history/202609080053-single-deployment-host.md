# Enforce a single deployment host / 校验唯一部署 host

Follow-up to PR #53 review and calcit-lang/calcit#786.

The existing check counted only tiye.me lines, so an additional unrelated
host entry could pass validation. Count every nonblank, noncomment record
first and require exactly one, then retain the existing tiye.me count and
ED25519 fingerprint checks. No host key, secret or deployment destination
changes. 本次补齐全部 host 记录计数，保留现有主机名与指纹校验。

Validation: extracted workflow shell accepts the checked-in key and rejects
an extra unrelated host, duplicate target, and empty file. Comment and blank
lines remain accepted. Existing Calcit/build/deployment gates are unchanged;
GitHub Actions validates the complete workflow. git diff --check passes.
验证提取出的实际 shell，覆盖正常、重复、额外主机及空文件分支。
