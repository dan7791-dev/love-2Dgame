require("sounds.effects")

function love.load()
	-- fixed image
	simple_cloud = {}
	simple_cloud.x = 10
	simple_cloud.y = 10
	simple_cloud.image = love.graphics.newImage("assets/shapes/simple_cloud.png")

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
		
	-- font settings
	red = 0/255
	green = 0/255
	blue = 0/255
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
	love.graphics.draw(simple_cloud.image, simple_cloud.x, simple_cloud.y)
	love.graphics.draw(sun.image, mouse_x, mouse_y)
	
	-- display balloon time tracker
	display_timer()

	-- detect collision between balloon and sun
	detectCollision()
	
	-- count the number of balloons sent into the sun
	count_balloons_popped = balloons_popped()
	a = 0
	if count_balloons_popped > 0 then a = a + 1 print(a) end
	
end

function detectCollision()
	if (math.floor(math.sqrt(math.abs(math.ceil(mouse_x - simple_cloud.x)) + math.abs(math.ceil(mouse_y - simple_cloud.y)))) < 24) then
		balloon.x = 200
		balloon.y = 200
	elseif (math.floor(math.sqrt(math.abs(math.ceil(mouse_x - balloon.x)) + math.abs(math.ceil(mouse_y - balloon.y)))) < 10) then
		balloon.x = 200
		balloon.y = 200
		love.graphics.draw(star.image, mouse_x - 100, mouse_y - 100)
		
		-- balloon pop event
		balloon_pop:play()
		balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. math.random(7) .. ".png")
	else
		-- display length of time left to play
		color = {red, green, blue}
		colored_text = {color,"Balloons popped: ",color,count_balloons_popped}
		love.graphics.print(colored_text, 120, 150, 0, 2.5, 2.5)
	end
end

function display_timer()
	timer = tostring(string.format("Keep balloons safe! \n1 minute remaining\n \t\t\t\t%.1f", os.clock()))
	color = {red, green, blue}
	colored_text = {color,timer}
	love.graphics.print(colored_text, 100, 190, 0, 2.5, 2.5)
end

function balloons_popped()
	balloons = 0
	for counter = 0, 100 do 
		if (math.floor(math.sqrt(math.abs(math.ceil(mouse_x - balloon.x)) + math.abs(math.ceil(mouse_y - balloon.y)))) > 10) then
			return balloons
		else
			balloons = balloons + 1
			return balloons
		end
	end
end

function balloon_color()
   for i = 1, 7 do
      math.randomseed(os.time())
      a = math.random(1,7)
      return(a)
   end
end
