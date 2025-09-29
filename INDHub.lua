if not game:IsLoaded() then
    game.Loaded:Wait()
end

local scripts = {
    [120570155878200] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/120570155878200.lua", -- Broom Training
    [13127800756] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/13127800756.lua",
    [11827760850] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/11827760850.lua",
    [12978425304] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/12978425304.lua",
    [15139160794] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/15139160794.lua",
    [18629053284] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/18629053284.lua", -- Survival Odyssey
    [18629058177] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/18629058177.lua", -- Void
    [92039548740735] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/92039548740735.lua", -- Underworld
    [136725212408177] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/136725212408177.lua", -- survival safe
    [93787311916283] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/93787311916283.lua", -- Horse Race
    [125415045928192] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/125415045928192.lua", -- Roller Training
    [112678615086652] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/112678615086652.lua", -- Ride Race
    [101645554076038] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/101645554076038.lua", -- Paper Plane sim
    [106425431775947] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/106425431775947.lua", -- Motorcycle Racing
    [76260928389356] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/76260928389356.lua", -- Guitar Simulator
	[81257648942232] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/81257648942232.lua", -- Slash Mob Simulator
	[125661369726244] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/125661369726244.lua", -- Anime Apex
	
}

local url = scripts[game.PlaceId]
if url then
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("Failed to load script: " .. err)
    end
else
    print("Game isn't Supported")
end