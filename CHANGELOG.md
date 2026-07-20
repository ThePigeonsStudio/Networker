# Changelog

All notable changes to **Networker** will be documented in this file.

This project follows [Semantic Versioning](https://semver.org/).

---

## [1.3.1]

### Fixed

- Fixed type definitions for `UnreliableRemoteEvent`.
- Fixed `getUnreliableRemote()` referencing an incorrect variable.
- Fixed `OnServerEvent()` support for `UnreliableRemoteEvent`.
- Fixed `OnClientEvent()` support for `UnreliableRemoteEvent`.
- Improved error handling and overall stability.

---

## [1.3.0]

### Added

- Added support for `UnreliableRemoteEvent`.
- Added `Networker.newUnreliableRemoteEvent()`.
- Added `Networker.getUnreliableRemote()`.
- Extended the API to support both `RemoteEvent` and `UnreliableRemoteEvent`.

### Changed

- Refactored the internal networking wrapper to support multiple remote types.

---

## [1.2.0]

### Added

- Client initialization now waits for the `Remotes` folder using `WaitForChild()`.
- Updated documentation and usage examples.

### Changed

- Renamed `Networker.get()` to `Networker.getRemote()` for API consistency.
- Improved `Networker.init()` for both the client and server.

### Fixed

- Fixed initialization issues when clients accessed remotes before replication.
- Fixed multiple stability issues discovered after the initial release.

---

## [1.1.0]

### Added

- Added `Networker:OnServerEvent()`.
- Added `Networker:OnClientEvent()`.
- Added `RBXScriptConnection` return types for event connections.

### Changed

- Updated the README with event connection examples.

---

## [1.0.0]

### Added

- Initial public release.
- `Networker.init()`
- `Networker.newRemote()`
- `Networker.get()`
- `Networker:FireServer()`
- `Networker:FireClient()`
- `Networker:FireAllClients()`
- Strict Luau support.
- Runtime validation with descriptive error messages.
