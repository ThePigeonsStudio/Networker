# Networker

A lightweight, type-safe networking library for Roblox built with **Strict Luau**.

Networker simplifies working with `RemoteEvent`s by providing a clean, object-oriented API while remaining lightweight and easy to understand.

---

## Features

* 🚀 Lightweight and easy to use
* 🔒 Written in `--!strict`
* 📡 Simple `RemoteEvent` wrapper
* 📨 Fire events between the client and server
* 🔗 Easy event connections
* 🛡️ Runtime validation
* 📁 Automatic remote organization

---

## Installation

Install with Wally:

```toml
[dependencies]
Networker = "thepigeonsstudio/networker@1.1.0"
```

Then run:

```bash
wally install
```

---

## Creating a Remote

**Server**

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Message = Networker.newRemote("Message")
```

---

## Getting a Remote

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Message = Networker.get("Message")
```

---

## Sending Events

### Client → Server

```lua
Message:FireServer("Hello Server!")
```

### Server → Client

```lua
Message:FireClient(player, "Hello Client!")
```

### Server → All Clients

```lua
Message:FireAllClients("Welcome!")
```

---

## Listening for Events

### Server

```lua
Message:OnServerEvent(function(player, message)
	print(player.Name, message)
end)
```

### Client

```lua
Message:OnClientEvent(function(message)
	print(message)
end)
```

---

## API

| Method                      | Description                       |
| --------------------------- | --------------------------------- |
| `Networker.init()`          | Initializes Networker.            |
| `Networker.newRemote(name)` | Creates a new `RemoteEvent`.      |
| `Networker.get(name)`       | Gets an existing remote.          |
| `:FireServer(...)`          | Fires the remote to the server.   |
| `:FireClient(player, ...)`  | Fires the remote to one client.   |
| `:FireAllClients(...)`      | Fires the remote to every client. |
| `:OnServerEvent(callback)`  | Connects to `OnServerEvent`.      |
| `:OnClientEvent(callback)`  | Connects to `OnClientEvent`.      |

---

## License

Licensed under the **MIT License**.

---

Made with ❤️ by **ThePigeonsStudio**
