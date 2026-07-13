--[[
	Author      : Lopapon
	Module      : Shared/Config/ZoneConfig
	Description : Remplace l'ancien StageConfig, suite a la suppression de
	              StageService au profit de ZoneService (zones physiques + mist
	              barriers plutot que progression abstraite par vagues).
	              ZoneService gere la DUREE globale (ZONE_DURATION, identique pour
	              toutes les zones) -- ce fichier sert a nommer/decrire chaque zone
	              et permet des overrides ponctuels (ex: une zone plus courte pour
	              un evenement) sans toucher a ZoneService.
	Pattern registry/factory : ajouter une zone = ajouter une entree ici, rien
	              d'autre a toucher.
]]

local ZoneConfig = {}

ZoneConfig.Zones = {
	[1] = { Id = "Zone1", Name = "Clairiere de depart", DurationOverride = nil },
	[2] = { Id = "Zone2", Name = "Foret dense", DurationOverride = nil },
	[3] = { Id = "Zone3", Name = "Marais brumeux", DurationOverride = nil },
	[4] = { Id = "Zone4", Name = "Ruines oubliees", DurationOverride = nil },
	[5] = { Id = "Zone5", Name = "Antre du Roi Slime", DurationOverride = nil }, -- correspond a BossConfig.SlimeKing.TriggerZone
}

-- Retourne les metadonnees d'une zone (nil si l'index depasse la derniere zone
-- definie -- ZoneService continue quand meme a incrementer ZoneIndex a l'infini,
-- ce module sert uniquement au nommage/affichage, jamais a bloquer la progression)
function ZoneConfig.GetZone(zoneIndex: number): any?
	return ZoneConfig.Zones[zoneIndex]
end

-- Duree effective d'une zone : l'override si defini, sinon nil (= ZoneService utilise
-- sa propre constante ZONE_DURATION par defaut)
function ZoneConfig.GetDurationOverride(zoneIndex: number): number?
	local zone = ZoneConfig.Zones[zoneIndex]
	return zone and zone.DurationOverride
end

return ZoneConfig