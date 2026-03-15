--powerman.lua
--Manages the BigReactor to maintain proper energy
--storage charge levels.

local isRunning = false
local MINCHARGE = 20         --Percentage
local MAXCHARGE = 80         --Percentage
local powerPerc = 0          --Percentage

local component = require("component")
local compStorage = component.tile_blockcapacitorbank_name
local compReactor = component.br_reactor

local term = require("term")

--return stored power as a percentage of total
function getPowerPerc()
  pow = compStorage.getEnergyStored() --function to get the stored power
  max = compStorage.getMaxEnergyStored() --function to get max storable power
  val = pow / max * 100
  return val
end

function drawDisplay(isOn, pow)
  term.clear()
  statStr="Reactor: "
  powStr="Stored Power: "
  if isOn then
    print(statStr .. "Online")
  else
    print(statStr .. "Offline")
  end
  print(powStr .. pow .. "%")
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
  drawDisplay(isRunning, powerPerc)
  os.sleep(5)
end
