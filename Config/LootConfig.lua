--[[
	Author      : Lopapon
	Module      : Shared/Config/LootConfig
	Description : Tables de drop BONUS par mob (en plus du XP/Gold garanti deja
	              defini dans MobConfig.BaseStats). Chance de drop supplementaire
	              en Gold pour l'instant -- les drops d'Item seront branches une
	              fois InventoryService/WeaponService construits.

	              Pattern registry : ajouter un mob = ajouter une entree ici,
	              aucune entree = pas de bonus drop (juste XP/Gold de base).
]]

local LootConfig = {}

LootConfig.MobBonusDrops = {
	Slime = {
		{ Type = "Gold", Chance = 0.15, MinAmount = 1, MaxAmount = 3 },
	},
	Skeleton = {
		{ Type = "Gold", Chance = 0.20, MinAmount = 2, MaxAmount = 5 },
	},
	Brute = {
		{ Type = "Gold", Chance = 0.35, MinAmount = 5, MaxAmount = 10 },
	},
	SlimeKing = {
		{ Type = "Gold", Chance = 1.0, MinAmount = 40, MaxAmount = 80 },
	},
}

return LootConfig