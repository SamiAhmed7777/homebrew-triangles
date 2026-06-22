cask "cryptographic-triangles" do
  version "5.9.23"
  sha256 "2118eb51ce304aabd42b056623a84e9bffa1386a3ca5fd27364c1d2fb9acabc2"

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
