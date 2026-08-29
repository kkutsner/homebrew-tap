# Homebrew Tap

Homebrew formulae for software maintained by
[kkutsner](https://github.com/kkutsner).

## Kvim

Kvim is distributed as native Apple Silicon and Intel macOS binaries. Its
releases are private, so your GitHub account must have access to
[`kkutsner/kvim`](https://github.com/kkutsner/kvim).

Authenticate with GitHub CLI, then install Kvim:

```sh
brew install gh
gh auth login
brew install kkutsner/tap/kvim
```

The formula reads the token managed by GitHub CLI. For non-interactive use,
provide an authorized token through `HOMEBREW_GITHUB_API_TOKEN`.
