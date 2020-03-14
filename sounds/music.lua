-- Play background audio
music = love.audio.newSource("sounds/up.mp3", "stream")
music:setLooping(true)
music:play()