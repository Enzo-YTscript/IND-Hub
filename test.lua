if not game:IsLoaded() then game.Loaded:Wait() end

print("Current PlaceId: " .. tostring(game.PlaceId))

local scripts = {
    [120570155878200] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/120570155878200.lua", -- Broom Training
    [13127800756] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/13127800756.lua",
    [11827760850] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/11827760850.lua",
    [12978425304] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/12978425304.lua",
    [15139160794] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/15139160794.lua",
    [18629053284] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/18629053284.lua", -- Survival Odyssey
    [18629058177] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/18629058177.lua", -- Void
    [92039548740735] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/92039548740735.lua", -- Underworld
    [93787311916283] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/93787311916283.lua", -- Horse Race
    [125415045928192] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/125415045928192.lua", -- Roller Training
    -- Swim League (World1, World2, World3, World4)
    [126447951598274] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/126447951598274.lua",
    [138732687875539] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/126447951598274.lua",
    [89430294172992] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/126447951598274.lua",
    [76291578724272] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/76291578724272.lua",
    -- Grup baru (contoh)
    [123456789] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/custom_group.lua",
    [987654321] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/custom_group.lua",
    [555555555] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/custom_group.lua"
}

local url = scripts[game.PlaceId]
if url then
    print("Loading script for PlaceId: " .. tostring(game.PlaceId))
    local success, result = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("Failed to load script: " .. tostring(result))
    end
else
    print("Game isn't Supported (PlaceId: " .. tostring(game.PlaceId) .. ")")
end