--powerman.lua
--Manages the BigReactor to maintain proper energy
--storage charge levels.

local isRunning = false
local MINCHARGE = 20         --Percentage
local MAXCHARGE = 80         --Percentage
local powerPerc = 0          --Percentage

local component = require("component")
compStorage = component.tile_blockcapacitorbank_name
compReactor = component.br_reactor

--return stored power as a percentage of total
function getPowerPerc()
  pow = compStorage.getEnergyStored() --function to get the stored power
  print("Got stored")
  max = compStorage.getMaxEnergyStored() --function to get max storable power
  print("Got max")
  val = pow / max * 100
  return val
end

while true do
  powerPerc = getPowerPerc()
  if powerPerc < MINCHARGE and not isRunning then
    isRunning = true
    compReactor.setActive(isRunning)
    print("Running")
  elseif powerPerc > MAXCHARGE and isRunning then
    isRunning = false
    compReactor.setActive(isRunning)
    print("Off")
  end
  os.sleep(5)
end