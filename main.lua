--! file: main.lua

-- entry point for game framework

-- enable immediate console output
io.stdout:setvbuf("no")

-- load variables beforehand
function love.load()

 -- include Rectangle object
 require("rectangle")

 -- initialize a new Rectangle
 rect = Rectangle()
 
end

-- pretty output
function love.draw()
   --love.graphics.rectangle("line", x, y, 200, 150)
   rect:draw()
end

-- continually update variables
function love.update(dt)
   
   rect:update(dt)

   ---- oscillate when space is pressed
   --if love.keyboard.isDown("space") then
   --   oscillatePosition(dt)
   --end

   ---- move according to arrow keys
   --if love.keyboard.isDown("left") then
   --   x = x - 100 * dt
   --end
   --if love.keyboard.isDown("right") then
   --   x = x + 100 * dt
   --end
   --if love.keyboard.isDown("up") then
   --   y = y - 100 * dt
   --end
   --if love.keyboard.isDown("down") then
   --   y = y + 100 * dt
   --end

end
