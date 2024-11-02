chromatic = 0;
lame = 0;

function onCreatePost() 
    initLuaShader("glitchChromatic")
    makeLuaSprite("temporaryShader1")
    setSpriteShader("temporaryShader1", "glitchChromatic")
    makeLuaSprite('shaderXb',nil,0,0)
    runHaxeCode([[
		trace(ShaderFilter);
        game.initLuaShader('chromabber');
        chrom = game.createRuntimeShader('chromabber');

        chrom.setFloat('amount', -0.3);
        setVar('lastChromAmount', -0.3);

		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader1").shader),new ShaderFilter(game.getLuaObject("temporaryShader1").shader),new ShaderFilter(chrom)]);
	]])	
    triggerEvent('glitchy transition', '0.08')
end

function onEvent(name, value1, value2)
    if name == 'glitchy transition' then
        chromatic = chromatic + value1
    end
end

function noteMiss(id,noteData,noteType,isSusNote)
    setProperty('shaderXb.x',chromatic * getRandomFloat(-2, 2) )
    doTweenX('shaderbLol','shaderXb',0,0.3,'linear')
end


function onUpdate(elapsed)
    setShaderFloat('temporaryShader1', "iTime", os.clock())
    local  Value1 = getProperty('shaderXb.x')
    setShaderFloat('temporaryShader1', "GLITCH", Value1)
end

function onTweenCompleted(tag)
    if tag == 'shaderbLol' then
        setProperty('shaderXb.x',0)
    end
    if tag == 'shaderrLol' then
        setProperty('shaderXr.x',0)
    end
    if tag == 'shadergLol' then
        setProperty('shaderXg.x',0)
    end
end

function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end

function math.lerp(from,to,i)
    return from+(to-from)*i
end
