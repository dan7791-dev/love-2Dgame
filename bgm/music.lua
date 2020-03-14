-- Play background audio
music = love.audio.newSource("bgm/up.mp3", "stream")
music:setLooping(true)
music:play()

-- balloon pop event sound
balloon_pop = love.audio.newSource("bgm/balloon_burst.wav", "stream")