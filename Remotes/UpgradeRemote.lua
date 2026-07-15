--[[
	Author      : Lopapon
	Module      : Shared/Remotes/UpgradeRemote
	Description : RemoteEvents pour l'ecran de levelup. UpgradesOffered relaie
	              "UpgradesOffered" (publie par UpgradeService), ChooseUpgrade est
	              le point d'accroche attendu par UpgradeService:ChooseUpgrade.
]]

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local FOLDER_NAME = "UpgradeRemote"

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

local UpgradeRemote = {}

UpgradeRemote.UpgradesOffered = getOrCreate("RemoteEvent", folder, "UpgradesOffered") -- serveur -> (choices : {UpgradeConfigEntry})
UpgradeRemote.ChooseUpgrade = getOrCreate("RemoteEvent", folder, "ChooseUpgrade") -- (player) -> upgradeId

return UpgradeRemote