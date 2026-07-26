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

Hop requires macOS 14 or newer. It is not notarized because Apple Developer
Program membership is unavailable to the author. On macOS 15 or newer, try
to open Hop once, then go to **System Settings → Privacy & Security → Open
Anyway** and confirm **Open**. The source is public, and built-in updates are
verified with Ed25519.
