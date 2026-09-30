require_relative "../lib/private_github_release_download_strategy"

cask "kterm" do
  version "0.12.0"
  sha256 "418ee897c5b051d80094da3c86db0581dbc569093609e91cab01141d5db59a68"

  url "https://github.com/kkutsner/kterm/releases/download/v#{version}/Kterm-#{version}-arm64.zip",
      using: GitHubPrivateReleaseDownloadStrategy
  name "Kterm"
  desc "GPU-rendered terminal emulator with configurable neon post-processing"
  homepage "https://github.com/kkutsner/kterm"

  depends_on arch: :arm64
  depends_on :macos

  app "Kterm.app"
end
