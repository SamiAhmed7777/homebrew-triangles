cask "cryptographic-triangles" do
  version "6.1.5"
  sha256 "1cc879fbaa7d9ad22ff2ab7f8269536e3e9c30de11847c6157905a8a8a5c7519"

  url "https://github.com/SamiAhmed7777/triangles_v5/releases/download/v#{version}/Cryptographic-Triangles-v#{version}-macos-arm64.dmg"
  name "Cryptographic Triangles"
  desc "Privacy-focused cryptocurrency wallet with PoS staking and Tor integration"
  homepage "https://github.com/SamiAhmed7777/triangles_v5"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Triangles-Qt.app"

  zap trash: [
    "~/Library/Application Support/Triangles",
    "~/Library/Preferences/org.cryptographic-triangles.Triangles-Qt.plist",
    "~/Library/Saved Application State/org.cryptographic-triangles.Triangles-Qt.savedState",
  ]

  caveats <<~EOS
    This application is not code-signed or notarized by Apple.

    On first launch, you may need to:
    1. Right-click the app and select "Open"
    2. Click "Open" in the security dialog

    Alternatively, allow the app in System Settings > Privacy & Security.
  EOS
end
