--! file: rectangle.lua

-- class for creating rectangles

-- include the class-building module
--Object = require("classic")

-- include shape baseclass
--Shape = require("shape")

-- declare a "Rectangle" object
Rectangle = Shape:extend()

---- default constructor for Rectangle object
--function Rectangle:new()
--   self.kind = "line"
--   self.x = 600
--   self.y = 50
--   self.width = 200
--   self.height = 150
--end

-- constructor for Rectangle object with custom dimensions
function Rectangle:new(kind, x, y, speed, width, height)
  Rectangle.super.new(self, kind, x, y, speed)
  self.width = width
  self.height = height
end

-- draw the created rectangle onto the screen
function Rectangle:draw()
   love.graphics.rectangle(self.kind, self.x, self.y, self.width, self.height)
end

---- update the drawn rectangle
--function Rectangle:update(dt)
--
--  -- oscillate when space is pressed
--   if love.keyboard.isDown("space") then
--      self.x = math.abs(oscillateValue(dt) * 600)
--   end
--
--   -- move according to arrow keys
--   if love.keyboard.isDown("left") then
--      self.x = self.x - 100 * dt
--   end
--   if love.keyboard.isDown("right") then
--      self.x = self.x + 100 * dt
--   end
--   if love.keyboard.isDown("up") then
--      self.y = self.y - 100 * dt
--   end
--   if love.keyboard.isDown("down") then
--      self.y = self.y + 100 * dt
--   end
-- 
--end
