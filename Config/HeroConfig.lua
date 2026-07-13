--[[
	Author      : Lopapon
	Module      : Shared/Config/HeroConfig
	Description : Registre des heros jouables. "Default" doit toujours exister --
	              c'est le hero de depart de tout nouveau joueur (voir
	              DataTemplate.UnlockedHeroes / SelectedHero).
	              ActiveSpellId/PassiveSpellIds/AwakeningId restent vides tant que
	              SpellConfig/AwakeningConfig n'existent pas -- voir HeroTypes.
	              Pattern registry/factory : ajouter un hero = ajouter une entree
	              ici, rien d'autre a toucher (HeroService les lit par Id).
]]

local HeroConfig = {}

HeroConfig.Default = {
	Id = "Default",
	Name = "Aventurier",
	StarterWeapon = "Dagger",
	ActiveSpellId = nil,
	PassiveSpellIds = {},
	AwakeningId = nil,
	BaseStatModifiers = {},
}

HeroConfig.Berserker = {
	Id = "Berserker",
	Name = "Berserker",
	StarterWeapon = "CircleBlade",
	ActiveSpellId = nil,
	PassiveSpellIds = {},
	AwakeningId = nil,
	BaseStatModifiers = { Damage = 5 }, -- plus agressif des le depart, moins de survie (a tuner)
}

-- Retourne toutes les entrees de hero sous forme de liste (utile pour un futur menu
-- de selection cote client)
function HeroConfig.GetAll(): { any }
	local list = {}
	for _, entry in pairs(HeroConfig) do
		if type(entry) == "table" and entry.Id then
			table.insert(list, entry)
		end
	end
	return list
end

return HeroConfig