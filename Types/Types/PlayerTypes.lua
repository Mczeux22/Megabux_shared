--[[
	Author      : Lopapon
	Module      : Shared/Types/PlayerTypes
	Description : Types partages pour tout ce qui touche au joueur
]]

export type PersistentData = {
	Version: number,
	Level: number,
	XP: number,
	Gold: number,
	UnlockedHeroes: { string },
	UnlockedWeapons: { string },
	SelectedHero: string,
	RebirthCount: number,
	Stats: {
		RunsCompleted: number,
		TotalKills: number,
		BestTime: number,
	},
	LastSaved: number,
}

-- Etat runtime : reset a chaque run, jamais sauvegarde
export type RuntimeState = {
	InRun: boolean,
	RunId: number?,
	CurrentHP: number,
	MaxHP: number,
	CurrentXP: number,
	Kills: number,
}

return {}
