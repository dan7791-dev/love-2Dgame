function color()
   for i = 1, 7 do
      math.randomseed(os.time())
      a = math.random(1,7)
      return(a)
   end
end

function love.load()
    balloon = {}
    balloon.x = 200
    balloon.y = 200
    balloon.speed = 300
    balloon.angle = 0
    balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. color() .. ".png")
end

function love.update(dt)
    mouse_x, mouse_y = love.mouse.getPosition()
    balloon.angle = math.atan2(mouse_y - balloon.y, mouse_x - balloon.x)
    cos = math.cos(balloon.angle)
    sin = math.sin(balloon.angle)

    balloon.x = balloon.x + balloon.speed * cos * dt
    balloon.y = balloon.y + balloon.speed * sin * dt
end

function love.draw()
    love.graphics.draw(balloon.image, balloon.x, balloon.y, balloon.angle)
    love.graphics.circle("fill", mouse_x, mouse_y, 5)
end
