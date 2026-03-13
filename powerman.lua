--powerman.lua
--Manages the BigReactor to maintain proper energy
--storage charge levels.

isRunning = false
MINCHARGE = 20	--Percentage
MAXCHARGE = 80	--Percentage
powerPerc = 0	--Percentage

compStorage = --power storage component
compReactor = --reactor component

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
--	pow = --method to get the stored power
--	max = --method to get max storable power
--	return ((pow/max)
end