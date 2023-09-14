local StarterGui = game:GetService("StarterGui")
local Link = game:HttpGet("https://raw.githubusercontent.com/Enzo-YTscript/scrp/main/"..game.PlaceId..".lua")

if Link then
  StarterGui:SetCore("SendNotification", {
		Title = "ENZO-YT",
		Text = "Welcome. Loading script.",
		Duration = 10
	})
	loadstring(Link)()
end