-- enable immediate console output
io.stdout:setvbuf("no")

-- load variables beforehand
function love.load()
   x = 600
   
   -- start time to be 0
   oscTime = 0

end

-- loop time over [0,2\pi] harmonically
function incrementHarmonicTimeOscillation(dt)
   
   -- reset time if over
   if (oscTime > 2 * math.pi) then
      oscTime = 0
   end

   -- increment time by dt
   oscTime = oscTime + dt

end

-- oscillate position variable 
function oscillatePosition(dt)
   
   incrementHarmonicTimeOscillation(dt)
   x = math.abs(600 * math.cos(oscTime))
   
end

-- pretty output
function love.draw()
   love.graphics.rectangle("line", x, 50, 200, 150)
end

-- continually update variables
function love.update(dt)
   
   -- only move when space is pressed
   if love.keyboard.isDown("space") then
      oscillatePosition(dt)
   end

end
