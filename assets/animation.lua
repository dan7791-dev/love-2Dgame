function balloon_color()
   for i = 1, 7 do
      math.randomseed(os.time())
      a = math.random(1,7)
      return(a)
   end
end

function love.load()
	-- balloon assest
    balloon = {}
    balloon.x = 200
    balloon.y = 200
    balloon.speed = 300
    balloon.angle = 0
    balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. balloon_color() .. ".png")
	
	-- speech_cloud asset
	speech_cloud = {}
	speech_cloud.x = 10
	speech_cloud.y = 10
	speech_cloud.image = love.graphics.newImage("assets/shapes/speech_cloud.png")
end

function love.update(dt)
    mouse_x, mouse_y = love.mouse.getPosition()
    balloon.angle = math.atan2(mouse_y - balloon.y, mouse_x - balloon.x)
    cos = math.cos(balloon.angle)
    sin = math.sin(balloon.angle)

    balloon.x = balloon.x + balloon.speed * cos * dt
    balloon.y = balloon.y + balloon.speed * sin * dt
	circlePosition()
end

function circlePosition()
	print("mouse position x: ", math.floor(mouse_x))
	print("balloon position x :", math.floor(balloon.x))
	print("mouse position y: ", math.floor(mouse_y))
	print("balloon position y :", math.floor(balloon.y))
	if math.floor(mouse_x) == math.floor(balloon.x) or math.floor(mouse_y) == math.floor(balloon.y) then
		print("Collision detected!")
	end
end

function love.draw()
    love.graphics.draw(balloon.image, balloon.x, balloon.y, balloon.angle)
    love.graphics.circle("fill", mouse_x, mouse_y, 10)
	love.graphics.draw(speech_cloud.image, speech_cloud.x, speech_cloud.y)
end