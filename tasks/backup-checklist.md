# Backup Checklist

1. Run `npm view @google/gemini-cli version --json`.
2. Update `package.json`, `config/config.yaml`, scripts, and tests if the version changes.
3. Run `npm pack @google/gemini-cli@<version> --pack-destination vendor`.
4. Rename the tarball to `google-gemini-cli-<version>.tgz`.
5. Run `npm install --package-lock-only`.
6. Run `npm test`.
7. Run `bash scripts/verify-gemini-cli.sh`.

## External Repository Backup

1. Run `git ls-remote --symref <repo-url> HEAD`.
2. Update `config/repositories.yaml`.
3. Run `bash scripts/backup-github-repo.sh <repo-id>` when a local mirror bundle is needed.
4. Keep large bundles in `output/repo-bundles/` unless explicit remote artifact storage is required.
