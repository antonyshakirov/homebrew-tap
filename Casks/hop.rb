cask "hop" do
  version "2.0.3"

  # One build per architecture: each carries only the code its own processor
  # runs, so neither download is heavier than it has to be.
  on_arm do
    sha256 "28bc8f33101836c3aeb7f2d0fe35293b526773b8a95deb8ff59f87c98bc8e23d"
    url "https://github.com/antonyshakirov/hop/releases/download/v#{version}/Hop.dmg"
  end
  on_intel do
    sha256 "37fc6d82085d603f9b8d995f26c6005a41c203f8c43f7ba3e792bcbea272a091"
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
