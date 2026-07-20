# Networker

A lightweight, type-safe communication library for Roblox built with **Strict Luau**.

Networker provides a clean, object-oriented wrapper around Roblox's communication primitives, including `RemoteEvent`, `UnreliableRemoteEvent`, and `BindableEvent`.

<p align="center">
  <a href="#features">Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#usage">Usage</a> •
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
- 🔔 Supports `BindableEvent`
- 🔄 Client and server compatible
- 📨 Simple API for sending events
- 🔗 Built-in event connection helpers
- 🛡️ Runtime validation with descriptive error messages
- 📦 Wally package support

---

# Installation

Install using Wally:

```toml
[dependencies]
Networker = "thepigeonsstudio/networker@1.4.0"
```

Then install your dependencies:

```bash
wally install
```

---

# Usage

## Initialization

Initialize Networker before creating or retrieving events.

```lua
local Networker = require(Packages.Networker)

Networker.init()
```

---

# RemoteEvent

## Creating

```lua
local Chat = Networker.newRemote("Chat")
```

## Getting

```lua
local Chat = Networker.getRemote("Chat")
```

## Sending

```lua
-- Client → Server
Chat:FireServer("Hello!")

-- Server → Client
Chat:FireClient(player, "Hello!")

-- Server → All Clients
Chat:FireAllClients("Welcome!")
```

## Listening

### Server

```lua
Chat:OnServerEvent(function(player, message)
	print(player.Name, message)
end)
```

### Client

```lua
Chat:OnClientEvent(function(message)
	print(message)
end)
```

---

# UnreliableRemoteEvent

Perfect for high-frequency data where occasional packet loss is acceptable.

Examples include:

- Character movement
- Camera updates
- Projectile positions
- Aim direction
- Visual effects

## Creating

```lua
local Position = Networker.newUnreliableRemoteEvent("Position")
```

## Getting

```lua
local Position = Networker.getUnreliableRemote("Position")
```

## Sending

```lua
Position:FireServer(...)

Position:FireClient(player, ...)

Position:FireAllClients(...)
```

## Listening

```lua
Position:OnServerEvent(function(player, ...)
	print(player)
end)
```

```lua
Position:OnClientEvent(function(...)
	print(...)
end)
```

---

# BindableEvent

BindableEvents allow communication within the same environment (Server ↔ Server or Client ↔ Client).

## Creating

```lua
local Damage = Networker.newBindableEvent("Damage")
```

## Getting

```lua
local Damage = Networker.getBindable("Damage")
```

## Firing

```lua
Damage:Fire(25)
```

## Listening

```lua
Damage:Event():Connect(function(amount)
	print(amount)
end)
```

---

# API

| Function | Description |
|----------|-------------|
| `Networker.init()` | Initializes Networker. |
| `Networker.newRemote(name)` | Creates a `RemoteEvent`. |
| `Networker.getRemote(name)` | Retrieves a `RemoteEvent`. |
| `Networker.newUnreliableRemoteEvent(name)` | Creates an `UnreliableRemoteEvent`. |
| `Networker.getUnreliableRemote(name)` | Retrieves an `UnreliableRemoteEvent`. |
| `Networker.newBindableEvent(name)` | Creates a `BindableEvent`. |
| `Networker.getBindable(name)` | Retrieves a `BindableEvent`. |
| `:FireServer(...)` | Fires to the server. |
| `:FireClient(player, ...)` | Fires to a specific client. |
| `:FireAllClients(...)` | Fires to all clients. |
| `:Fire(...)` | Fires a `BindableEvent`. |
| `:OnServerEvent(callback)` | Connects to `OnServerEvent`. |
| `:OnClientEvent(callback)` | Connects to `OnClientEvent`. |
| `:Event()` | Returns the `BindableEvent.Event` signal. |

---

# Contributing

Contributions, feature requests, bug reports, and pull requests are welcome!

If you encounter an issue or have an idea for improving Networker, feel free to open an issue.

---

# License

Licensed under the **MIT License**.

---

Made with ❤️ by **ThePigeonsStudio**
