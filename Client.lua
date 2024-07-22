--[[
    AUTHOR: Oalppo
    DATE: 01/25/2023
    FILE: game/StarterPlayer/StarterPlayerScripts/client.lua
]]

--SERVICES--
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--VARIABLES--
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

local Remote = ReplicatedStorage:WaitForChild("Remote")

local GUI = Player:WaitForChild("PlayerGui"):WaitForChild("Notification")
--MODULES--

--FUNCTIONS--
local function Fire(Event, Formula, Num1, Num2)
	wait(1)
	local RemoteEvent
	local suc,res = pcall(function()
		if ReplicatedStorage:FindFirstChild(Event.Name) then
			RemoteEvent = Event
		end
	end)
	
	if suc then
		RemoteEvent:FireServer(Formula,Num1,Num2)
	end
end

local function Change()
	local ActiveHints = {}
	for _,v in pairs(GUI:GetChildren()) do
		if v.Name == "TemplateCopy" then
			table.insert(ActiveHints, v)
		end
	end
	for i = 1, #ActiveHints do
		ActiveHints[i].Position = UDim2.new(0.5, 0, 0, 100 - (18 * i))
		if i > 10 then ActiveHints[i]:Destroy() end
	end
end

local function Notifiy(Message, Color, Time)
	local TextLabel = GUI:WaitForChild("TextLabel")
	
	if Message ~= nil and Message ~= "" then
		local Text = TextLabel:Clone()
		Text.Parent = GUI
		Text.Name = "TemplateCopy"
		Text.Text = Message
		Text.TextColor3 = Color
		Text.Visible = true
		Change()
		delay(Time, function()
			for Transparency = 1, 100 do
				Text.TextTransparency = Transparency/100
				Text.TextStrokeTransparency = Transparency/100
				wait(.01)
			end
			Text:Destroy()
			Change()
		end)
	end
end

--EVENTS--
Remote.OnClientEvent:Connect(function(Num, formula)
	Notifiy("Calculated: "..Num.." Using "..formula, Color3.fromRGB(255,255,255),5)
end)

--AUTO_RUN--
Fire(Remote,"Addition",5,10)
Fire(Remote,"Negate",5,10)
Fire(Remote,"Multiply",5,10)
Fire(Remote,"Divide",5,10)
Fire(Remote,"PositiveNegate",5,10)
Fire(Remote,"Sqrt",5,nil)
Fire(Remote,"Round",2.98,nil)
Fire(Remote,"Average",5,10)