--! file: rotatingRectangle.lua

-- draw and manage rectangles drawn from lines so that they can be rotated

-- extends Rectangle
RotatingRectangle = Rectangle:extend()

-- constructor for RotatingRectangle
function RotatingRectangle:new(kind, x, y, speed, width, height, rotation,
                               rotationRate)
   RotatingRectangle.super.new(self, kind, x, y, speed, width, height)
   self.rotation = rotation
   self.rotationRate = rotationRate
end

-- draw rectangle with lines
function RotatingRectangle:draw()
   love.graphics.line(x, 
                      y, 
                      x+width * math.cos(self.rotation), 
                      y * math.sin(self.rotation), 
                      x+width * math.cos(self.rotation + (math.pi / 2)),
                      y+height * math.sin(self.rotation + (math.pi / 2)), 
                      x * math.cos(self.rotation + math.pi), 
                      y+height * math.sin(self.rotation + math.pi), 
                      x, 
                      y)
end

-- generate points for drawing rectangle
function RotatingRectangle:getRoute()
   local topLeftX = self.x
   local topLeftY = self.y
   local topRightX = self.x + (self.width * math.cos(self.rotation))
   local topRightY = self.y + (self.width * math.sin(self.rotation))
   local botRightX = topRightX + (self.height * math.cos(self.rotation + (math.pi / 2)))
   local botRightY = topRightY + (self.height * math.sin(self.rotation + (math.pi / 2)))
   local botLeftX = botRightX + (self.width * math.cos(self.rotation + math.pi))
   local botLeftY = botRightY + (self.width * math.sin(self.rotation + math.pi))
   return topLeftX, 
   topLeftY, 
   topRightX, 
   topRightY, 
   botRightX, 
   botRightY,
   botLeftX, 
   botLeftY, 
   topLeftX, 
   topLeftY
end

-- get all the rectangle's points, clockwise from top left
function RotatingRectangle:getPoints()
   local topLeftX = self.x
   local topLeftY = self.y
   local topRightX = self.x + (self.width * math.cos(self.rotation))
   local topRightY = self.y + (self.width * math.sin(self.rotation))
   local botRightX = topRightX + (self.height * math.cos(self.rotation + (math.pi / 2)))
   local botRightY = topRightY + (self.height * math.sin(self.rotation + (math.pi / 2)))
   local botLeftX = botRightX + (self.width * math.cos(self.rotation + math.pi))
   local botLeftY = botRightY + (self.width * math.sin(self.rotation + math.pi))
   return topLeftX, 
   topLeftY, 
   topRightX, 
   topRightY, 
   botRightX, 
   botRightY,
   botLeftX, 
   botLeftY 
end

-- check to see if two RotatingRectangles are colliding
function checkCollision(a,b)

   -- grab each rectangle's lines
   linesA = getLines(a:getPoints())
   linesB = getLines(b:getPoints())
   
   -- check to see if any of them intersect
   for ii,lineA in ipairs(linesA) do
      for jj,lineB in ipairs(linesB) do
         if checkIntersect(lineA, lineB) then
            return true
         end
      end
   end
   
end

-- check to see if two line segments intersect
function checkIntersect(a,b)

   return !((((a[1] - a[3]) * (b[2] - b[4])) - ((a[2] - a[4]) * (b[1] - b[3]))) == 0)

end

-- get a rectangle's lines
function getLines(topLeftX, topLeftY, topRightX, topRightY,
                  botRightX, botRightY, botLeftX, botLeftY)
   local topLine = {topLeftX, topLeftY, topRightX, topRightY}
   local rightLine = {topRightX, topRightY, botRightX, botRightY}
   local botLine = {botRightX, botRightY, botLeftX, botLeftY}
   local leftLine = {botLeftX, botLeftY, topLeftX, topLefty}

   return {topLine, rightLine, botLine, leftLine}
end
