cask "spacedock" do
  version "0.1.2"
  sha256 "63bdb77ef67affade507bb7b2df53b558ce5d55b59996f0c0bde22bfc85a3bbd"

  url "https://github.com/WicioW/SpaceDock/releases/download/v#{version}/SpaceDock-#{version}.dmg"
  name "SpaceDock"
  desc "Saves full-screen Spaces per monitor set and restores them"
  homepage "https://github.com/WicioW/SpaceDock"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

  app "SpaceDock.app"

  zap trash: [
    "~/Library/Application Support/SpaceDock",
    "~/Library/Caches/io.github.wiciow.spacedock",
    "~/Library/HTTPStorages/io.github.wiciow.spacedock",
    "~/Library/HTTPStorages/io.github.wiciow.spacedock.binarycookies",
    "~/Library/Logs/SpaceDock.log",
    "~/Library/Preferences/io.github.wiciow.spacedock.plist",
  ]

  caveats <<~EOS
    SpaceDock is not notarized by Apple. On first launch macOS says it can't verify the app:
    click Done, then System Settings → Privacy & Security → Open Anyway.
  EOS
end
