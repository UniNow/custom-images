# kratos

[Ory Kratos](https://github.com/ory/kratos) built from the upstream release tag with the UniNow patch
(`uninow.patch`) applied on top. The image is built with Kratos' own `.docker/Dockerfile-build`.

The patch contains:

- `capture_last_tokens` per OIDC provider: on every successful login the latest `last_id_token`,
  `last_access_token` and `last_refresh_token` are stored on the identity's OIDC credentials
  (`initial_*` stay untouched). campus365 reads these tokens. Follows the design of
  [ory/kratos#4447](https://github.com/ory/kratos/pull/4447), which Ory plans to ship in a future release.
- `feature_flags.password_profile_registration_node_group` is read from where the config schema defines it
  (upstream reads `selfservice.methods.password.config...`, declined in
  [ory/kratos#4499](https://github.com/ory/kratos/pull/4499)).
- `update_identity_on_login` per OIDC provider (`never` by default, or `automatic`): on every OIDC login
  the Jsonnet claims mapper is re-evaluated and the identity's traits and metadata are updated if they
  changed. Traits the mapper does not output are preserved. Backported from upstream `master`
  (`4fcb2999a`) together with its follow-up fix `f771a1dae`, which seeds the `identity` extVar so a
  mapper may read `std.extVar('identity')` during registration as well. No Ory release ships this yet.
- Tests, snapshots and an e2e spec for the above, so the patch can be rebased with its tests.

## Usage

```bash
docker pull ghcr.io/uninow/kratos:VERSION
```

Every build pushes two tags: the upstream version (`v26.2.0`, moving, always the latest build for that
release) and a unique tag with the short commit SHA of this repository (`v26.2.0-1a2b3c4`). Use the
unique tag in campus365 (`deploy/kustomize/base/kratos/kustomization.yaml`) so Argo sees a change.
`kratos version` inside the container prints the unique tag and the commit.

## How the version is bumped

Renovate watches the `KRATOS_VERSION` in `.github/workflows/kratos.yaml` (GitHub releases of `ory/kratos`)
and opens a pull request. The pull request build applies the patch and compiles the image for amd64
without pushing. If the patch no longer applies, the build fails and the patch has to be rebased first.

Merging a bump only builds the image. Rolling it out is a separate step in campus365 (image tag bump,
`kratos migrate sql` runs in the init container, staging first).

## How to rebase the patch

The patch is maintained as a branch in the fork [UniNow/kratos](https://github.com/UniNow/kratos)
(currently `uninow-v26.2.0`, six commits on top of the tag `v26.2.0`).

1. In the fork, create a branch from the new release tag and cherry-pick the commits of the previous
   patch branch (or rebase the branch with `git rebase --onto vNEW vOLD`). Resolve conflicts, run
   `go build -tags sqlite ./...` and the tests of `identity` and `selfservice/strategy/oidc`
   (`go test -tags sqlite ...`, snapshots via `UPDATE_SNAPSHOTS=true`).
2. Regenerate the patch and copy it here:

   ```bash
   git diff vNEW uninow-vNEW > /path/to/custom-images/kratos/uninow.patch
   ```

3. Bump `KRATOS_VERSION` in `.github/workflows/kratos.yaml` (or take Renovate's pull request) and commit
   both together.
