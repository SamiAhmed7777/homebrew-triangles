class Triangles < Formula
  desc "Cryptographic Triangles (TRI) cryptocurrency wallet and daemon"
  homepage "https://cryptographic-triangles.org"
  license "MIT"
  version "6.0.0"

  # macOS arm64: install the GUI app from the official .dmg.
  # Linux: not distributed here — use the triangles-qt-bin package from AUR,
  # or the official .deb on Debian/Ubuntu.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SamiAhmed7777/triangles_v5/releases/download/v#{version}/Cryptographic-Triangles-v#{version}-macos-arm64.dmg"
  sha256 "bc12a32e370e371f77e52c5046ab8e770bb6a002dfd5a1b216d59fbf6e2215c0"
    else
      odie "Cryptographic Triangles does not currently publish an Intel macOS build. " \
           "Build from source: https://github.com/SamiAhmed7777/triangles_v5"
    end
  end

  on_linux do
    odie "The Homebrew formula for Triangles is macOS-only. " \
         "On Linux, install the official .deb (see https://github.com/SamiAhmed7777/triangles_v5/releases) " \
         "or the triangles-qt-bin package from AUR."
  end

  depends_on "openssl@3" if OS.mac?

  def install
    return unless OS.mac?
    prefix.install "Triangles-Qt.app"
    bin.write_exec_script prefix/"Triangles-Qt.app/Contents/MacOS/Triangles-Qt"
  end

  test do
    return unless OS.mac?
    assert_predicate prefix/"Triangles-Qt.app", :exist?
  end
end
