loadstring(game:HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/setup.lua"))()
local KeySystem = _G.KSS.classes.keysystem.new("IndoHub") -- Create class KeySystem
local Key = KeySystem:key('key_user') -- Create class Key

if Key.finish and Key:verifyHWID() then
  print("Good")
else
  print("Bad")
end

if not game:IsLoaded() then game.Loaded:Wait() end
    if game.PlaceId == 12978425304 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pryxo/Hub/main/Toy%20Simulator"))()
    elseif game.PlaceId == 13680982680 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pryxo/Hub/main/Strength%20Simulator"))()
    elseif game.PlaceId == 11497091217 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pryxo/Hub/main/Popping%20Simulator!"))()
    elseif game.PlaceId == 14171094615 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pryxo/Hub/main/Clicker%20Wars%20Simulator!"))()
    elseif game.PlaceId == 13891637445 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Pryxo/Hub/main/Lucky%20Block%20Legends!"))()
    elseif game.PlaceId == 15025029467 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Enzo-YTscript/scrp/blob/main/15025029467.lua"))()
    else
    elseif game.PlaceId == 13127800756 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/13127800756.lua"))()
    else
      print("Game isn't Supported")
end