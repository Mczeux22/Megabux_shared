--[[
	Author      : Lopapon
	Module      : Shared/Remotes/UIEventRemote
	Description : Remote generique "fourre-tout" pour les notifications UI qui
	              n'ont pas leur propre canal dedie (toasts, recompenses recues,
	              quete completee). Evite de creer un RemoteEvent par petit hook
	              visuel -- si un canal grossit beaucoup, il merite son propre
	              fichier Remote (voir UpgradeRemote/RunRemote).
	Usage serveur : UIEventRemote.Notify:FireClient(player, "Coffre ouvert !", "Info")
	Usage client  : UIEventRemote.Notify.OnClientEvent:Connect(function(text, kind) ... end)
]]

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local FOLDER_NAME = "UIEventRemote"

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

local UIEventRemote = {}

UIEventRemote.Notify = getOrCreate("RemoteEvent", folder, "Notify") -- serveur -> (text, kind: "Info"|"Warn"|"Success")
UIEventRemote.RewardGranted = getOrCreate("RemoteEvent", folder, "RewardGranted") -- serveur -> (rewardEntry)
UIEventRemote.QuestUpdated = getOrCreate("RemoteEvent", folder, "QuestUpdated") -- serveur -> (questId, progress, amount)
UIEventRemote.QuestCompleted = getOrCreate("RemoteEvent", folder, "QuestCompleted") -- serveur -> (questId)

return UIEventRemote