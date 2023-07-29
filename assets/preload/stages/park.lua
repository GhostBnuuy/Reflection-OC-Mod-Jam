local path = 'backgrounds/2/'
local cgs = 'backgrounds/CG/'

function onCreate()
    makeLuaSprite('sky', path..'nightsky', -418, -1200)
    scaleObject('sky', 1.2, 1.2)
    addLuaSprite('sky', false)

    makeLuaSprite('bg', path..'bg', -410, -1180)
    scaleObject('bg', 1.2, 1.2)
    addLuaSprite('bg', false)

    makeLuaSprite('bg2', path..'bg2', -375, -1200)
    scaleObject('bg2', 1.2, 1.2)
    addLuaSprite('bg2', false)

    makeLuaSprite('fg', path..'fg', -400, 820)
    scaleObject('fg', 1.2, 1.2)
    addLuaSprite('fg', true)

    makeLuaSprite('lighting', path..'lighting', -70, -400)
    scaleObject('lighting', 1.2, 1.2)
    setBlendMode('lighting', 'add')
    addLuaSprite('lighting', true)

    -- the "cutscene art"

    makeLuaSprite('c1', cgs..'CG1', 0, 0)
    setObjectCamera('c1', 'camHUD')
    addLuaSprite('c1', true)
    setProperty('c1.alpha', 0)

    makeLuaSprite('c2', cgs..'CG2', 0, 0)
    setObjectCamera('c2', 'camHUD')
    addLuaSprite('c2', true)
    setProperty('c2.alpha', 0)

    makeLuaSprite('c3', cgs..'CG3', 0, 0)
    setObjectCamera('c3', 'camHUD')
    addLuaSprite('c3', true)
    setProperty('c3.alpha', 0)

    makeLuaSprite('c4', cgs..'CG4', 0, 0)
    setObjectCamera('c4', 'camHUD')
    addLuaSprite('c4', true)
    setProperty('c4.alpha', 0)
end

function onCreatePost()
    setProperty('gf.visible', false)
end

function onBeatHit()
    if curBeat == 192 then
        doTweenAlpha('fadein1', 'c1', 0.5, 4, 'linear')
    elseif curBeat == 208 then
        setProperty('c1.visible', false)
        doTweenAlpha('fadein2', 'c2', 0.5, 4, 'linear')
    elseif curBeat == 224 then
        setProperty('c2.visible', false)
        doTweenAlpha('fadein3', 'c3', 0.5, 4, 'linear')
    elseif curBeat == 240 then
        setProperty('c3.visible', false)
        doTweenAlpha('fadein4', 'c4', 0.5, 4, 'linear')
    elseif curBeat == 256 then
        doTweenAlpha('fadeoutyeaaah', 'c4', 0, 3, 'linear')
    elseif curBeat == 292 then
        doTweenAlpha('kaigone', 'dad', 0, 11, 'linear')
        doTweenAlpha('icon2gone', 'iconP2', 0, 11, 'linear')
        noteTweenAlpha('notes gone too', 0, 0, 11, 'linear')
        noteTweenAlpha('notes gone too1', 1, 0, 11, 'linear')
        noteTweenAlpha('notes gone too2', 2, 0, 11, 'linear')
        noteTweenAlpha('notes gone too3 im dumb', 3, 0, 11, 'linear')
    end
end