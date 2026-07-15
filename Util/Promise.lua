--[[
	Author      : Lopapon
	Module      : Shared/Util/Promise
	Description : Implementation minimale de Promise (pas un re-export Nova --
	              Nova n'a pas de module Promise, voir README). Sert a chainer des
	              operations asynchrones (MarketplaceService, DataStore) sans
	              empiler les callbacks. Volontairement simple : pas de vraie
	              gestion de concurrence complexe, suffisant pour les besoins
	              actuels du projet.
	Usage : Promise.new(function(resolve, reject)
	            task.spawn(function()
	                local ok, result = pcall(doSomething)
	                if ok then resolve(result) else reject(result) end
	            end)
	        end):andThen(function(result) ... end):catch(function(err) ... end)
]]

local Promise = {}
Promise.__index = Promise

export type Status = "Pending" | "Resolved" | "Rejected"

function Promise.new(executor: (resolve: (any) -> (), reject: (any) -> ()) -> ())
	local self = setmetatable({}, Promise)
	self._status = "Pending" :: Status
	self._value = nil
	self._callbacks = {} -- { { OnResolve, OnReject } }

	local function resolve(value: any)
		if self._status ~= "Pending" then
			return
		end
		self._status = "Resolved"
		self._value = value
		for _, callback in ipairs(self._callbacks) do
			if callback.OnResolve then
				callback.OnResolve(value)
			end
		end
	end

	local function reject(err: any)
		if self._status ~= "Pending" then
			return
		end
		self._status = "Rejected"
		self._value = err
		for _, callback in ipairs(self._callbacks) do
			if callback.OnReject then
				callback.OnReject(err)
			end
		end
	end

	local ok, err = pcall(executor, resolve, reject)
	if not ok then
		reject(err)
	end

	return self
end

function Promise.resolve(value: any)
	return Promise.new(function(resolve)
		resolve(value)
	end)
end

function Promise.reject(err: any)
	return Promise.new(function(_, reject)
		reject(err)
	end)
end

-- Attend que toutes les Promise passent en Resolved (rejette des le premier echec)
function Promise.all(promises: { any })
	return Promise.new(function(resolve, reject)
		local results = {}
		local remaining = #promises

		if remaining == 0 then
			resolve(results)
			return
		end

		for index, promise in ipairs(promises) do
			promise:andThen(function(value)
				results[index] = value
				remaining -= 1
				if remaining == 0 then
					resolve(results)
				end
			end):catch(function(err)
				reject(err)
			end)
		end
	end)
end

function Promise:andThen(onResolve: (any) -> ()): any
	if self._status == "Resolved" then
		task.spawn(onResolve, self._value)
	elseif self._status == "Pending" then
		table.insert(self._callbacks, { OnResolve = onResolve })
	end
	return self
end

function Promise:catch(onReject: (any) -> ()): any
	if self._status == "Rejected" then
		task.spawn(onReject, self._value)
	elseif self._status == "Pending" then
		table.insert(self._callbacks, { OnReject = onReject })
	end
	return self
end

-- Bloquant : attend la resolution/rejet et retourne (ok, value). A utiliser avec
-- parcimonie (meme logique de precaution que Signal:Wait dans Nova).
function Promise:Await(): (boolean, any)
	while self._status == "Pending" do
		task.wait()
	end
	return self._status == "Resolved", self._value
end

return Promise