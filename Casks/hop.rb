cask "hop" do
  version "1.9.1"

  # One build per architecture: each carries only the code its own processor
  # runs, so neither download is heavier than it has to be.
  on_arm do
    sha256 "87c1800efd6e81baf6940e85f4fb71463fc5420d4507b418618ac3884dcd1e36"
    url "https://github.com/antonyshakirov/hop/releases/download/v#{version}/Hop.dmg"
  end
  on_intel do
    sha256 "39341d19a8bed3a204a06236524b02f2366eccf8603cbae22235f22fbdffda34"
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

    Upgrading from a version before 1.9.1: the signature changed, so macOS
    sees a new app and asks for Hop's permissions again.
  EOS

  zap trash: [
    "~/Library/Application Support/com.antonshakirov.minimo",
    "~/Library/Preferences/com.antonshakirov.minimo.plist",
  ]
end
