# BloxUi Documentation

## Loading the Library
```lua
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AceDev21/BloxUi/refs/heads/main/BloxUi.lua"))()
```

## Creating a Window
```lua
local window = library:new({
    name = "UI Name",             -- Name of the UI (default: "new ui")
    color = Color3.fromRGB(225, 58, 81), -- Accent color (default: RGB(225, 58, 81))
    textsize = 12,                -- Text size (default: 12)
    font = "RobotoMono",          -- Font (default: "RobotoMono")
    size = UDim2.new(0, 500, 0, 606) -- Window size (default: 500x606)
})
```

## Watermark
```lua
local watermark = window:watermark()

-- Update watermark content
watermark:update({
    ["FPS"] = "60",
    ["Ping"] = "50ms"
})

-- Change watermark position
watermark:updateside("topright") -- Options: topright, topleft, bottomright, bottomleft
```

## Loader
```lua
local loader = window:loader({
    name = "Loader Name",         -- Loader title
    scriptname = "Universal",     -- Script name
    closecallback = function()    -- Called when close button clicked
        print("Closed loader")
    end,
    logincallback = function()    -- Called when login button clicked
        print("Logged in")
    end
})

-- Show the loader
loader:toggle()
```

## Pages
```lua
local page = window:page({
    name = "Page Name",           -- Name of the page
    pointer = "pagePointer"       -- Optional pointer name for saving configs
})

-- Open the page programmatically
page:openpage()
```

## Sections
### Regular Section
```lua
local section = page:section({
    name = "Section Name",        -- Name of the section
    side = "left",                -- "left" or "right" (default: "left")
    size = 200,                   -- Height of the section
    pointer = "sectionPointer"    -- Optional pointer name
})
```

### Multi-Section (Tabs)
```lua
local multisection = page:multisection({
    name = "Multi-Section Name",  -- Name of the multi-section
    side = "left",                -- "left" or "right" (default: "left")
    size = 200,                   -- Height of the section
    pointer = "multisectionPointer" -- Optional pointer name
})

-- Add tabs to multi-section
local tab = multisection:section({
    name = "Tab Name",            -- Name of the tab
    pointer = "tabPointer"        -- Optional pointer name
})
```

## Elements
### Toggle
```lua
local toggle = section:toggle({
    name = "Toggle Name",         -- Name of the toggle
    def = false,                  -- Default state (default: false)
    pointer = "togglePointer",    -- Optional pointer name
    callback = function(state)    -- Called when toggle state changes
        print("Toggle:", state)
    end
})

-- Set toggle state programmatically
toggle:set(true)
```

### Button
```lua
local button = section:button({
    name = "Button Name",         -- Name of the button
    callback = function()         -- Called when button clicked
        print("Button clicked")
    end
})
```

### Slider
```lua
local slider = section:slider({
    name = "Slider Name",         -- Name of the slider
    def = 50,                     -- Default value (default: 0)
    min = 0,                      -- Minimum value (default: 0)
    max = 100,                    -- Maximum value (default: 100)
    rounding = false,             -- Round to nearest integer (default: false)
    ticking = false,              -- Snap to integer values (default: false)
    measurement = "%",            -- Measurement unit (default: "")
    pointer = "sliderPointer",    -- Optional pointer name
    callback = function(value)    -- Called when value changes
        print("Slider value:", value)
    end
})

-- Set slider value programmatically
slider:set(75)
```

### Dropdown
```lua
local dropdown = section:dropdown({
    name = "Dropdown Name",       -- Name of the dropdown
    def = "Option 1",             -- Default option
    max = 4,                      -- Max visible options (default: 4)
    options = {"Option 1", "Option 2", "Option 3"}, -- List of options
    pointer = "dropdownPointer",  -- Optional pointer name
    callback = function(option)   -- Called when option selected
        print("Selected:", option)
    end
})

-- Set dropdown selection programmatically
dropdown:set("Option 2")
```

### Button Box
```lua
local buttonbox = section:buttonbox({
    name = "Button Box Name",     -- Name of the button box
    def = "Option 1",             -- Default option
    max = 4,                      -- Max visible options (default: 4)
    options = {"Option 1", "Option 2", "Option 3"}, -- List of options
    pointer = "buttonboxPointer", -- Optional pointer name
    callback = function(option)   -- Called when option selected
        print("Selected:", option)
    end
})

-- Set button box selection programmatically
buttonbox:set("Option 3")
```

### Multi Box
```lua
local multibox = section:multibox({
    name = "Multi Box Name",      -- Name of the multi box
    def = {"Option 1"},           -- Default selections (table)
    max = 4,                      -- Max visible options (default: 4)
    options = {"Option 1", "Option 2", "Option 3"}, -- List of options
    pointer = "multiboxPointer",  -- Optional pointer name
    callback = function(options)  -- Called when selections change
        print("Selected:", table.concat(options, ", "))
    end
})

-- Set multi box selections programmatically
multibox:set({"Option 1", "Option 3"})
```

### Text Box
```lua
local textbox = section:textbox({
    name = "Text Box Name",       -- Name of the text box
    def = "",                     -- Default text (default: "")
    placeholder = "Enter text...",-- Placeholder text
    pointer = "textboxPointer",   -- Optional pointer name
    callback = function(text)     -- Called when text changes
        print("Text:", text)
    end
})

-- Set text box value programmatically
textbox:set("New text")
```

### Keybind
```lua
local keybind = section:keybind({
    name = "Keybind Name",        -- Name of the keybind
    def = Enum.KeyCode.RightShift,-- Default key (default: nil)
    allowed = 1,                  -- 1 = allow mouse buttons, 0 = only keyboard
    pointer = "keybindPointer",   -- Optional pointer name
    callback = function(key)      -- Called when keybind pressed
        print("Keybind pressed:", key)
    end
})

-- Set keybind programmatically
keybind:set(Enum.KeyCode.LeftControl)
```

### Color Picker
```lua
local colorpicker = section:colorpicker({
    name = "Color Picker Name",   -- Name of the color picker
    cpname = "Color Picker",      -- Title inside color picker
    def = Color3.fromRGB(255, 0, 0), -- Default color
    pointer = "colorpickerPointer", -- Optional pointer name
    callback = function(color)    -- Called when color changes
        print("Color:", color)
    end
})

-- Set color programmatically
colorpicker:set(Color3.fromRGB(0, 255, 0))
```

### Config Loader
```lua
local configloader = section:configloader({
    folder = "BloxUi_Configs/"    -- Folder to save/load configs
})
```

## Window Functions
```lua
-- Change UI keybind (default: RightShift)
window:setkey(Enum.KeyCode.RightControl)

-- Change UI theme color
window:settheme("accent", Color3.fromRGB(0, 255, 0))

-- Change UI font
window:setfont("SourceSans")

-- Change UI text size
window:settextsize(14)

-- Enable/disable UI movement on X/Y axis
window:settoggle("x", false) -- Disable X movement
window:settoggle("y", true)  -- Enable Y movement

-- Save current configuration
local config = window:saveconfig()

-- Load configuration
window:loadconfig(config)
```

## Notes
1. The UI can be toggled with the set keybind (default: RightShift)
2. All elements with a `pointer` parameter can be saved/loaded in configs
3. The config loader requires a valid folder path to work
4. The watermark can display dynamic information by updating it regularly
