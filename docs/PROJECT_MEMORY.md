# Project Memory

## Goal

Back up restore materials for the globally installed `@google/gemini-cli` package.

## Boundaries

- Store install recipes, exact version metadata, lockfile, tarball, scripts, tests, and docs.
- Do not store credentials, tokens, browser state, npm auth files, keychain data, or account session state.

## Commands

- Restore: `bash scripts/install-gemini-cli.sh`
- Verify: `bash scripts/verify-gemini-cli.sh`
- Test: `npm test`
- Create Clash Verge Rev local mirror bundle: `bash scripts/backup-github-repo.sh clash-verge-rev`

## External Repositories

- `clash-verge-rev`: `https://github.com/clash-verge-rev/clash-verge-rev.git`, default branch `dev`, captured HEAD `6a0cc2124478b8c2446397e8202acccbf651295a`. Local mirror bundle generated at `output/repo-bundles/clash-verge-rev.bundle`.
