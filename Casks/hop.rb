cask "hop" do
  version "2.1.0"

  # One build per architecture: each carries only the code its own processor
  # runs, so neither download is heavier than it has to be.
  on_arm do
    sha256 "6a4ab528f799a652d8b53fecd26297e919da3964d82c1e67b77b32450f0c3e76"
    url "https://github.com/antonyshakirov/hop/releases/download/v#{version}/Hop.dmg"
  end
  on_intel do
    sha256 "2285da37e4fba44b01e238987b55e580440c78bd0c15a9227db7538bad968016"
    url "https://github.com/antonyshakirov/hop/releases/download/v#{version}/Hop-intel.dmg"
  end
  name "Hop"
  desc "Menu bar toolkit for macOS"
  homepage "https://github.com/antonyshakirov/hop"

  depends_on macos: :sonoma

  app "Hop.app"

  caveats <<~EOS
    Hop is signed with an Apple Developer ID and notarized by Apple, so macOS
    opens it like any other app. The source is public, and built-in updates
    are verified with Ed25519.

    Upgrading to 1.10.0: every permission is cleared once and asked for
    again. A permission belongs to a code signature, and Hop's changed when
    Apple signed it, so the ones granted to the old signature stayed in the
    list and quietly stopped working. From 1.10.0 on they survive an update.
  EOS

  zap trash:  [
        "~/Library/Application Support/com.antonshakirov.minimo",
        "~/Library/Preferences/com.antonshakirov.minimo.plist",
      ],
      # only exists if the closed-lid mode was ever used: a NOPASSWD rule
      # strictly for `pmset disablesleep 0/1`, which root has to remove
      delete: "/etc/sudoers.d/hop-pmset"
end
