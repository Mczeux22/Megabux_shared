--[[
	Author      : Lopapon
	Module      : Shared/Config/UpgradeConfig
	Description : Registre des upgrades proposees au joueur a chaque levelup in-run.
	              Chaque upgrade applique un modificateur StatService (Stat/Value/Type
	              identiques aux parametres de StatService:AddModifier) et peut etre
	              choisie plusieurs fois jusqu'a MaxStacks (chaque pioche re-applique
	              le modificateur en stack additionnel, jamais en le remplacant).
	              Pattern registry/factory : ajouter un upgrade = ajouter une entree
	              ici, rien d'autre a toucher (UpgradeService les lit via GetAll()).
]]

local UpgradeConfig = {}

UpgradeConfig.DamageBoost = {
	Id = "DamageBoost",
	Name = "Puissance",
	Description = "+15% de degats",
	Stat = "Damage",
	Value = 0.15,
	Type = "Percent",
	MaxStacks = 5,
}

UpgradeConfig.SpeedBoost = {
	Id = "SpeedBoost",
	Name = "Agilite",
	Description = "+10% de vitesse de deplacement",
	Stat = "Speed",
	Value = 0.10,
	Type = "Percent",
	MaxStacks = 3,
}

UpgradeConfig.ArmorBoost = {
	Id = "ArmorBoost",
	Name = "Carapace",
	Description = "+2 armure (reduction de degats)",
	Stat = "Armor",
	Value = 2,
	Type = "Flat",
	MaxStacks = 5,
}

UpgradeConfig.GoldFindBoost = {
	Id = "GoldFindBoost",
	Name = "Chance du marchand",
	Description = "+20% de gold trouve",
	Stat = "GoldFind",
	Value = 0.20,
	Type = "Percent",
	MaxStacks = 4,
}

UpgradeConfig.XPFindBoost = {
	Id = "XPFindBoost",
	Name = "Sagesse",
	Description = "+20% d'XP gagnee",
	Stat = "XPFind",
	Value = 0.20,
	Type = "Percent",
	MaxStacks = 4,
}

-- Retourne toutes les entrees d'upgrade sous forme de liste (utilise par UpgradeService
-- pour tirer des choix aleatoires -- pairs() seul ne suffit pas, on veut un tableau)
function UpgradeConfig.GetAll(): { any }
	local list = {}
	for _, entry in pairs(UpgradeConfig) do
		if type(entry) == "table" and entry.Id then
			table.insert(list, entry)
		end
	end
	return list
end

return UpgradeConfig