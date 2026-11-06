cask "tempmonitor" do
  version "0.1.0"
  sha256 "febb5f30b134ad1faacdbc5d59fd79ea2a053c210999da18ba02f0d69af8f65b"

  url "https://downloads.testudoforge.com/tempmonitor/TempMonitor-#{version}.dmg"
  name "TempMonitor"
  desc "Menu bar monitor for CPU temperature, GPU temperature and fan speeds"
  homepage "https://testudoforge.com/tempmonitor"

  # No `auto_updates true`: the app has no self-updater (no Sparkle), so `brew upgrade` must be able to update it.
  # The download host has no listing or "latest" endpoint to check (it 404s), so livecheck is skipped; bump by hand.
  livecheck do
    skip "No version endpoint on the download host"
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "TempMonitor.app"

  uninstall quit: "com.testudoforge.TempMonitor"

  zap trash: "~/Library/Preferences/com.testudoforge.TempMonitor.plist"
end
