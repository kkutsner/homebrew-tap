# typed: strict
# frozen_string_literal: true

require "download_strategy"
require "utils/github"

# Downloads an authenticated release asset from a private GitHub repository.
class GitHubPrivateReleaseDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    owner, repository, tag, filename = parse_release_url(url)
    token = github_token
    ENV["HOMEBREW_GITHUB_API_TOKEN"] = token

    release = GitHub.get_release(owner, repository, tag)
    asset = release.fetch("assets").find { |candidate| candidate["name"] == filename }
    raise CurlDownloadStrategyError, "Release asset not found: #{filename}" unless asset

    @filename = filename
    meta[:headers] = [
      *meta.fetch(:headers, []),
      "Accept: application/octet-stream",
      "Authorization: Bearer #{token}",
    ]
    super(asset.fetch("url"), name, version, **meta)
  end

  private

  def parse_release_url(url)
    pattern = %r{\Ahttps://github\.com/([^/]+)/([^/]+)/releases/download/([^/]+)/([^/]+)\z}
    match = pattern.match(url)
    raise CurlDownloadStrategyError, "Invalid private GitHub release URL: #{url}" unless match

    match.captures
  end

  def github_token
    token = ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "").strip
    return token unless token.empty?

    gh = which("gh")
    token = Utils.safe_popen_read(gh.to_s, "auth", "token").strip if gh
    return token unless token.to_s.empty?

    raise CurlDownloadStrategyError, <<~EOS
      GitHub authentication is required to download Kvim.
      Install GitHub CLI with `brew install gh`, then run `gh auth login`.
    EOS
  rescue ErrorDuringExecution
    raise CurlDownloadStrategyError, <<~EOS
      GitHub authentication is required to download Kvim.
      Run `gh auth login`, or set HOMEBREW_GITHUB_API_TOKEN to a token with access.
    EOS
  end

  def resolved_basename
    @filename
  end
end
