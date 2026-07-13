--[[
	Author      : Lopapon
	Module      : Shared/Types/HeroTypes
	Description : Types partages pour le systeme de heros. ActiveSpellId,
	              PassiveSpellIds et AwakeningId referencent des IDs vers de futurs
	              SpellConfig/AwakeningConfig (pas encore construits) -- meme
	              pattern d'ID que Weapon/Mob/Boss, rien a casser quand ils arriveront.
]]

export type HeroConfigEntry = {
	Id: string,
	Name: string,
	StarterWeapon: string,
	ActiveSpellId: string?, -- competence active (keybind), nil tant que SpellConfig n'existe pas
	PassiveSpellIds: { string }, -- jusqu'a 3 passifs, vide tant que SpellConfig n'existe pas
	AwakeningId: string?, -- reference vers un futur AwakeningConfig
	BaseStatModifiers: { [string]: number }?, -- tweaks optionnels (ex: {Speed = 2} pour un hero rapide)
}

return {}