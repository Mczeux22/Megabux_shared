--[[
	Author      : Lopapon
	Module      : Shared/Config/AbilityConfig
	Description : Registre des competences actives (declenchees manuellement,
	              contrairement aux armes qui s'auto-declenchent via AutoCombatSystem).
	              Pattern registry/factory : ajouter une competence = ajouter une
	              entree ici + gerer son cas dans AbilityService.
]]

local AbilityConfig = {}

AbilityConfig.Heal = {
	Id = "Heal",
	Cooldown = 15,
	HealAmount = 30,
}

AbilityConfig.SpeedBurst = {
	Id = "SpeedBurst",
	Cooldown = 20,
	Duration = 5,
	SpeedBonusPercent = 0.5, -- +50% vitesse pendant Duration secondes
}

return AbilityConfig