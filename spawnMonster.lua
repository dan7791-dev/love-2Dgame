function createMonster() {
   local monster = {
      glowingImage = love.graphics.newImage("art/glowing.png")

      love.graphics.draw(glowingImage,100,100)
   }
   return monster
}
end
