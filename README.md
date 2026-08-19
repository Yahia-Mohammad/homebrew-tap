# homebrew-tap

Homebrew formulae and casks for [RemoteBLE](https://github.com/Yahia-Mohammad/remote-ble).

```sh
brew tap Yahia-Mohammad/tap
brew install remoteble              # the CLI (added by the remote-ble-tools release workflow)

# Homebrew refuses casks from a third-party tap until the tap is trusted, so the agent
# needs one extra step. Formulae are unaffected.
brew trust --cask Yahia-Mohammad/tap/remoteble-agent
brew install --cask remoteble-agent # the macOS radio-side agent
```

`remoteble` is published automatically when a stable `vX.Y.Z` tag is released in
[remote-ble-tools](https://github.com/Yahia-Mohammad/remote-ble-tools). `remoteble-agent` tracks
agent releases in [remote-ble](https://github.com/Yahia-Mohammad/remote-ble) and is updated by
hand for now.

The agent needs Bluetooth permission, which macOS grants to an application rather than to a
command, so it installs as a cask and must be started through LaunchServices:

```sh
open -a RemoteBleAgentRs --args --port 8080
```
