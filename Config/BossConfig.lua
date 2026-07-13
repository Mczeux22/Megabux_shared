--[[
	Author      : Lopapon
	Module      : Shared/Config/BossConfig
	Description : Registre des boss. Contrairement aux mobs normaux, les stats ne
	              scalent PAS avec DifficultyService -- un boss est un combat fixe et
	              scripte, pas un ennemi qui monte en puissance en continu.
	              TriggerStage = stage exact auquel le boss apparait (un seul spawn
	              par run, voir BossService). PhaseThresholds = seuils de % HP
	              restant qui declenchent un changement de phase (ex: 0.66 = phase 2
	              a 66% HP, 0.33 = phase 3 a 33% HP).

	              Pattern registry/factory : ajouter un boss = ajouter une entree ici
	              + un Model dans ServerStorage.BossTemplates, rien d'autre a toucher.
]]

local BossConfig = {}

BossConfig.SlimeKing = {
	Id = "SlimeKing",
	TriggerZone = 5,
	BaseStats = {
		MaxHP = 500,
		Damage = 25,
		Speed = 9,
		XPReward = 50,
		GoldReward = 30,
	},
	PhaseThresholds = { 0.66, 0.33 },
}

-- Retourne l'entree de boss dont le TriggerZone correspond exactement a la zone donnee
function BossConfig.GetBossForZone(zoneIndex: number): any?
	for _, bossData in pairs(BossConfig) do
		if type(bossData) == "table" and bossData.TriggerZone == zoneIndex then
			return bossData
		end
	end
	return nil
end

return BossConfig