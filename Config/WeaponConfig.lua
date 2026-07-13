--[[
	Author      : Lopapon
	Module      : Shared/Config/WeaponConfig
	Description : Registre des armes. `Type` determine le pattern d'attaque cote
	              WeaponService : "Circle" touche toutes les cibles dans le rayon,
	              "Nearest" ne touche que la plus proche.
	              Pattern registry/factory : ajouter une arme = ajouter une entree ici,
	              rien d'autre a toucher.
]]

local WeaponConfig = {}

WeaponConfig.Dagger = {
	Id = "Dagger",
	Type = "Nearest",
	Damage = 15,
	Cooldown = 0.8,
	Range = 8,
}

WeaponConfig.CircleBlade = {
	Id = "CircleBlade",
	Type = "Circle",
	Damage = 8,
	Cooldown = 1.5,
	Range = 12,
}

return WeaponConfig