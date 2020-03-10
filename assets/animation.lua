function balloon_color()
   for i = 1, 7 do
      math.randomseed(os.time())
      a = math.random(1,7)
      return(a)
   end
end

function checkCollision()

end

function love.load()
	-- speech cloud tutorial
	speech_cloud = {}
	speech_cloud.x = 10
	speech_cloud.y = 10
	speech_cloud.image = love.graphics.newImage("assets/shapes/speech_cloud.png")

	-- chase balloon
    balloon = {}
    balloon.x = 200
    balloon.y = 200
    balloon.speed = 300
    balloon.angle = 0
    balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. balloon_color() .. ".png")
	
	-- runaway cloud 
	runaway_cloud = {}
	runaway_cloud.x = 150
	runaway_cloud.y = 150
	runaway_cloud = love.graphics.newImage("assets/shapes/runaway_cloud.png")
end

function love.update(dt)
	-- calculate balloon angle relative to original position of mouse pointer
    mouse_x, mouse_y = love.mouse.getPosition()
    balloon.angle = math.atan2(mouse_y - balloon.y, mouse_x - balloon.x)
    cos = math.cos(balloon.angle)
    sin = math.sin(balloon.angle)
	
	-- adjust balloon angle relative to postion of mouse pointer
    balloon.x = balloon.x + balloon.speed * cos * dt
    balloon.y = balloon.y + balloon.speed * sin * dt
end

function love.draw()
    love.graphics.draw(balloon.image, balloon.x, balloon.y, balloon.angle)
	love.graphics.draw(speech_cloud.image, speech_cloud.x, speech_cloud.y)
	love.graphics.draw(runaway_cloud, mouse_x, mouse_y)
end