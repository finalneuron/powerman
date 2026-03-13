--powerman.lua
--Manages the BigReactor to maintain proper energy
--storage charge levels.

isRunning = false
MINCHARGE = 20	--Percentage
MAXCHARGE = 80	--Percentage
powerPerc = 0	--Percentage

compStorage = --power storage device
compReactor = --reactor device

loop
	powerPerc = getPowerPerc()
	if powerPerc < MINCHARGE and !isRunning
    isRunning = true
--	compReactor.power(on)???
	else if powerPerc > MAXCHARGE and isRunning
    isRunning = false
--	compReactor.power(on)???
	end
end

getPowerPerc()
--return stored power as a percentage of total
--	pow = --method to get the stored power
--	max = --method to get max storable power
--	return (round(pow/max))
end