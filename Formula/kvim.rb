require_relative "../lib/private_github_release_download_strategy"

class Kvim < Formula
  desc "Modal terminal editor with an asynchronous, cross-platform architecture"
  homepage "https://github.com/kkutsner/kvim"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/kkutsner/kvim/releases/download/v0.16.0/kvim-0.16.0-aarch64-apple-darwin.tar.gz",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "9d962a6fbc142fa35a23bdbc0f4ec65a2f93953d201b1cea4c257f42f1598bfd"
    end

    on_intel do
      url "https://github.com/kkutsner/kvim/releases/download/v0.16.0/kvim-0.16.0-x86_64-apple-darwin.tar.gz",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "59193ffecb89bbcbf74b5eadff417e9f116e5854e8eb4ca3fc37bb71bef25ce1"
    end
  end

  def install
    bin.install "kvim"
  end

  test do
    assert_equal "kvim #{version}\n", shell_output("#{bin}/kvim --version")
  end
end
