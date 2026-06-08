# Gemini CLI Backup

This repository backs up the install recipe and restore materials for `@google/gemini-cli`.

## Current Backup

- Package: `@google/gemini-cli`
- Version: `0.45.2`
- CLI command: `gemini`
- Required Node.js: `>=20`
- Captured global npm prefix: `/Users/cc/.npm-global`
- Captured on: `2026-06-08`

## Restore

Install from the backed-up tarball:

```bash
bash scripts/install-gemini-cli.sh
```

Or install directly from npm with the pinned version:

```bash
npm install -g @google/gemini-cli@0.45.2
```

## Verify

```bash
bash scripts/verify-gemini-cli.sh
npm test
```

## Repository Layout

- `package.json` - pinned package metadata and test commands.
- `package-lock.json` - npm lockfile for dependency traceability.
- `vendor/` - npm package tarball backup.
- `scripts/` - restore, verify, and dev status helpers.
- `tests/` - smoke tests for backup integrity and CLI availability.
- `config/config.yaml` - non-secret backup metadata.
- `.env.example` - documented environment variables, no secrets.
- `tasks/` - operator checklist for future refreshes.
- `output/` - generated command output placeholder.
- `logs/` - runtime log placeholder.

## Notes

This repository intentionally does not back up credentials, browser login state, API keys, tokens, keychain data, npm auth files, or Gemini account state.

If `gemini` asks for authentication after restore, complete that login locally on the target machine.

## Troubleshooting

- `node: command not found`: install Node.js 20 or newer.
- `npm: command not found`: install npm with Node.js.
- `gemini: command not found`: ensure npm global bin is on `PATH`.
- Permission errors during global install: configure an npm user-level prefix, then retry.
