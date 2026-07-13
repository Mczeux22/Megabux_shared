--[[
	Author      : Lopapon
	Module      : Shared/Types/RewardTypes
	Description : Types partages pour le systeme de recompenses (XP, Gold, Items)
]]

export type RewardType = "XP" | "Gold" | "Item"

export type RewardEntry = {
	Type: RewardType,
	Amount: number,
	ItemId: string?, -- utilise seulement si Type == "Item"
}

export type LootDropEntry = {
	Type: RewardType,
	Chance: number, -- entre 0 et 1
	MinAmount: number,
	MaxAmount: number,
	ItemId: string?,
}

return {}