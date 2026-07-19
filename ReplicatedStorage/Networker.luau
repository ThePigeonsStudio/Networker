--!strict

local Networker = {}

Networker.__index = Networker

export type Networker = typeof(Networker) & {
	name: string,
	Remote: RemoteEvent?,
	UnreliableRemote: UnreliableRemoteEvent?,
}

local folder : Folder
local RunService = game:GetService("RunService")

--[[
inits the Networker 
]]
function Networker.init()
	if RunService:IsServer() then
		if folder == nil then
			folder = Instance.new("Folder")
			folder.Parent = game:GetService("ReplicatedStorage")
			folder.Name = "Remotes"
		end
	elseif RunService:IsClient() then
		if folder == nil then
			folder = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
		end
	end
end

--[[
constructs a new remote event
]]
function Networker.newRemote(name : string) : Networker
	if folder == nil then
		error("You must call Networker.init() before using Networker.newRemote()!")
	end
	
	assert(not folder:FindFirstChild(name), `Remote "{name}" already exists.`)
	assert(RunService:IsServer(), "cannot construct remotes on the client!")
	
	local self = setmetatable({}, Networker)
	self.Remote = Instance.new("RemoteEvent")
	self.Remote.Name = name
	self.Remote.Parent = folder
	self.name = name
	return self
end

--[[
constructs a new UnreliableRemoteEvent
--]]
function Networker.newUnreliableRemoteEvent(name : string) : Networker
	if folder == nil then
		error("You must call Networker.init() before using Networker.newUnreliableRemoteEvent()!")
	end

	assert(not folder:FindFirstChild(name), `Remote "{name}" already exists.`)
	assert(RunService:IsServer(), "cannot construct remotes on the client!")

	local self = setmetatable({}, Networker)
	self.UnreliableRemote = Instance.new("UnreliableRemoteEvent")
	self.UnreliableRemote.Name = name
	self.UnreliableRemote.Parent = folder
	self.name = name
	return self
end

--[[
fires the remote on the server
]]
function Networker:FireServer(...)
	assert(RunService:IsClient(), "cannot fire server on the server!")
	if self.Remote then
		self.Remote:FireServer(...)
		elseif self.UnreliableRemote then
		self.UnreliableRemote:FireServer(...)
	end
end

--[[
fires the remote on the client 
]]
function Networker:FireClient(player : Player, ...)	
	assert(RunService:IsServer(), "cannot fire client on the server!")
	if self.Remote then
		self.Remote:FireClient(player, ...)
		elseif self.UnreliableRemote then
		self.UnreliableRemote:FireClient(player, ...)
	end
end 

--[[
fires the remote on all clients
]]
function Networker:FireAllClients(...)
	assert(RunService:IsServer(), "cannot fire all clients on the server!")
	if self.Remote then
		self.Remote:FireAllClients(...)
		elseif self.UnreliableRemote then
		self.UnreliableRemote:FireAllClients(...)
	end
end

--[[
looks for a remote event, errors if not found
]]
function Networker.getRemote(name: string): Networker
	if folder == nil then
		error("You must call Networker.init() before using Networker.newRemote()!")
	end

	local remote = folder:FindFirstChild(name)
	assert(remote, `Remote "{name}" does not exist.`)

	local obj = setmetatable({
		name = name,
		Remote = remote :: RemoteEvent,
	}, Networker)

	return (obj :: Networker)
end

--[[
looks for a UnreliableRemoteEvent, errors if not found
]]
function Networker.getUnreliableRemote(name: string): Networker
	if folder == nil then
		error("You must call Networker.init() before using Networker.newUnreliableRemoteEvent()!")
	end

	local remote = folder:FindFirstChild(name)
	assert(remote, `UnreliableRemoteEvent "{name}" does not exist.`)

	local obj = setmetatable({
		name = name,
		UnreliableRemote = remote :: UnreliableRemoteEvent,
	}, Networker)

	return (obj :: Networker)
end

--[[
Connects a callback to the server event
]]
function Networker:OnServerEvent(callback: (Player, ...any) -> ()): RBXScriptConnection
	assert(RunService:IsServer(), "OnServerEvent can only be called from the server.")
	if self.Remote then
		return self.Remote.OnServerEvent:Connect(callback)
	elseif self.UnreliableRemote then
		return self.UnreliableRemote.OnServerEvent:Connect(callback)
	end

	error("No remote exists.")
end

--[[
Connects a callback to the client event
]]
function Networker:OnClientEvent(callback: (...any) -> ()): RBXScriptConnection
	assert(RunService:IsClient(), "OnClientEvent can only be called from the client.")
	if self.Remote then
		return self.Remote.OnClientEvent:Connect(callback)
	elseif self.UnreliableRemote then
		return self.UnreliableRemote.OnClientEvent:Connect(callback)
	end
end

return Networker :: Networker
