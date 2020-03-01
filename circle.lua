--! file: circle.lua

-- create circles

Circle = Shape:extend()

-- circle constructor
function Circle:new(kind, x, y, speed, radius)
   Circle.super.new(self, kind, x, y, speed)
   self.radius = radius
end

-- draw the circle on the screen
function Circle:draw()
   love.graphics.circle(self.kind, self.x, self.y, self.speed, self.radius)
end
