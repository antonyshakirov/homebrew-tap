# Homebrew tap

Homebrew casks maintained by Anton Shakirov.

## Hop

Install [Hop](https://github.com/antonyshakirov/hop):

```sh
brew install --cask antonyshakirov/tap/hop
```

Upgrade:

```sh
brew upgrade --cask antonyshakirov/tap/hop
```

Uninstall the app while keeping its settings and data:

```sh
brew uninstall --cask antonyshakirov/tap/hop
```

To remove the app and its saved settings and Application Support data:

```sh
brew uninstall --cask --zap antonyshakirov/tap/hop
```

Hop requires macOS 14 or newer. It is signed with an Apple Developer ID and
notarized by Apple, so macOS opens it like any other app. The source is
public, and built-in updates are verified with Ed25519. Upgrading from a
version before 1.9.1: the signature changed, so macOS sees a new app and asks
for Hop's permissions again.
