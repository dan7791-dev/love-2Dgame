--! file: shape.lua

-- handle positioning and movement of shapes

Shape = Object:extend()

-- include oscillating movement
osc = require("oscillation")

-- constructor for a new shape 
function Shape:new(kind, x, y, speed)
   self.kind = kind
   self.x = x
   self.y = y
   self.speed = speed 
end

-- update shape's position
function Shape:update(dt)
   
   -- oscillate when space is pressed
   if love.keyboard.isDown("space") then
      self.x = math.abs(oscillateValue(dt) * 600)
   end

   -- move according to arrow keys
   if love.keyboard.isDown("left") then
      self.x = self.x - self.speed * dt
   end
   if love.keyboard.isDown("right") then
      self.x = self.x + self.speed * dt
   end
   if love.keyboard.isDown("up") then
      self.y = self.y - self.speed * dt
   end
   if love.keyboard.isDown("down") then
      self.y = self.y + self.speed * dt
   end

end
