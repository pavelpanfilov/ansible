# Global instructions

## Terraform
- Only run `terraform init`, `terraform validate` and `terraform plan`.
- Never run `apply`, `destroy`, `import`, `state` or `taint`, or any other command that changes state or infrastructure. If a change needs one, give me the command and I'll run it.

## Code style
- Keep code comments to a bare minimum. Comment only when the reason isn't obvious; never restate what the code does.
- Be short and concise in code and in replies.

## GitHub PRs
- Never commit, push or create PRs on your own. When changes are ready, ask whether I want you to create a PR or review them locally (uncommitted).
- Keep PR descriptions short and concise.
- Add reference links where possible (e.g. failed pipeline runs, error log examples).
