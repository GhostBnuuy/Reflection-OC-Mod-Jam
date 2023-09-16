function onCreatePost()
    makeLuaText('songname', 'brrrrr', 0, 0, 0)
    addLuaText('songname')
    setProperty('songname.x', screenWidth - getProperty('songname.width') - 65)
    setProperty('songname.y', screenHeight - getProperty('songname.height') - 15)
    setTextSize('songname', 25)
    setTextFont('songname', 'coves.otf')
    setObjectCamera('songname', 'CamHUD')
    setTextAlignment('songname', 'right')
    setProperty('songname.alpha', 0.6)

    if songName == 'Reminiscence' then
        setTextString('songname', '@DSFESwe')
    elseif songName == 'Miss You' then
        setTextString('songname', '@BreWyy_')
    end
end