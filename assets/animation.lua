require("bgm.music")

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
	
	-- detect collision between balloon and sun
	if (math.abs((math.ceil(mouse_x)) - simple_cloud.x) < 350 and math.abs((math.ceil(mouse_y)) - simple_cloud.y) < 260) then
		balloon.x = 200
		balloon.y = 200
	elseif (math.abs(math.ceil(mouse_x - balloon.x)) < 10 and math.abs(math.ceil(mouse_y - balloon.y)) < 10) then
		balloon.x = 200
		balloon.y = 200
		love.graphics.draw(star.image, mouse_x - 100, mouse_y - 100)
		balloon_pop:play()
		balloon.image = love.graphics.newImage("assets/shapes/Balloons" .. math.random(7) .. ".png")
	else
		print("distance to cloud x: ",math.abs((math.ceil(mouse_x)) - simple_cloud.x), "distance to cloud y: ",math.abs((math.ceil(mouse_y)) - simple_cloud.y))
	end
end

function balloon_color()
   for i = 1, 7 do
      math.randomseed(os.time())
      a = math.random(1,7)
      return(a)
   end
end
