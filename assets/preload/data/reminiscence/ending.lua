-- OK so, I disabled the videos to save up some extra memory, so the cutscene is coded with timers, okay byeeeeeee

local dumb = 'backgrounds/EndingCutscene/'
local endCutscene = false

function onCreate()
    -- Backgrounds
    makeLuaSprite('bg1', dumb..'bg1', 0, 0)
    setObjectCamera('bg1', 'camOther')
    addLuaSprite('bg1', true)
    setProperty('bg1.visible', false)

    makeLuaSprite('bg2', dumb..'bg2', 0, 0)
    setObjectCamera('bg2', 'camOther')
    addLuaSprite('bg2', true)
    setProperty('bg2.visible', false)

    -- Sprites

    makeLuaSprite('shock', dumb..'1', 0, 0)
    setObjectCamera('shock', 'camOther')
    addLuaSprite('shock', true)
    setProperty('shock.visible', false)

    makeLuaSprite('huh', dumb..'2', 0, 0)
    setObjectCamera('huh', 'camOther')
    addLuaSprite('huh', true)
    setProperty('huh.visible', false)

    makeLuaSprite('omghikai', dumb..'3', 0, 0)
    setObjectCamera('omghikai', 'camOther')
    addLuaSprite('omghikai', true)
    setProperty('omghikai.visible', false)

    makeLuaSprite('helloohaiihii', dumb..'4', 0, 0)
    setObjectCamera('helloohaiihii', 'camOther')
    addLuaSprite('helloohaiihii', true)
    setProperty('helloohaiihii.visible', false)

    makeLuaSprite('blink1', dumb..'5', 0, 0)
    setObjectCamera('blink1', 'camOther')
    addLuaSprite('blink1', true)
    setProperty('blink1.visible', false)

    makeLuaSprite('blink2', dumb..'6', 0, 0)
    setObjectCamera('blink2', 'camOther')
    addLuaSprite('blink2', true)
    setProperty('blink2.visible', false)

    makeLuaSprite('sigh', dumb..'7', 0, 0)
    setObjectCamera('sigh', 'camOther')
    addLuaSprite('sigh', true)
    setProperty('sigh.visible', false)

    makeLuaSprite('smile', dumb..'8', 0, 0)
    setObjectCamera('smile', 'camOther')
    addLuaSprite('smile', true)
    setProperty('smile.visible', false)

    makeLuaSprite('bitch', '', 0, 0)
    makeGraphic('bitch', 1280, 720, '000000')
    setObjectCamera('bitch', 'camOther')
    addLuaSprite('bitch', true)
    setProperty('bitch.alpha', 0)
end

function onEndSong()
    if not endCutscene and isStoryMode then
        playMusic('endingCutscene', 1)

        setProperty('bg1.visible', true)
        setProperty('shock.visible', true)
        runTimer('timer1', 0.7)

    return Function_Stop
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'timer1' then
        setProperty('shock.visible', false)
        setProperty('huh.visible', true)
        runTimer('timer2', 0.71)
    elseif tag == 'timer2' then
        setProperty('bg1.visible', false)
        setProperty('huh.visible', false)
        setProperty('bg2.visible', true)
        setProperty('omghikai.visible', true)
        runTimer('timer3', 1.41)
    elseif tag == 'timer3' then
        setProperty('omghikai.visible', false)
        setProperty('helloohaiihii.visible', true)
        runTimer('timer4', 0.5)
    elseif tag == 'timer4' then
        setProperty('bg2.visible', false)
        setProperty('helloohaiihii.visible', false)
        setProperty('bg1.visible', true)
        setProperty('blink1.visible', true)
        runTimer('timer5', 0.35)
    elseif tag == 'timer5' then
        setProperty('blink1.visible', false)
        setProperty('blink2.visible', true)
        runTimer('timer6', 0.15)
    elseif tag == 'timer6' then
        setProperty('blink1.visible', true)
        setProperty('blink2.visible', false)
        runTimer('timer7', 0.2)
    elseif tag == 'timer7' then
        setProperty('blink1.visible', false)
        setProperty('blink2.visible', true)
        runTimer('timer8', 0.15)
    elseif tag == 'timer8' then
        setProperty('blink1.visible', true)
        setProperty('blink2.visible', false)
        runTimer('timer9', 0.6)
    elseif tag == 'timer9' then
        setProperty('blink1.visible', false)
        setProperty('sigh.visible', true)
        runTimer('timer10', 1.8)
    elseif tag == 'timer10' then
        setProperty('sigh.visible', false)
        setProperty('smile.visible', true)
        runTimer('finally', 1)
    elseif tag == 'finally' then
        endCutscene = true
        endSong()
    end
end