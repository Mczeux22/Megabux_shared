--[[
	Author      : Lopapon
	Module      : Shared/Config/ChestConfig
	Description : Types de coffres. Chaque entree definit du Gold garanti (fourchette)
	              + des drops bonus (meme format que LootConfig.MobBonusDrops).
	              Un coffre place dans une map doit avoir le tag CollectionService
	              "Chest" + un attribut "ChestId" correspondant a une cle ici.
]]

local ChestConfig = {}

ChestConfig.Common = {
	Id = "Common",
	GuaranteedGold = { Min = 10, Max = 20 },
	BonusDrops = {
		{ Type = "Gold", Chance = 0.5, MinAmount = 5, MaxAmount = 15 },
	},
}

ChestConfig.Rare = {
	Id = "Rare",
	GuaranteedGold = { Min = 30, Max = 60 },
	BonusDrops = {
		{ Type = "Gold", Chance = 0.7, MinAmount = 15, MaxAmount = 30 },
	},
}

return ChestConfig