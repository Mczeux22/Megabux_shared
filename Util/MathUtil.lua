--[[
	Author      : Lopapon
	Module      : Shared/Util/MathUtil
	Description : Re-export de Nova.Math (lerp, clamp, distance, geometry, random...).
	              Existe uniquement pour que le code cote client puisse faire
	              require(.../Util/MathUtil) sans connaitre le chemin interne de
	              Nova -- aucune logique dupliquee ici.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Nova = require(ReplicatedStorage.Shared.Nova)

return Nova.Math