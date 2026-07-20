# Networker

A lightweight, type-safe networking library for Roblox built with **Strict Luau**.

Networker provides a clean, object-oriented wrapper around Roblox's `RemoteEvent` and `UnreliableRemoteEvent`, making networking simple, organized, and easy to use.

<p align="center">
  <a href="#features">Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#remotes">Remotes</a> •
  <a href="#api">API</a> •
  <a href="./CHANGELOG.md">Changelog</a> •
  <a href="./LICENSE">License</a>
</p>

---

# Features

- 🚀 Lightweight and easy to use
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

Install using Wally:

```toml
[dependencies]
Networker = "thepigeonsstudio/networker@1.3.1"
```

Then install your dependencies:

```bash
wally install
```

---

# Remotes

Networker supports both **RemoteEvent** and **UnreliableRemoteEvent** with the same simple API.

## RemoteEvent

### Creating a Remote

**Server**

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Chat = Networker.newRemote("Chat")
```

### Getting a Remote

**Client**

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Chat = Networker.getRemote("Chat")
```

### Sending Events

```lua
-- Client → Server
Chat:FireServer("Hello Server!")

-- Server → Client
Chat:FireClient(player, "Hello Client!")

-- Server → All Clients
Chat:FireAllClients("Welcome!")
```

### Listening for Events

**Server**

```lua
Chat:OnServerEvent(function(player, message)
	print(player.Name, message)
end)
```

**Client**

```lua
Chat:OnClientEvent(function(message)
	print(message)
end)
```

---

## UnreliableRemoteEvent

`UnreliableRemoteEvent` is designed for high-frequency data where occasional packet loss is acceptable.

Examples include:

- Character movement
- Camera updates
- Aim direction
- Visual effects
- Cosmetic updates

### Creating an Unreliable Remote

**Server**

```lua
local Position = Networker.newUnreliableRemoteEvent("Position")
```

### Getting an Unreliable Remote

**Client**

```lua
local Position = Networker.getUnreliableRemote("Position")
```

### Sending Events

```lua
Position:FireServer(...)

Position:FireClient(player, ...)

Position:FireAllClients(...)
```

### Listening for Events

**Server**

```lua
Position:OnServerEvent(function(player, ...)
	print(player)
end)
```

**Client**

```lua
Position:OnClientEvent(function(...)
	print(...)
end)
```

---

# API

| Function | Description |
|----------|-------------|
| `Networker.init()` | Initializes Networker. |
| `Networker.newRemote(name)` | Creates a new `RemoteEvent`. |
| `Networker.getRemote(name)` | Gets an existing `RemoteEvent`. |
| `Networker.newUnreliableRemoteEvent(name)` | Creates a new `UnreliableRemoteEvent`. |
| `Networker.getUnreliableRemote(name)` | Gets an existing `UnreliableRemoteEvent`. |
| `:FireServer(...)` | Fires an event to the server. |
| `:FireClient(player, ...)` | Fires an event to a specific client. |
| `:FireAllClients(...)` | Fires an event to every client. |
| `:OnServerEvent(callback)` | Connects a callback to `OnServerEvent`. |
| `:OnClientEvent(callback)` | Connects a callback to `OnClientEvent`. |

---

# Contributing

Contributions, bug reports, feature requests, and pull requests are welcome!

If you discover a bug or have an idea for improving Networker, feel free to open an issue or submit a pull request.

---

# License

This project is licensed under the **MIT License**.

---

Made with ❤️ by **ThePigeonsStudio**
