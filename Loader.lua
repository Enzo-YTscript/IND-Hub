-- KeySystem.lua

-- Load Rayfield library with error handling
local Rayfield
local success, errorMsg = pcall(function()
    Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)
if not success then
    warn("Failed to load Rayfield library: " .. tostring(errorMsg))
    return
end

-- Dependencies
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local currentUserId = LocalPlayer.UserId
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local PlaceId = game.PlaceId

-- Simple hash function to verify save data integrity
local function simpleHash(str)
    local hash = 0
    for i = 1, #str do
        hash = (hash * 31 + string.byte(str, i)) % 2^32
    end
    return hash
end

-- Key System Settings
local KeySystemSettings = {
    Title = gameName .. " Key System",
    Subtitle = "Validate Your Key",
    Note = "Enter your key to access the script",
    FileName = "INDHubKey",
    SaveKey = true,  -- Save key if valid
    LootlabsLink = "https://socialunlocks.com/u/key-sytem"  -- Updated link
}

-- Function to create and show the key window
local function showKeyWindow()
    -- Create temporary window for key system
    local KeyWindow = Rayfield:CreateWindow({
        Name = KeySystemSettings.Title,
        LoadingTitle = KeySystemSettings.Title,
        LoadingSubtitle = KeySystemSettings.Subtitle,
        ConfigurationSaving = { Enabled = false },
        Discord = { Enabled = false }
    })

    -- Tab Info (placeholder, isi sendiri di GitHub version-mu)
    local InfoTab = KeyWindow:CreateTab("Info")
    -- Add your own elements here, e.g.:
    InfoTab:CreateParagraph({ Title = "ℹ️ Info", Content = " Copy link → Paste key → Enjoy! 🎮" })

    -- Tab KeyValidation
    local KeyValidationTab = KeyWindow:CreateTab("Key Validation")

    -- Button Copy Key Lootlabs
    KeyValidationTab:CreateButton({
        Name = "📋 Copy Key Link",
        Callback = function()
            setclipboard(KeySystemSettings.LootlabsLink)
            Rayfield:Notify({ Title = "✅ Copied!", Content = "Link copied to clipboard!", Duration = 5 })
        end
    })

    -- Input for key (default empty since getclipboard is removed to avoid errors)
    local enteredKey = ""
    local KeyInput = KeyValidationTab:CreateInput({
        Name = "🔑 Enter Key",
        PlaceholderText = "XXXX-XXXX-XXXX",
        CurrentValue = enteredKey,
        Flag = "EnteredKey",
        Callback = function(Value)
            enteredKey = Value
        end
    })

    -- Button to validate key
    local ValidateButton = KeyValidationTab:CreateButton({
        Name = "✅ Validate Key",
        Callback = function()
            enteredKey = Rayfield.Flags["EnteredKey"] or enteredKey
            if enteredKey == "" then
                Rayfield:Notify({ Title = "❌ Error", Content = "Please enter a key", Duration = 5 })
                return
            end

            -- API URL for validation (GET method)
            local apiUrl = "https://socialunlocks.com/api/v1/keys/validate?key=" .. enteredKey

            -- Perform validation
            local success, response = pcall(function()
                return game:HttpGet(apiUrl)
            end)

            if success then
                local dataSuccess, data = pcall(function()
                    return HttpService:JSONDecode(response)
                end)

                if dataSuccess then
                    if data.valid then
                        -- Check if there's a saved key and if it's the same key but for a different user
                        local isMismatch = false
                        if isfile(KeySystemSettings.FileName) then
                            local savedContent = readfile(KeySystemSettings.FileName)
                            local savedDataSuccess, savedData = pcall(function()
                                return HttpService:JSONDecode(savedContent)
                            end)
                            if savedDataSuccess and savedData.key == enteredKey and savedData.userId ~= currentUserId then
                                isMismatch = true
                            end
                        end

                        if isMismatch then
                            Rayfield:Notify({ Title = "❌ Key Error", Content = "This key is already bound to another account. Please use a new key.", Duration = 5 })
                            return  -- Do not proceed
                        end

                        -- Key valid and not mismatched, save with UserId and signature as JSON
                        if KeySystemSettings.SaveKey then
                            local combined = enteredKey .. tostring(currentUserId)
                            local signature = simpleHash(combined)
                            local saveData = {
                                key = enteredKey,
                                userId = currentUserId,
                                signature = signature
                            }
                            writefile(KeySystemSettings.FileName, HttpService:JSONEncode(saveData))
                        end
                        Rayfield:Notify({ Title = "✅ Success", Content = "Key validated! Loading script...", Duration = 5 })
                        Rayfield:Destroy()  -- Updated to Rayfield:Destroy()
                        
                        -- Set global validation flag
                        _G.KeyValidated = true

                        -- Load test.lua to handle the main script loading
                        local loadSuccess, loadErr = pcall(function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/gamesajaCD/Hub/refs/heads/main/test.lua"))()
                        end)
                        if not loadSuccess then
                            Rayfield:Notify({ Title = "Load Error", Content = "Failed to load test.lua: " .. tostring(loadErr), Duration = 5 })
                        end
                    else
                        -- Key invalid
                        Rayfield:Notify({ Title = "Key Invalid", Content = "Invalid key. Reason: " .. (data.reason or "Unknown"), Duration = 5 })
                    end
                else
                    Rayfield:Notify({ Title = "Parse Error", Content = "Failed to parse API response: " .. tostring(data), Duration = 5 })
                end
            else
                Rayfield:Notify({ Title = "API Error", Content = "Failed to call API: " .. tostring(response), Duration = 5 })
            end
        end
    })

    return KeyWindow  -- Return the window if needed, but not used here
end

-- Check for saved key and validate automatically
if KeySystemSettings.SaveKey and isfile(KeySystemSettings.FileName) then
    local savedContent = readfile(KeySystemSettings.FileName)
    local dataSuccess, savedData = pcall(function()
        return HttpService:JSONDecode(savedContent)
    end)

    if dataSuccess then
        local savedKey = savedData.key
        local savedUserId = savedData.userId
        local savedSignature = savedData.signature

        -- Verify signature to detect tampering
        local combined = savedKey .. tostring(savedUserId)
        local expectedSignature = simpleHash(combined)
        if savedSignature ~= expectedSignature then
            Rayfield:Notify({ Title = "Tamper Detected", Content = "Saved data has been tampered with. Please enter a new key.", Duration = 5 })
            showKeyWindow()  -- Show window for new key
        elseif savedUserId == currentUserId then
            -- Validate saved key via API
            local apiUrl = "https://socialunlocks.com/api/v1/keys/validate?key=" .. savedKey

            local success, response = pcall(function()
                return game:HttpGet(apiUrl)
            end)

            if success then
                local validateSuccess, validateData = pcall(function()
                    return HttpService:JSONDecode(response)
                end)

                if validateSuccess and validateData.valid then
                    -- Saved key still valid, load script directly
                    print("Saved key validated automatically. Loading script...")
                    -- Set global validation flag
                    _G.KeyValidated = true
                    -- Load test.lua to handle the main script loading
                    local loadSuccess, loadErr = pcall(function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/Enzo-YTscript/IND-Hub/blob/main/LoaderScrp.lua"))()
                    end)
                    if not loadSuccess then
                        warn("Failed to load test.lua: " .. tostring(loadErr))
                    end
                    return  -- Exit script, no need to show window
                else
                    -- Saved key invalid/expired
                    Rayfield:Notify({ Title = "Key Expired", Content = "Your saved key is invalid or expired. Please enter a new key.", Duration = 5 })
                    showKeyWindow()  -- Show window for new key
                end
            else
                Rayfield:Notify({ Title = "API Error", Content = "Failed to validate saved key: " .. tostring(response), Duration = 5 })
                showKeyWindow()  -- Show window for new key
            end
        else
            -- User ID mismatch
            Rayfield:Notify({ Title = "User Mismatch", Content = "Saved key is for a different account. Please enter a new key.", Duration = 5 })
            showKeyWindow()  -- Show window for new key
        end
    else
        Rayfield:Notify({ Title = "Parse Error", Content = "Failed to parse saved data: " .. tostring(savedData), Duration = 5 })
        showKeyWindow()  -- Show window for new key
    end
else
    -- No saved key, show window
    showKeyWindow()
end