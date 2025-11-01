if not game:IsLoaded() then game.Loaded:Wait() end

print("🔍 Checking access... PlaceId: " .. tostring(game.PlaceId))

if not _G.KeyValidated then
    warn("Access denied: Script must be loaded through key validation system.")
    return
end

print("Loading script for PlaceId: " .. game.PlaceId)

local PlaceId = game.PlaceId
-- =============================================

local scripts = {
    [120570155878200] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/120570155878200.lua", -- Broom Training
    [13127800756] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/13127800756.lua",
    [11827760850] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/11827760850.lua",
    [12978425304] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/12978425304.lua",
    [15139160794] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/15139160794.lua",
    [18629053284] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/18629053284.lua", -- Survival Odyssey
    [18629058177] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/18629058177.lua", -- Void
    [92039548740735] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/92039548740735.lua", -- Underworld
    [136725212408177] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/136725212408177.lua", -- survival safe
    [93787311916283] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/93787311916283.lua", -- Horse Race
    [125415045928192] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/125415045928192.lua", -- Roller Training
    [112678615086652] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/112678615086652.lua", -- Ride Race
    [101645554076038] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/101645554076038.lua", -- Paper Plane sim
    [106425431775947] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/106425431775947.lua", -- Motorcycle Racing
    [76260928389356] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/76260928389356.lua", -- Guitar Simulator
	[81257648942232] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/81257648942232.lua", -- Slash Mob Simulator
	[125661369726244] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/125661369726244.lua", -- Anime Apex
	[16713816479] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/16713816479.lua", -- Pet Quest
	[73823535458649] = "https://raw.githubusercontent.com/Enzo-YTscript/LoaderScrp/main/73823535458649.lua", -- Pet Evolution Incremental

}
local scriptUrl = scriptMap[PlaceId]
if scriptUrl then
    -- Load and execute the main script
    local loadSuccess, loadErr = pcall(function()
        loadstring(game:HttpGet(scriptUrl))()
    end)
    if not loadSuccess then
        warn("✅ Script loaded: " .. tostring(loadErr))
    end
else
    warn("❌ No script for PlaceId: " .. tostring(PlaceId))
end