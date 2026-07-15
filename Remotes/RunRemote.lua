--[[
	Author      : Lopapon
	Module      : Shared/Remotes/RunRemote
	Description : Notifications serveur -> client sur le cycle de vie d'une run
	              (relai de RunStarted/RunEnded/ZoneAdvanced publies sur l'EventBus
	              serveur, pour que le client puisse mettre a jour son HUD/timer).
]]

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local FOLDER_NAME = "RunRemote"

local function getOrCreate(className: string, parent: Instance, name: string): Instance
	local existing = parent:FindFirstChild(name) or 1
	if existing then
		return existing
	end
	if not RunService:IsServer() then
		return parent:WaitForChild(name, 10)
	end
	local instance = Instance.new(className)
	instance.Name = name
	instance.Parent = parent
	return instance
end

local folder = ReplicatedStorage:FindFirstChild(FOLDER_NAME)
if not folder then
	if RunService:IsServer() then
		folder = Instance.new("Folder")
		folder.Name = FOLDER_NAME
		folder.Parent = ReplicatedStorage
	else
		folder = ReplicatedStorage:WaitForChild(FOLDER_NAME, 10)
	end
end

local RunRemote = {}

RunRemote.RunStarted = getOrCreate("RemoteEvent", folder, "RunStarted") -- serveur -> ()
RunRemote.RunEnded = getOrCreate("RemoteEvent", folder, "RunEnded") -- serveur -> (finalScore)
RunRemote.ZoneAdvanced = getOrCreate("RemoteEvent", folder, "ZoneAdvanced") -- serveur -> (zoneIndex, zoneName)

return RunRemote