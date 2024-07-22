--[[
    AUTHOR: Oalppo
    DATE: 01/25/2023
    FILE: game/ServerScriptService/server.lua
]]

--SERVICES--
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--VARIABLES--
local Repository = ReplicatedStorage:FindFirstChild("Repository")
local RemoteEvent = ReplicatedStorage:FindFirstChild("Remote")

--MODULES--
local Mathicator = require(Repository:FindFirstChild("Metatable")):Init()

--FUNCTIONS--

--EVENTS--
RemoteEvent.OnServerEvent:Connect(function(plr, formula, number1, number2)
	local suc,res = pcall(function()
		if formula == "Addition" then
			Mathicator:Addition(number1,number2)
		elseif formula == "Negate" then
			Mathicator:Negate(number1,number2)
		elseif formula == "Multiply" then
			Mathicator:Multiply(number1,number2)
		elseif formula == "Divide" then
			Mathicator:Divide(number1,number2)
		elseif formula == "PositiveNegate" then
			Mathicator:PositiveNegate(number1,number2)
		elseif formula == "Sqrt" then
			Mathicator:Sqrt(number1)
		elseif formula == "Round" then
			Mathicator:Round(number1)
		elseif formula == "Average" then
			Mathicator:Average(number1,number2)
		end
	end)
	
	if suc then
		RemoteEvent:FireClient(plr, Mathicator.Result, Mathicator.Operation)
	end
end)

--AUTO_RUN--

Players.PlayerAdded:Connect(function(player)
	Mathicator:Addition(Mathicator.result,#Players:GetPlayers())
	PreviousResult = Mathicator.Result
end)

Players.PlayerRemoving:Connect(function(player)
	Mathicator:Negate(PreviousResult,#Players:GetPlayers())
	PreviousResult = Mathicator.Result
end)

Players.DescendantRemoving:Connect(function()
	print(PreviousResult)
end)