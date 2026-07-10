--[[
	Author      : Lopapon
	Module      : Shared/Types/MobTypes
	Description : Types partages pour le systeme de mobs
]]

export type MobBaseStats = {
	MaxHP: number,
	Damage: number,
	Speed: number,
	XPReward: number,
	GoldReward: number,
}

export type MobConfigEntry = {
	Id: string,
	BaseStats: MobBaseStats,
	SpawnWeight: number,
	MinStage: number,
}

return {}