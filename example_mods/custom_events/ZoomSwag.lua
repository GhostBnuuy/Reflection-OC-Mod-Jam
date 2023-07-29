function onEvent(name, value1, value2)
    if name == "ZoomSwag" then
      	setProperty("defaultCamZoom", value1)
		doTweenZoom('camz', 'camGame', value1, value2, 'cubeInOut')
    end
end


function onTweenCompleted(name)
    if name == 'camz' then
      	setProperty("defaultCamZoom",getProperty('camGame.zoom')) 
    end
end