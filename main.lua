--! file: main.lua

-- entry point for game framework

-- enable immediate console output
io.stdout:setvbuf("no")

-- load variables beforehand
function love.load()

   -- include object support class
   Object = require("classic")

   -- include Shape baseclass
   require("shape")

   -- include Rectangle object
   require("rectangle")

   -- include Circle object
   require("circle")

   -- initialize a new Rectangle
   --rect = Rectangle("line", 100, 100, 100, 200, 150)
 
   -- initialize a new Circle
   --circ = Circle("line", 100, 200, 100, 100)
   
   -- load the picture of a station wagon
   wagonImg = love.graphics.newImage("wagon.png")
end

-- pretty output
function love.draw()
   --rect:draw()
   --circ:draw()
   love.graphics.draw(wagonImg, 0, 100, 0, 0.2, 0.2)
end

-- continually update variables
function love.update(dt)
   --rect:update(dt)
   --circ:update(dt)
end
