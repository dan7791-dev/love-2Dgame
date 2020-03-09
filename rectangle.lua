--! file: rectangle.lua

-- class for creating rectangles

-- declare a "Rectangle" object
Rectangle = Shape:extend()

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

-- check to see if two rectangles are colliding
function checkCollision(a,b)
   
   -- capture bounds of first rectangle
   local a_left = a.x
   local a_right = a.x + a.width
   local a_top = a.y
   local a_bottom = a.y + a.height

   --capture bounds of second rectangle
   local b_left = b.x
   local b_right = b.x + b.width
   local b_top = b.y
   local b_bottom = b.y + b.height

   -- check for collision
   if a_right > b_left and
      a_left < b_right and
      a_bottom > b_top and
      a_top < b_bottom then
         return true
   else 
      return false
   end

end

-- return list of all the points of the rectangle
function Rectangle:getPoints()
   
   -- clockwise starting from top left corner
   return self.x,
   self.y,
   self.x + self.width,
   self.y,
   self.x + self.width,
   self.y + self.height,
   self.x,
   self.y + self.height
   
end

