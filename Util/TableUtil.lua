--[[
	Author      : Lopapon
	Module      : Shared/Util/TableUtil
	Description : Re-export de Nova.Table (copy, mutation, search). Existe uniquement
	              pour que le code cote client puisse faire require(.../Util/TableUtil)
	              sans connaitre le chemin interne de Nova -- aucune logique dupliquee ici.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Nova = require(ReplicatedStorage.Shared.Nova)

return Nova.Table