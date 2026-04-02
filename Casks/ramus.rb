cask "ramus" do
  version "1.0.0"
  sha256 "0726a2c8350ec4e71ecb32820b48fbb94ed4d7e7e47a0c6104405a6ef2e861b9"

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
