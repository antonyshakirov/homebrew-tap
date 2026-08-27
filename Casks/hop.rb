cask "hop" do
  version "1.8.0"

  # One build per architecture: each carries only the code its own processor
  # runs, so neither download is heavier than it has to be.
  #
  # The address is the author's site, which logs the request and redirects to
  # the file in the GitHub release. That redirect is the only way an install
  # through brew can be counted at all: GitHub publishes one cumulative figure
  # per asset and nothing else. The bytes still come from GitHub, and the
  # sha256 below is checked against them as usual.
  on_arm do
    sha256 "3c28b7129ba10e1f828a74258cb088ec6e3ad3fb4bae18a4bcd16d24bdba73fe"
    url "https://www.antonshakirov.com/api/hop/download/v#{version}/Hop.dmg",
        verified: "antonshakirov.com/"
  end
  on_intel do
    sha256 "7988b0fdc17af8b233002bf258d20c5c4e7614115405d9729f85d6718b87dc0f"
    url "https://www.antonshakirov.com/api/hop/download/v#{version}/Hop-intel.dmg",
        verified: "antonshakirov.com/"
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
