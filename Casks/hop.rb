cask "hop" do
  version "1.5.1"

  # One build per architecture: each carries only the code its own processor
  # runs, so neither download is heavier than it has to be.
  on_arm do
    sha256 "6877e2ebaa4023196bd1c2fcca66671a55f622209378db4b5fc7079c0ff126ac"
    url "https://github.com/antonyshakirov/hop/releases/download/v#{version}/Hop.dmg"
  end
  on_intel do
    sha256 :no_check
    url "https://github.com/antonyshakirov/hop/releases/download/v#{version}/Hop-intel.dmg"
  end
  name "Hop"
  desc "Menu bar toolkit for macOS"
  homepage "https://github.com/antonyshakirov/hop"

  depends_on macos: :sonoma

  app "Hop.app"

  caveats <<~EOS
    Hop is not notarized because Apple Developer Program membership is
    unavailable to the author. On macOS 15 or newer, try to open Hop once,
    then go to System Settings → Privacy & Security → Open Anyway and
    confirm Open. The source is public, and built-in updates are verified
    with Ed25519.
  EOS

  zap trash: [
    "~/Library/Application Support/com.antonshakirov.minimo",
    "~/Library/Preferences/com.antonshakirov.minimo.plist",
  ]
end
