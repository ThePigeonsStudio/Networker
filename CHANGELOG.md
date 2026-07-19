# Changelog

All notable changes to **Networker** will be documented in this file.

This project follows [Semantic Versioning](https://semver.org/).

---

## [1.2.0] - 2026-07-17

### Added

- Added automatic client initialization using `WaitForChild()` for the `Remotes` folder.
- Improved documentation with updated examples.

### Changed

- Renamed `Networker.get()` to `Networker.getRemote()` for API consistency.
- Improved `Networker.init()` to correctly initialize on both the server and client.

### Fixed

- Fixed a major issue where clients could attempt to access the `Remotes` folder before it existed.
- Fixed multiple stability issues discovered after the initial release.
- Improved reliability when retrieving existing remotes.

---

## [1.1.0] - 2026-07-17

### Added

- Added `Networker:OnServerEvent()`.
- Added `Networker:OnClientEvent()`.
- Added `RBXScriptConnection` return types for event connections.

### Changed

- Updated documentation with event connection examples.

---

## [1.0.0] - 2026-07-17

### Added

- Initial release.
- `Networker.init()`
- `Networker.newRemote()`
- `Networker.get()`
- `Networker:FireServer()`
- `Networker:FireClient()`
- `Networker:FireAllClients()`
- Strict Luau support.
- Runtime validation.
