--powerman.lua
--Manages the BigReactor to maintain proper energy
--storage charge levels.

local isRunning = false
local MINCHARGE = 20	--Percentage
local MAXCHARGE = 80	--Percentage
local powerPerc = 0		--Percentage

local component = require("component")
local compStorage = component.capacitor_bank
local compReactor = component.br_reactor

while true do
	powerPerc = getPowerPerc()
	if powerPerc < MINCHARGE and !isRunning
    isRunning = true
	compReactor.setActive(isRunning)
	else if powerPerc > MAXCHARGE and isRunning
    isRunning = false
	compReactor.setActive(isRunning)
	end
end

--return stored power as a percentage of total
function getPowerPerc()
	pow = compStorage.getEnergyStored() --function to get the stored power
	max = compStorage.getMaxEnergyStored() --function to get max storable power
	return (pow/max*100)
end