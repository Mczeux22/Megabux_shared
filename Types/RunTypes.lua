--[[
	Author      : Lopapon
	Module      : Shared/Types/RunTypes
	Description : Types partages pour le systeme de Run (instances de partie)
]]

export type RunState = "Waiting" | "Active" | "Ending"

export type RunInfo = {
	RunId: number,
	State: RunState,
	Players: { Player },
	StartTime: number,
	Offset: Vector3,
}

return {}