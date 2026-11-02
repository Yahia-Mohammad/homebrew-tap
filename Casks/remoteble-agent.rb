# typed: strict
# frozen_string_literal: true

cask "remoteble-agent" do
  version "0.15.1"
  sha256 "a40e6191c5e06b300571f45fc5a294a4498d9a68c2956266e9c5c9c22e80423f"

  url "https://github.com/Yahia-Mohammad/remote-ble/releases/download/v#{version}/remoteble-agent-rs-macos-universal.app.zip"
  name "RemoteBLE Agent"
  desc "Radio-side agent that relays BLE operations to remote clients"
  homepage "https://github.com/Yahia-Mohammad/remote-ble"

  depends_on :macos

  app "RemoteBleAgentRs.app"

  caveats <<~EOS
    The agent needs Bluetooth permission, which macOS grants to an app rather than to a
    command. Start it through LaunchServices so the grant applies:

      open -a RemoteBleAgentRs --args --port 8080

    The first launch prompts once for Bluetooth access. The build is ad-hoc signed, so its
    code identity changes with each release and the prompt returns after an upgrade.

    Point the CLI at it with:

      remoteble --endpoint ws://127.0.0.1:8080/agent agent capabilities
  EOS
end
