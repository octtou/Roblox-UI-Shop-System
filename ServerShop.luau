local storage = game:GetService("ReplicatedStorage")

local remoteEvent = storage.Events.RemoteEvent

local function boughtTool(player, tool)
	local tool = storage.Tools[tool]:Clone()
	tool.Parent = player.Backpack
end

remoteEvent.OnServerEvent:Connect(boughtTool)
