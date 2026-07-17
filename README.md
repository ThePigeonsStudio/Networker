# Networker

A lightweight, type-safe networking wrapper for Roblox built with **Strict Luau**.

Networker simplifies working with `RemoteEvent`s by providing an easy-to-use API while keeping your code clean and organized.

---

## Features

* ⚡ Lightweight and easy to use
* 🔒 Written in `--!strict`
* 📡 Simple `RemoteEvent` wrapper
* 🛡️ Runtime validation to help catch incorrect usage
* 📁 Automatic organization of remotes
* 📖 Beginner-friendly API

---

## Installation

Install with Wally:

```toml
[dependencies]
Networker = "thepigeonsstudio/networker@1.0.0"
```

Then install your dependencies:

```bash
wally install
```

---

## Creating a Remote

**Server**

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Damage = Networker.newRemote("Damage")
```

---

## Getting a Remote

**Client or Server**

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Damage = Networker.get("Damage")
```

---

## API

### `Networker.init()`

Initializes the networking system and creates the **Remotes** folder inside `ReplicatedStorage`.

---

### `Networker.newRemote(name)`

Creates a new `RemoteEvent`.

**Parameters**

| Name   | Type     |
| ------ | -------- |
| `name` | `string` |

Returns a `Networker` object.

---

### `Networker.get(name)`

Gets an existing remote.

**Parameters**

| Name   | Type     |
| ------ | -------- |
| `name` | `string` |

Returns a `Networker` object.

---

### `:FireServer(...)`

Fires the remote from a **client** to the **server**.

```lua
Damage:FireServer("Hello Server!")
```

---

### `:FireClient(player, ...)`

Fires the remote from the **server** to a specific **player**.

```lua
Damage:FireClient(player, "Hello!")
```

---

### `:FireAllClients(...)`

Fires the remote from the **server** to **all connected players**.

```lua
Damage:FireAllClients("Round Started!")
```

---

## Example

### Server

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Message = Networker.newRemote("Message")

game.Players.PlayerAdded:Connect(function(player)
    Message:FireClient(player, "Welcome!")
end)
```

### Client

```lua
local Networker = require(Packages.Networker)

Networker.init()

local Message = Networker.get("Message")

Message.Remote.OnClientEvent:Connect(function(text)
    print(text)
end)
```

---

## Requirements

* Roblox Studio
* Wally
* Luau

---

## License

This project is licensed under the **MIT License**.

---

## Contributing

Issues, bug reports, feature requests, and pull requests are welcome.

If you find a bug or have an idea for improving Networker, feel free to open an issue or submit a pull request.

---

Made with ❤️ by **ThePigeonsStudio**
