--[[
	Author      : Lopapon
	Module      : Shared/Config/GameConfig
	Description : Constantes globales transverses, pas propres a un domaine
	              precis (pas de home naturel dans DifficultyConfig/MobConfig/etc).
	              Sert surtout a eviter les valeurs en dur eparpillees dans plusieurs
	              Services qui n'ont pas de lien logique entre eux.
]]

local GameConfig = {}

-- Party / Run
GameConfig.MAX_PARTY_SIZE = 4
GameConfig.PAD_CAPTURE_RADIUS = 15

-- Economie
GameConfig.CurrencyName = "Gold"

-- Lobby <-> Game (places separees, voir TeleportService)
GameConfig.LobbyPlaceId = 0 -- a remplir avec le vrai PlaceId une fois publie
GameConfig.GamePlaceId = 0

-- Divers
GameConfig.MaxWeaponSlots = 6

return GameConfig