-- Tunggu hingga game sepenuhnya dimuat
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Cetak PlaceId untuk debugging
print("Current PlaceId: " .. tostring(game.PlaceId))

-- Daftar PlaceId dan URL script yang sesuai
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
    [126447951598274] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/126447951598274.lua", -- Swim League World1
    [138732687875539] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/138732687875539.lua", -- Swim League World2
    [89430294172992] = "https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/89430294172992.lua" -- Swim League World3
}

-- Periksa apakah PlaceId ada di daftar
local scriptUrl = scripts[game.PlaceId]
if scriptUrl then
    print("Loading script for PlaceId: " .. tostring(game.PlaceId))
    local success, result = pcall(function()
        loadstring(game:HttpGet(scriptUrl))()
    end)
    if not success then
        warn("Failed to load script: " .. tostring(result))
    end
else
    print("Game isn't Supported (PlaceId: " .. tostring(game.PlaceId) .. ")")
end