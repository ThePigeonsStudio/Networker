# Networker

A lightweight, type-safe networking library for Roblox built with **Strict Luau**.

<p align="center">
  <a href="#features">Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#quick-start">Quick Start</a> •
  <a href="#api">API</a> •
  <a href="./CHANGELOG.md">Changelog</a> •
  <a href="./LICENSE">License</a>
</p>

---

## Features

- 🚀 Lightweight and easy to use
- 🔒 Written in `--!strict`
- 📡 Simple `RemoteEvent` wrapper
- 🔄 Client and server support
- 📨 Fire events between the client and server
- 🔗 Built-in event connection helpers
- 🛡️ Runtime validation with helpful error messages
- 📦 Wally package support

---

## Installation

Install using Wally:

```toml
[dependencies]
Networker = "thepigeonsstudio/networker@1.2.0"
```

Then install your dependencies:

```bash
wally install
```

---

## Quick Start

### Server

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Chat = Networker.newRemote("Chat")

Chat:OnServerEvent(function(player, message)
	print(player.Name, message)

	Chat:FireClient(player, "Message received!")
end)
```

### Client

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

# API

## `Networker.init()`

Initializes Networker.

- **Server:** Creates the `Remotes` folder inside `ReplicatedStorage`.
- **Client:** Waits for the `Remotes` folder to replicate.

---

## `Networker.newRemote(name)`

Creates a new `RemoteEvent`.

Returns a `Networker` object.

---

## `Networker.getRemote(name)`

Retrieves an existing remote.

Returns a `Networker` object.

---

## `:FireServer(...)`

Fires the remote from the **client** to the **server**.

---

## `:FireClient(player, ...)`

Fires the remote from the **server** to a specific player.

---

## `:FireAllClients(...)`

Fires the remote from the **server** to every connected player.

---

## `:OnServerEvent(callback)`

Connects a callback to `RemoteEvent.OnServerEvent`.

Returns an `RBXScriptConnection`.

---

## `:OnClientEvent(callback)`

Connects a callback to `RemoteEvent.OnClientEvent`.

Returns an `RBXScriptConnection`.

---

## Example

### Server

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Damage = Networker.newRemote("Damage")

Damage:OnServerEvent(function(player, amount)
	print(player.Name, "dealt", amount, "damage")
end)
```

### Client

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Damage = Networker.getRemote("Damage")

Damage:FireServer(25)
```

---

## Contributing

Contributions, bug reports, feature requests, and pull requests are welcome!

If you encounter an issue or have an idea for improving Networker, feel free to open an issue or submit a pull request.

---

## License

This project is licensed under the **MIT License**.

---

Made with ❤️ by **ThePigeonsStudio**
