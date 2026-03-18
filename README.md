# UI Shop System from my old Game
I used it for my old roblox game, scroll down for the game
# History
- Created on 26/2/2022
- Created on my Second account OwlManGuyThing
# How to use
## Set up
You will need a Text Button, You can insert it inside a Frame or just straight to StarterGUI
- Insert a Local Script inside the Text Button
- Insert a StringValue inside the Text Button
- Insert a NumberValue inside the Text Button
Now you need to name the StringValue to Tool, and the NumberValue to Cost

Change the Value of Tool to the name of your tool

<img width="298" height="352" alt="image" src="https://github.com/user-attachments/assets/c6bfd6ce-cd94-4b69-af96-829aede3bcfa" />

Should looked like this

Change the Value of Cost to How much the Tool Cost

<img width="297" height="378" alt="image" src="https://github.com/user-attachments/assets/1be81530-8768-42c3-a0a0-4c235ac44c05" />

Should looked like this



Inside Replicated Storage add a Folder Name it Events, And Insert a Remote event Inside of it

<img width="264" height="80" alt="image" src="https://github.com/user-attachments/assets/da6502e6-0ff4-4068-9592-4c052fb2398c" />

Tip: You should change the name of the remote event if you have many remote event, i dont know why back then i didnt change it

## Code Set up
Inside ServerScriptService insert two Scripts, name the first script Leaderstats and the second Script ShopServer

<img width="231" height="79" alt="image" src="https://github.com/user-attachments/assets/4767449d-e436-4467-95d9-feeb724a6696" />

Should Looked like this
- Copy the ServerShop Code to ShopServer
- Copy the leaderstats code to Leaderstats

## Code Explanation
This line of code is to change the name of the currency
```luau
XP.Name = "XP" -- Change "XP" with your currency.
```
Pro tip: if you hate the roblox leaderstats look you can change tha name of the folder to anything you want, but remember to change the folder name to the other scripts
```luau
Leaderstats.Name = "leaderstats" -- change this
local XP = Instance.new("IntValue", Leaderstats)
```
example: if the name of your folder is "Stats" insead of "leaderstats" change this to stats
```luau
script.Parent.MouseButton1Click:Connect(function(Player)
	if game.Players.LocalPlayer.leaderstats.XP.Value >= script.Parent.Cost.Value then -- Change leaderstats to Stats
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
```
I didnt add a line of code where you will lose some of your curency when you buy something, because at that time i didnt know how to save tools via DataStore so i made it like that, but i can show you how you can make the player lose curency when you buy something

Change the LocalShop code to this
```luau
local tool = script.Parent.Tool.Value
local Cost = script.Parent.Cost.Value

script.Parent.MouseButton1Click:Connect(function(Player)
	if game.Players.LocalPlayer.leaderstats.XP.Value >= Cost then -- Change it to the name of your leaderstats
		game.ReplicatedStorage.Events.RemoteEvent:FireServer(tool, Cost)
		script.Parent.Text = "Have Fun With your new stick"
		wait(3)
		script.Parent.Text = tool
	else
		script.Parent.Text = "Ha Ha U Poor"
		wait(3)
		script.Parent.Text = tool
	end
end)

```

Change the ServerShop code to this
```luau
local storage = game:GetService("ReplicatedStorage")

local remoteEvent = storage.Events.RemoteEvent

local function boughtTool(player, tool, Cost)
	local leaderstats = player:WaitForChild("leaderstats") -- Change it to your leaderstats name
	local money = leaderstats:WaitForChild("XP") -- Change it to your curency
	print(Cost)
	if money.Value < Cost then
		return
	end
	money.Value -= Cost
	
	local tool = storage.Tools[tool]:Clone()
	tool.Parent = player.Backpack
end

remoteEvent.OnServerEvent:Connect(boughtTool)
```
# Game Link
https://www.roblox.com/id/games/8943174401/Stick-Fight
