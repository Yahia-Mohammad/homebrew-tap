# typed: strict
# frozen_string_literal: true

# Homebrew formula for the RemoteBLE command-line client. Rendered from this template by
# packaging/render-homebrew-formula.sh, which substitutes the @-delimited placeholders.
class Remoteble < Formula
  desc "Command-line client and Agent Skill for RemoteBLE"
  homepage "https://github.com/Yahia-Mohammad/remote-ble-tools"
  # No `version` stanza: every archive URL ends in remoteble-<platform>-<version>.zip, so
  # Homebrew scans the version from it and `brew audit --strict` rejects restating it.
  url "https://github.com/Yahia-Mohammad/remote-ble-tools/releases/download/v0.1.0/remoteble-macos-arm64-0.1.0.zip"
  sha256 "b3804a3fcc366ee6f4be0a2e857590cea4753cbf1f8dcdfadccf5a29a0bcb651"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "dist/bin/remoteble", "dist/bin/rble"
    man1.install "dist/man/remoteble.1"
    bash_completion.install "dist/completions/remoteble.bash" => "remoteble"
    zsh_completion.install "dist/completions/remoteble.zsh" => "_remoteble"
    fish_completion.install "dist/completions/remoteble.fish"
    (pkgshare/"skills").install "dist/skills/remoteble"
    pkgshare.install "LICENSE", "NOTICE", "sbom.json"
  end

  test do
    system bin/"remoteble", "--version"
    system bin/"rble", "--version"
  end
end
