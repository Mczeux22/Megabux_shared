--[[
	Author      : Lopapon
	Module      : Shared/Config/NPCConfig
	Description : Registre des PNJ du Lobby (marchand, quete-giver, etc).
	              Un PNJ en Studio = un Model tagge "NPC" (CollectionService) avec
	              un attribut "NPCId" correspondant a une cle ici + un ProximityPrompt.
	              Pattern registry/factory : ajouter un PNJ = ajouter une entree ici
	              + le Model tagge dans le Lobby, rien d'autre a toucher.
]]

local NPCConfig = {}

NPCConfig.Merchant = {
	Id = "Merchant",
	DisplayName = "Marchand",
	DialogueLines = {
		"Bienvenue voyageur, jette un oeil a mes marchandises.",
		"Le Gold ne pousse pas dans les arbres, mais les Slimes en lachent.",
	},
	QuestId = nil,
}

NPCConfig.QuestGiver = {
	Id = "QuestGiver",
	DisplayName = "Ancien du village",
	DialogueLines = {
		"Les monstres se multiplient dans la foret... j'ai besoin d'aide.",
	},
	QuestId = "KillSlimes",
}

function NPCConfig.Get(npcId: string): any?
	return NPCConfig[npcId]
end

return NPCConfig