--[[
	Author      : Lopapon
	Module      : Shared/Remotes/InventoryRemote
	Description : RemoteEvents pour l'equipement d'armes cote client (menu
	              d'inventaire). Le serveur reste seul juge via InventoryService --
	              ces remotes ne font que transmettre l'intention du joueur.
]]

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local FOLDER_NAME = "InventoryRemote"

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

local InventoryRemote = {}

InventoryRemote.RequestEquip = getOrCreate("RemoteEvent", folder, "RequestEquip") -- (player) -> weaponId
InventoryRemote.RequestUnequip = getOrCreate("RemoteEvent", folder, "RequestUnequip") -- (player) -> weaponId
InventoryRemote.InventoryUpdated = getOrCreate("RemoteEvent", folder, "InventoryUpdated") -- serveur -> (equippedWeaponIds)

return InventoryRemote