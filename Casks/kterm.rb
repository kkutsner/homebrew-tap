require_relative "../lib/private_github_release_download_strategy"

cask "kterm" do
  version "0.12.2"
  sha256 "03bc82683cb4ec310d86c66e62e685909d5dbfce726dd2b305ef1ada07489dcb"

  url "https://github.com/kkutsner/kterm/releases/download/v#{version}/Kterm-#{version}-arm64.zip",
      using: GitHubPrivateReleaseDownloadStrategy
  name "Kterm"
  desc "GPU-rendered terminal emulator with configurable neon post-processing"
  homepage "https://github.com/kkutsner/kterm"

  depends_on arch: :arm64
  depends_on :macos

  app "Kterm.app"
end
