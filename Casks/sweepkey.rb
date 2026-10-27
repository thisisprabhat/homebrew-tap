cask "sweepkey" do
  version "0.1.0"
  sha256 "387feb9618608ec6a755a5178a4f459dd757a77e1eafc83eb18eef4f109d943e"

  url "https://github.com/thisisprabhat/sweepkey/releases/download/v#{version}/Sweepkey-#{version}.dmg"
  name "Sweepkey"
  desc "Developer-disk cleaner and secrets vault"
  homepage "https://github.com/thisisprabhat/sweepkey"

  depends_on macos: ">= :tahoe"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Sweepkey.app"
  # The CLI ships inside the app bundle.
  binary "#{appdir}/Sweepkey.app/Contents/Resources/sweepkey"

  zap trash: [
    "~/Library/Application Support/Sweepkey",
    "~/Library/Preferences/com.prabhatkumar.Sweepkey.plist",
  ]
end
