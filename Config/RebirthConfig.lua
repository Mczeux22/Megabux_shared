--[[
	Author      : Lopapon
	Module      : Shared/Config/RebirthConfig
	Description : Parametres du systeme de rebirth (prestige) : reset de la
	              progression meta (Level persistant + Gold + armes debloquees)
	              contre un bonus permanent qui stack lineairement avec
	              RebirthCount. RebirthCount est deja porte par DataTemplate,
	              ce module ne fait que le configurer -- RebirthService applique
	              la logique.
]]

local RebirthConfig = {}

RebirthConfig.RequiredLevel = 20 -- Level (persistant) minimum pour pouvoir rebirth
RebirthConfig.GoldCost = 500     -- cout en Gold en plus du niveau requis

-- Bonus permanent applique via StatService a chaque connexion, stack lineairement
-- avec RebirthCount (ex: 3 rebirths = +15% dégâts en permanence)
RebirthConfig.Bonus = {
	Stat = "Damage",
	Type = "Percent",
	ValuePerRebirth = 0.05,
}

RebirthConfig.MaxRebirths = nil -- nil = illimite

return RebirthConfig