cask "hop" do
  version "1.9.0"

  # One build per architecture: each carries only the code its own processor
  # runs, so neither download is heavier than it has to be.
  #
  # The address is the author's site, which logs the request and redirects to
  # the file in the GitHub release. That redirect is the only way an install
  # through brew can be counted at all: GitHub publishes one cumulative figure
  # per asset and nothing else. The bytes still come from GitHub, and the
  # sha256 below is checked against them as usual.
  on_arm do
    sha256 "549ab6f684d81ba7cf1f0460b516173e76c7648303878a258ce057161cdbfb9a"
    url "https://www.antonshakirov.com/api/hop/download/v#{version}/Hop.dmg",
        verified: "antonshakirov.com/"
  end
  on_intel do
    sha256 "6c7684fb10422f3b2b7d7f8e55a3713bcb38ad302e97debaea7d1a2402e73878"
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
