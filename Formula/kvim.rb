require_relative "../lib/private_github_release_download_strategy"

class Kvim < Formula
  desc "Modal terminal editor with an asynchronous, cross-platform architecture"
  homepage "https://github.com/kkutsner/kvim"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/kkutsner/kvim/releases/download/v0.7.0/kvim-0.7.0-aarch64-apple-darwin.tar.gz",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "71def79127b556efb0534d92699fb5685777608e98e76b627ef803714e6aa5e7"
    end

    on_intel do
      url "https://github.com/kkutsner/kvim/releases/download/v0.7.0/kvim-0.7.0-x86_64-apple-darwin.tar.gz",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "e5ecc09378b2daf7a2d6e43fa5fd020108ab7bb67b8d625795afe43d4a370b5d"
    end
  end

  def install
    bin.install "kvim"
  end

  test do
    assert_equal "kvim #{version}\n", shell_output("#{bin}/kvim --version")
  end
end
