--[[
	Author      : Lopapon
	Module      : Shared/Util/Signal
	Description : Re-export de Nova.Signal. Existe uniquement pour que le code cote
	              client puisse faire require(.../Util/Signal) sans connaitre le
	              chemin interne de Nova -- aucune logique dupliquee ici.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Nova = require(ReplicatedStorage.Shared.Nova)

return Nova.Signal