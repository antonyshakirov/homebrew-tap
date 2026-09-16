cask "hop" do
  version "2.1.2"

  # One build per architecture: each carries only the code its own processor
  # runs, so neither download is heavier than it has to be.
  on_arm do
    sha256 "ad5e41e73b1aecc1bacbc4eb5908c6784de5556d71dd8e838d95e290ede041dc"
    url "https://github.com/antonyshakirov/hop/releases/download/v#{version}/Hop.dmg"
  end
  on_intel do
    sha256 "e7008275da912d2f3673c3019ed5e9c4d512947ba23b90751c3a35e9931b0faa"
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
