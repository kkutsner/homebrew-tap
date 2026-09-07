require_relative "../lib/private_github_release_download_strategy"

cask "kterm" do
  version "0.7.1"
  sha256 "5f8a4d19e81c909742221d7f4bbc95b7840d4881df8097ffe9a44d5973f7150a"

  url "https://github.com/kkutsner/kterm/releases/download/v#{version}/Kterm-#{version}-arm64.zip",
      using: GitHubPrivateReleaseDownloadStrategy
  name "Kterm"
  desc "GPU-rendered terminal emulator with configurable neon post-processing"
  homepage "https://github.com/kkutsner/kterm"

  depends_on arch: :arm64
  depends_on :macos

  app "Kterm.app"
end
