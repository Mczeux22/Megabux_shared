--[[
	Author      : Lopapon
	Module      : Shared/Util/RandomUtil
	Description : Re-export des fonctions aleatoires de Nova.Math. Nova n'a pas de
	              sous-module Random expose separement (tout est regroupe dans
	              Nova.Math) -- ce fichier isole juste les fonctions random pour un
	              acces plus lisible cote client, sans dupliquer leur implementation.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Nova = require(ReplicatedStorage.Shared.Nova)

return {
	randomFloat = Nova.Math.randomFloat,
	randomInt   = Nova.Math.randomInt,
	randomSign  = Nova.Math.randomSign,
	chance      = Nova.Math.chance,
	randomAngle = Nova.Math.randomAngle,
}