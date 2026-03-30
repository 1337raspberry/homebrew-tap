cask "ramus" do
  version "1.0.0"
  sha256 "b8821833b9d9e6cf6f7ef34a9812ccd90cb67594033f4064016aef2925673dc8"

  url "https://github.com/1337raspberry/ramus/releases/download/v#{version}/ramus-v#{version}.dmg"
  name "ramus"
  desc "Keyboard-driven Plex music player for macOS"
  homepage "https://github.com/1337raspberry/ramus"

  depends_on macos: ">= :sequoia"

  app "ramus.app"

  zap trash: [
    "~/Library/Application Support/Ramus",
    "~/Library/Caches/Ramus",
    "~/Library/Preferences/com.raspsoft.ramus.plist",
  ]
end
