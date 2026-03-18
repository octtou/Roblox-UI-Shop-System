game.Players.PlayerAdded:Connect(function(Player)
	local Leaderstats = Instance.new("Folder", Player)
	Leaderstats.Name = "leaderstats"
	local XP = Instance.new("IntValue", Leaderstats)
	XP.Name = "XP" -- Change "XP" with your currency.
	XP.Value = 0
end)
