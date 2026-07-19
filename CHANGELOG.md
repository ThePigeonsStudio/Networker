# Changelog

All notable changes to **Networker** will be documented in this file.

This project follows [Semantic Versioning](https://semver.org/).

---

## [1.3.1] - 2026-07-19

### Fixed

- Fixed type definitions for `UnreliableRemoteEvent`.
- Fixed `getUnreliableRemote()` referencing an incorrect variable.
- Fixed `OnServerEvent()` support for `UnreliableRemoteEvent`.
- Fixed `OnClientEvent()` support for `UnreliableRemoteEvent`.
- Improved error handling when an invalid remote is accessed.
- General stability and reliability improvements.

---

## [1.3.0] - 2026-07-19

### Added

- Added support for `UnreliableRemoteEvent`.
- Added `Networker.newUnreliableRemoteEvent()`.
- Added `Networker.getUnreliableRemote()`.
- Extended the networking API to support both `RemoteEvent` and `UnreliableRemoteEvent`.

### Changed

- Refactored internal networking logic to support multiple remote types.

---

## [1.2.0] - 2026-07-19

### Added

- Added automatic client initialization using `WaitForChild()` for the `Remotes` folder.
- Improved documentation and usage examples.

### Changed

- Renamed `Networker.get()` to `Networker.getRemote()` for API consistency.
- Improved `Networker.init()` to correctly initialize on both the server and client.

### Fixed

- Fixed initialization issues when clients accessed remotes before replication.
- Fixed multiple stability issues discovered after the initial release.

---

## [1.1.0] - 2026-07-19

### Added

- Added `Networker:OnServerEvent()`.
- Added `Networker:OnClientEvent()`.
- Added `RBXScriptConnection` return types for event connections.

### Changed

- Updated documentation with event connection examples.

---

## [1.0.0] - 2026-07-19

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
