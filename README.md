# Networker

A lightweight, type-safe networking library for Roblox built with **Strict Luau**.

Networker provides a clean, object-oriented wrapper around Roblox's `RemoteEvent` and `UnreliableRemoteEvent`, making networking simple, organized, and type-safe.

<p align="center">
  <a href="#features">Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#quick-start">Quick Start</a> •
  <a href="#unreliable-remote-events">Unreliable Remote Events</a> •
  <a href="#api">API</a> •
  <a href="./CHANGELOG.md">Changelog</a> •
  <a href="./LICENSE">License</a>
</p>

---

# Features

- 🚀 Lightweight
- 🔒 Written in `--!strict`
- 📡 Supports `RemoteEvent`
- ⚡ Supports `UnreliableRemoteEvent`
- 🔄 Client and server compatible
- 📨 Fire events between the client and server
- 🔗 Built-in event connection helpers
- 🛡️ Runtime validation with descriptive error messages
- 📦 Wally package support

---

# Installation

Install with Wally:

```toml
[dependencies]
Networker = "thepigeonsstudio/networker@1.3.1"
```

Then run:

```bash
wally install
```

---

# Quick Start

## Server

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Chat = Networker.newRemote("Chat")

Chat:OnServerEvent(function(player, message)
	print(player.Name, message)

	Chat:FireClient(player, "Received!")
end)
```

## Client

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Chat = Networker.getRemote("Chat")

Chat:FireServer("Hello!")

Chat:OnClientEvent(function(message)
	print(message)
end)
```

---

# Unreliable Remote Events

Networker fully supports Roblox's `UnreliableRemoteEvent`.

These are ideal for high-frequency data where occasional packet loss is acceptable, such as:

- Character positions
- Camera movement
- Aim direction
- Visual effects
- Cosmetic updates

## Creating one

```lua
local Position = Networker.newUnreliableRemoteEvent("Position")
```

## Getting one

```lua
local Position = Networker.getUnreliableRemote("Position")
```

The API is identical to `RemoteEvent`.

```lua
Position:FireServer(...)
Position:FireClient(player, ...)
Position:FireAllClients(...)

Position:OnServerEvent(function(player, ...)
	-- Handle event
end)

Position:OnClientEvent(function(...)
	-- Handle event
end)
```

---

# API

| Function | Description |
|----------|-------------|
| `Networker.init()` | Initializes Networker. |
| `Networker.newRemote(name)` | Creates a `RemoteEvent`. |
| `Networker.getRemote(name)` | Gets an existing `RemoteEvent`. |
| `Networker.newUnreliableRemoteEvent(name)` | Creates an `UnreliableRemoteEvent`. |
| `Networker.getUnreliableRemote(name)` | Gets an existing `UnreliableRemoteEvent`. |
| `:FireServer(...)` | Fires to the server. |
| `:FireClient(player, ...)` | Fires to one client. |
| `:FireAllClients(...)` | Fires to every client. |
| `:OnServerEvent(callback)` | Connects to `OnServerEvent`. |
| `:OnClientEvent(callback)` | Connects to `OnClientEvent`. |

---

# Contributing

Contributions, feature requests, bug reports, and pull requests are welcome!

---

# License

Licensed under the MIT License.

---

Made with ❤️ by **ThePigeonsStudio**
