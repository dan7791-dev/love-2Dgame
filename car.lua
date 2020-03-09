--! file: car.lua

-- baseclass for wheeled vehicular movement

Car = RotatingRectangle:extend()

-- constructor
function Car:new(image, x, y, speed, rotation, rotationRate, scale)
  self.image = love.graphics.newImage(image)
  Car.super.new(self, image, x, y, speed, self.image:getWidth() * scale,
                self.image:getHeight() * scale, rotation, rotationRate) 
  self.scale = scale
end


-- draw function
function Car:draw()
   love.graphics.draw(self.image, self.x, self.y, self.rotation, self.scale,
                      self.scale, self.width/2, self.height/2)
   love.graphics.line(self:getRoute())
   --print("x:" .. self.x .. 
   --         " y:" .. self.y .. 
   --         " r:" .. self.rotation .. 
   --         " w:" .. self.width ..
   --" h:" .. self.height)
   end

-- update
function Car:update(dt)
  
   if love.keyboard.isDown("up") then
     self.x = self.x + self.speed * dt * math.cos(self.rotation)
     self.y = self.y + self.speed * dt * math.sin(self.rotation) 
   end
   
   if love.keyboard.isDown("down") then
     self.x = self.x - self.speed * dt * math.cos(self.rotation) 
     self.y = self.y - self.speed * dt * math.sin(self.rotation) 
   end

   if love.keyboard.isDown("left") then
      self.rotation = self.rotation - (self.rotationRate * dt)
   end
   
   if love.keyboard.isDown("right") then
      self.rotation = self.rotation + (self.rotationRate * dt)
   end

end
