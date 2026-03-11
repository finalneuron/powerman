declare isCharging flag
declare MINCHARGE constant
declare MAXCHARGE constant
declare storedPow var

loop
  read storedPow
  if storedPow < minCharge and !isCharging
    turn on reactor
    isCharging = true
  else if storedPow > maxCharge and isCharging
    turn off reactor
    isCharging = false
end