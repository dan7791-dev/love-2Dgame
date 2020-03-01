-- enable immediate console output
io.stdout:setvbuf("no")

-- include oscillation functions
require("oscillation")

-- load variables beforehand
function love.load()
   
   -- initialize position
   x = 600
   y = 50

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
