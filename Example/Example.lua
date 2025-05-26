local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AceDev21/BloxUi/refs/heads/main/BloxUi.lua"))()

-- Create window
local window = library:new({
    name = "Example UI",
    color = Color3.fromRGB(0, 170, 255),
    size = UDim2.new(0, 500, 0, 500)
})

-- Add watermark
local watermark = window:watermark()
watermark:update({
    ["Game"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    ["FPS"] = "60",
    ["Player"] = game.Players.LocalPlayer.Name
})

-- Create pages
local mainPage = window:page({name = "Main", pointer = "mainPage"})
local settingsPage = window:page({name = "Settings"})

-- Main page sections
local leftSection = mainPage:section({name = "Combat", side = "left", size = 200})
local rightSection = mainPage:section({name = "Visuals", side = "right", size = 250})

-- Combat section elements
leftSection:toggle({
    name = "Aimbot",
    def = false,
    pointer = "aimbotToggle",
    callback = function(state)
        print("Aimbot:", state)
    end
})

leftSection:slider({
    name = "Aimbot FOV",
    def = 30,
    min = 1,
    max = 360,
    measurement = "°",
    pointer = "aimbotFOV",
    callback = function(value)
        print("FOV set to:", value)
    end
})

leftSection:dropdown({
    name = "Aimbot Bone",
    def = "Head",
    options = {"Head", "Torso", "Random"},
    pointer = "aimbotBone",
    callback = function(option)
        print("Target bone:", option)
    end
})

-- Visuals section elements
rightSection:toggle({
    name = "ESP",
    def = true,
    pointer = "espToggle",
    callback = function(state)
        print("ESP:", state)
    end
})

rightSection:multibox({
    name = "ESP Components",
    def = {"Box", "Name"},
    options = {"Box", "Name", "Health", "Distance"},
    pointer = "espComponents",
    callback = function(options)
        print("ESP components:", table.concat(options, ", "))
    end
})

rightSection:colorpicker({
    name = "ESP Color",
    def = Color3.fromRGB(255, 0, 0),
    pointer = "espColor",
    callback = function(color)
        print("ESP color set to:", color)
    end
})

-- Settings page elements
local settingsSection = settingsPage:section({name = "Configuration", size = 300})

settingsSection:keybind({
    name = "UI Keybind",
    def = Enum.KeyCode.RightShift,
    pointer = "uiKeybind",
    callback = function(key)
        print("UI keybind changed to:", key)
        window:setkey(key)
    end
})

settingsSection:button({
    name = "Save Config",
    callback = function()
        writefile("BloxUi_Config.cfg", window:saveconfig())
        print("Config saved!")
    end
})

settingsSection:button({
    name = "Load Config",
    callback = function()
        if isfile("BloxUi_Config.cfg") then
            window:loadconfig(readfile("BloxUi_Config.cfg"))
            print("Config loaded!")
        else
            print("No config file found")
        end
    end
})

settingsSection:textbox({
    name = "Player Speed",
    placeholder = "Enter walk speed...",
    callback = function(text)
        local speed = tonumber(text)
        if speed then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
        end
    end
})

-- Multi-section example
local multiSection = settingsPage:multisection({
    name = "Advanced Settings",
    side = "right",
    size = 180
})

local generalTab = multiSection:section({name = "General"})
local debugTab = multiSection:section({name = "Debug"})

generalTab:toggle({
    name = "Anti-AFK",
    def = true,
    callback = function(state)
        print("Anti-AFK:", state)
    end
})

debugTab:button({
    name = "Print Config",
    callback = function()
        print(window:saveconfig())
    end
})

-- Update watermark with FPS
local RunService = game:GetService("RunService")
local lastTick = tick()
local frames = 0
local fps = 0

RunService.Heartbeat:Connect(function()
    frames = frames + 1
    if tick() - lastTick >= 1 then
        fps = frames
        frames = 0
        lastTick = tick()
        watermark:update({
            ["FPS"] = tostring(fps),
            ["Ping"] = tostring(math.random(30, 80)).."ms"
        })
    end
end)
