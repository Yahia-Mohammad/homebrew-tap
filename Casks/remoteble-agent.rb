# typed: strict
# frozen_string_literal: true

cask "remoteble-agent" do
  version "0.12.0"
  sha256 "3cf5ae93349e283174dd1a9e8fb7c1c51f0663b35125157f75fc1d055ac80b32"

  url "https://github.com/Yahia-Mohammad/remote-ble/releases/download/v#{version}/remoteble-agent-rs-macos-universal.app.zip",
      verified: "github.com/Yahia-Mohammad/remote-ble/"
  name "RemoteBLE Agent"
  desc "Radio-side agent that relays BLE operations to remote clients"
  homepage "https://github.com/Yahia-Mohammad/remote-ble"

  depends_on macos: :big_sur

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
