# Networker

A lightweight, type-safe networking library for Roblox built with **Strict Luau**.

Networker provides a clean wrapper around Roblox `RemoteEvent`s, making it easier to create, retrieve, fire, and listen to networking events while keeping your code simple and organized.

---

## Features

- 🚀 Lightweight and easy to use
- 🔒 Written in `--!strict`
- 📡 Simple `RemoteEvent` wrapper
- 🔄 Client and server support
- 📨 Fire events between the client and server
- 🔗 Built-in event connection helpers
- 🛡️ Runtime validation with helpful error messages

---

## Installation

Install using Wally:

```toml
[dependencies]
Networker = "thepigeonsstudio/networker@1.2.0"
```

Then run:

```bash
wally install
```

---

## Quick Start

### Server

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Message = Networker.newRemote("Message")

Message:OnServerEvent(function(player, text)
	print(player.Name, text)
end)
```

### Client

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Message = Networker.getRemote("Message")

Message:FireServer("Hello Server!")

Message:OnClientEvent(function(text)
	print(text)
end)
```

---

# API

## `Networker.init()`

Initializes Networker.

- Creates the `Remotes` folder on the server.
- Waits for the `Remotes` folder on the client.

---

## `Networker.newRemote(name)`

Creates a new `RemoteEvent`.

Returns a `Networker` object.

---

## `Networker.getRemote(name)`

Gets an existing remote.

Returns a `Networker` object.

---

## `:FireServer(...)`

Fires the remote from the client to the server.

---

## `:FireClient(player, ...)`

Fires the remote from the server to a specific client.

---

## `:FireAllClients(...)`

Fires the remote from the server to every connected client.

---

## `:OnServerEvent(callback)`

Connects a callback to the server event.

Returns an `RBXScriptConnection`.

---

## `:OnClientEvent(callback)`

Connects a callback to the client event.

Returns an `RBXScriptConnection`.

---

# Example

### Server

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Chat = Networker.newRemote("Chat")

Chat:OnServerEvent(function(player, message)
	print(player.Name, message)

	Chat:FireClient(player, "Received!")
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

# License

Licensed under the MIT License.

---

Made with ❤️ by **ThePigeonsStudio**
