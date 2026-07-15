--[[
	Author      : Lopapon
	Module      : Shared/Remotes/CombatRemote
	Description : Cree/expose les RemoteEvents lies au combat. Cree cote serveur
	              au premier require (Bootstrap.server.lua le require tot via les
	              Services qui en ont besoin), le client fait juste WaitForChild.
	              UseAbility = client -> serveur (declenche AbilityService).
	              DamageDealt = serveur -> client, relai leger de EntityDamaged pour
	              les hooks visuels (FloatingDamageSystem, ScreenShakeSystem).
]]

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local FOLDER_NAME = "CombatRemote"

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

local CombatRemote = {}

CombatRemote.UseAbility = getOrCreate("RemoteEvent", folder, "UseAbility") -- (player) -> abilityId
CombatRemote.DamageDealt = getOrCreate("RemoteEvent", folder, "DamageDealt") -- serveur -> (humanoid, amount, isCrit)

return CombatRemote