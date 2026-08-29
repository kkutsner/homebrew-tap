require_relative "../lib/private_github_release_download_strategy"

class Kvim < Formula
  desc "Modal terminal editor with an asynchronous, cross-platform architecture"
  homepage "https://github.com/kkutsner/kvim"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/kkutsner/kvim/releases/download/v0.6.0/kvim-0.6.0-aarch64-apple-darwin.tar.gz",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "5e3b5d32d44f0a3a7d0630d2eafafa206047ddd5fdf97a831df2f28ff4172f5e"
    end

    on_intel do
      url "https://github.com/kkutsner/kvim/releases/download/v0.6.0/kvim-0.6.0-x86_64-apple-darwin.tar.gz",
          using: GitHubPrivateReleaseDownloadStrategy
      sha256 "92c9a6ab5949ea1d5b215e92004ff8cc85db669ff83547b467f2f8dfdcfa9624"
    end
  end

  def install
    bin.install "kvim"
  end

  test do
    assert_equal "kvim #{version}\n", shell_output("#{bin}/kvim --version")
  end
end
