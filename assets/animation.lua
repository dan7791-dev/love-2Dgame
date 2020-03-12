function balloon_color()
   for i = 1, 7 do
      math.randomseed(os.time())
      a = math.random(1,7)
      return(a)
   end
end

function love.load()
	-- fixed image
	speech_cloud = {}
	speech_cloud.x = 10
	speech_cloud.y = 10
	speech_cloud.image = love.graphics.newImage("assets/shapes/speech_cloud.png")

	-- moving image relative to mouse pointer
    balloon = {}
    balloon.x = 200
    balloon.y = 200
    balloon.speed = 300
    balloon.angle = 0
    balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. balloon_color() .. ".png")
	
	-- image attached to mouse movement
	sun = {}
	sun.image = love.graphics.newImage("assets/shapes/happy_sun.png")
	star = {}
	star.image = love.graphics.newImage("assets/shapes/star_explosion.png")
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
	love.graphics.draw(sun.image, mouse_x, mouse_y)
	
	-- detect balloon collision with sun 
	if (math.abs(math.ceil(mouse_x - balloon.x)) < 10 and math.abs(math.ceil(mouse_y - balloon.y)) < 10 ) then
		balloon.x = 200
		balloon.y = 200
		love.graphics.draw(star.image, mouse_x - 100, mouse_y - 100)
		balloon_pop = love.audio.newSource("bgm/balloon_burst.wav", "stream")
		balloon_pop:play()
		balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. math.random(7) .. ".png")
	end
end