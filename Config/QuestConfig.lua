--[[
	Author      : Lopapon
	Module      : Shared/Config/QuestConfig
	Description : Registre des quetes. Objective.Type determine comment
	              QuestService traque la progression ("KillMob" ecoute MobDied et
	              filtre par Objective.Target, par exemple).
	              Pattern registry/factory : ajouter une quete = ajouter une entree
	              ici, rien d'autre a toucher (QuestService lit par Id).
]]

export type QuestObjective = {
	Type: "KillMob" | "ReachZone" | "CompleteRuns",
	Target: string?, -- MobId pour KillMob, nil pour les autres types
	Amount: number,
}

local QuestConfig = {}

QuestConfig.KillSlimes = {
	Id = "KillSlimes",
	Name = "Nettoyage de printemps",
	Description = "Elimine 20 Slimes",
	Objective = { Type = "KillMob", Target = "Slime", Amount = 20 } :: QuestObjective,
	Rewards = {
		{ Type = "Gold", Amount = 50 },
	},
	NextQuestId = "ReachZone3",
}

QuestConfig.ReachZone3 = {
	Id = "ReachZone3",
	Name = "Vers l'inconnu",
	Description = "Atteins la zone 3 dans une run",
	Objective = { Type = "ReachZone", Target = nil, Amount = 3 } :: QuestObjective,
	Rewards = {
		{ Type = "Gold", Amount = 100 },
	},
	NextQuestId = nil,
}

function QuestConfig.GetAll(): { any }
	local list = {}
	for _, entry in pairs(QuestConfig) do
		if type(entry) == "table" and entry.Id then
			table.insert(list, entry)
		end
	end
	return list
end

return QuestConfig