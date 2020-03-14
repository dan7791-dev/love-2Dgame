-- Play background audio
music = love.audio.newSource("bgm/up.mp3", "stream")
music:setLooping(true)
music:play()

-- balloon animation sound event
balloon_pop = love.audio.newSource("bgm/balloon_burst.wav", "stream")