--[[
	Author      : Lopapon
	Module      : Shared/Config/MobConfig
	Description : Templates de mobs. Chaque entree reference un Model dans
	              ServerStorage.MobTemplates.<id> (clone au spawn), avec ses stats
	              de base, son poids de spawn (random pondere) et le stage minimum
	              auquel il peut apparaitre.

	              Pattern registry/factory : ajouter un mob = ajouter une entree ici
	              + un Model dans ServerStorage.MobTemplates, rien d'autre a toucher.
]]

local MobConfig = {}

MobConfig.Basicux = {
	Id = "Basicux",
	BaseStats = {
		MaxHP = 20,
		Damage = 5,
		Speed = 10,
		XPReward = 2,
		GoldReward = 1,
	},
	SpawnWeight = 10, -- plus le poids est haut, plus il apparait souvent
	MinStage = 1,
}

MobConfig.Midux = {
	Id = "Midux",
	BaseStats = {
		MaxHP = 35,
		Damage = 8,
		Speed = 14,
		XPReward = 4,
		GoldReward = 2,
	},
	SpawnWeight = 6,
	MinStage = 2,
}

MobConfig.Brutux = {
	Id = "Brutux",
	BaseStats = {
		MaxHP = 80,
		Damage = 15,
		Speed = 8,
		XPReward = 10,
		GoldReward = 5,
	},
	SpawnWeight = 2,
	MinStage = 4,
}

-- Retourne la liste des mobs debloques a un stage donne (utilise par SpawnService)
function MobConfig.GetAvailableAtStage(stageIndex: number): { any }
	local available = {}
	for _, mobData in pairs(MobConfig) do
		if type(mobData) == "table" and mobData.MinStage and mobData.MinStage <= stageIndex then
			table.insert(available, mobData)
		end
	end
	return available
end

return MobConfig