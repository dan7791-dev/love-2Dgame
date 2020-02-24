-- enable immediate console output
io.stdout:setvbuf("no")

-- load variables beforehand
function love.load()
   
   -- initialize position
   x = 600
   y = 50

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
   love.graphics.rectangle("line", x, y, 200, 150)
end

-- continually update variables
function love.update(dt)
   
   -- oscillate when space is pressed
   if love.keyboard.isDown("space") then
      oscillatePosition(dt)
   end

   -- move according to arrow keys
   if love.keyboard.isDown("left") then
      x = x - 100 * dt
   end
   if love.keyboard.isDown("right") then
      x = x + 100 * dt
   end
   if love.keyboard.isDown("up") then
      y = y - 100 * dt
   end
   if love.keyboard.isDown("down") then
      y = y + 100 * dt
   end

end
