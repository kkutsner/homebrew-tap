require_relative "../lib/private_github_release_download_strategy"

cask "kterm" do
  version "0.12.3"
  sha256 "876d49b49a75c4a1796f3d5c97f6bff1c1346f5480f81aad1ee286c026b1631a"

  url "https://github.com/kkutsner/kterm/releases/download/v#{version}/Kterm-#{version}-arm64.zip",
      using: GitHubPrivateReleaseDownloadStrategy
  name "Kterm"
  desc "GPU-rendered terminal emulator with configurable neon post-processing"
  homepage "https://github.com/kkutsner/kterm"

  depends_on arch: :arm64
  depends_on :macos

  app "Kterm.app"
end
