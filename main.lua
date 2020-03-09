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

   -- include RotatingRectangle object
   require("rotatingRectangle")

   -- include Car object
   require("car")
   

   -- initialize a couple Rectangles
   --rect1 = Rectangle("line", 10, 10, 100, 100, 100)
   --rect2 = Rectangle("line", 250, 120, 0, 150, 120)
 
   -- initialize a new Circle
   --circ = Circle("line", 100, 200, 100, 100)
   
   -- load up a car
   wagon = Car("wagon.png", 10, 10, 100, 0, 0.8, 0.1) 
   
   -- draw an obstacle
   pillar = Rectangle("line", 300, 300, 0, 100, 100)

   end

-- pretty output
function love.draw()
   
   -- if collision detected, fill rectangles
   --local mode
   --if checkCollision(rect1, rect2) then
   --   rect1.kind = "fill"
   --   rect2.kind = "fill"
   --else
   --   rect1.kind = "line"
   --   rect2.kind = "line"
   --end

   --rect1:draw()
   --rect2:draw()
   --circ:draw()
   --love.graphics.draw(wagonImg, 0, 100, 0, 0.2, 0.2)
   
   wagon:draw()
   
   if checkCollision(wagon, pillar) then
      pillar.kind = "fill"
   else
      pillar.kind = "line"
   end

   pillar:draw()

end

-- continually update variables
function love.update(dt)
   --rect1:update(dt)
   --circ:update(dt)
   wagon:update(dt)
   pillar:update(dt)
end
