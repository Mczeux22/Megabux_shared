--[[
	Author      : Lopapon
	Module      : Shared/Types/WeaponTypes
	Description : Types partages pour le systeme d'armes
]]

export type WeaponAttackType = "Circle" | "Nearest"

export type WeaponConfigEntry = {
	Id: string,
	Type: WeaponAttackType,
	Damage: number,
	Cooldown: number,
	Range: number,
}

return {}