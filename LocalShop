local tool = script.Parent.Tool.Value

script.Parent.MouseButton1Click:Connect(function(Player)
	if game.Players.LocalPlayer.leaderstats.XP.Value >= script.Parent.Cost.Value then
		game.ReplicatedStorage.Events.RemoteEvent:FireServer(tool, Player)
		script.Parent.Text = "Have Fun With your new stick"
		wait(3)
		script.Parent.Text = tool
	else
		script.Parent.Text = "Ha Ha U Poor"
		wait(3)
		script.Parent.Text = tool
	end
end)
