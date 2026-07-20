# Changelog

All notable changes to **Networker** will be documented in this file.

This project follows [Semantic Versioning](https://semver.org/).

---

## [1.4.0]

### Added

- Added support for `BindableEvent`.
- Added `Networker.newBindableEvent()`.
- Added `Networker.getBindable()`.
- Added `:Fire()` for firing bindable events.
- Added `:Event()` for accessing the `BindableEvent.Event` signal.

### Changed

- Expanded Networker beyond networking to support local event communication.
- Improved runtime validation for bindable events.

---

## [1.3.1]

### Fixed

- Fixed type definitions for `UnreliableRemoteEvent`.
- Fixed `getUnreliableRemote()`.
- Fixed `OnServerEvent()` support for `UnreliableRemoteEvent`.
- Fixed `OnClientEvent()` support for `UnreliableRemoteEvent`.
- Improved stability and error handling.

---

## [1.3.0]

### Added

- Added support for `UnreliableRemoteEvent`.
- Added `Networker.newUnreliableRemoteEvent()`.
- Added `Networker.getUnreliableRemote()`.

### Changed

- Refactored internal networking logic to support multiple remote types.

---

## [1.2.0]

### Added

- Client initialization now waits for the `Remotes` folder.
- Updated documentation and examples.

### Changed

- Renamed `Networker.get()` to `Networker.getRemote()`.
- Improved initialization on both the client and server.

### Fixed

- Fixed client initialization issues.
- Fixed several stability issues reported after release.

---

## [1.1.0]

### Added

- Added `:OnServerEvent()`.
- Added `:OnClientEvent()`.
- Added typed `RBXScriptConnection` return values.

### Changed

- Updated documentation with event connection examples.

---

## [1.0.0]

### Added

- Initial release.
- `Networker.init()`
- `Networker.newRemote()`
- `Networker.getRemote()`
- `:FireServer()`
- `:FireClient()`
- `:FireAllClients()`
- Strict Luau support.
- Runtime validation.
