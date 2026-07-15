--[[
	Author      : Lopapon
	Module      : Shared/Config/DifficultyConfig
	Description : Source de verite pour les reglages de scaling de difficulte.
	              DifficultyService garde ses propres constantes en dur pour
	              l'instant (voir DifficultyService.lua) -- ce fichier existe en
	              prevision du jour ou on voudra tuner sans toucher au code, ou
	              faire des reglages par map/mode (Ranked vs PvE par exemple).
]]

local DifficultyConfig = {}

DifficultyConfig.BaseMultiplier = 1.0
DifficultyConfig.TimeScalingPerMinute = 0.15
DifficultyConfig.PlayerScalingPerExtra = 0.35

-- Garde-fous
DifficultyConfig.MaxDifficultyMultiplier = 8.0

function DifficultyConfig.Clamp(multiplier: number): number
	return math.min(multiplier, DifficultyConfig.MaxDifficultyMultiplier)
end

return DifficultyConfig