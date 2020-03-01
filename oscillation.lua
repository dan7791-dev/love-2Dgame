--! file: oscillation.lua

-- start time to be 0
local oscTime = 0

-- loop time over [0,2\pi] harmonically
function incrementHarmonicTimeOscillation(dt)

   -- reset time if over
   if (oscTime > 2 * math.pi) then
      oscTime = 0
   end

   -- increment time by dt
   oscTime = oscTime + dt

end

-- oscillate value 
function oscillateValue(dt)

   incrementHarmonicTimeOscillation(dt)
   return math.cos(oscTime)

end
