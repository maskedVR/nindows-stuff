-- startup.lua

local function clearScreen()
    term.setBackgroundColor(colors.black)
    term.clear()
    term.setTextColor(colors.white)
end

local function centerText(text, y)
    local screenWidth, _ = term.getSize()
    local textLength = string.len(text)
    local x = math.ceil((screenWidth - textLength) / 2)
    term.setCursorPos(x, y)
    term.write(text)
end

local function drawProgressBar(percentage)
    local screenWidth, screenHeight = term.getSize()
    local barWidth = 20
    local progress = math.ceil((barWidth * percentage) / 100)
    
    local x = math.ceil((screenWidth - barWidth) / 2)
    local y = math.ceil(screenHeight / 2)
    
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.green)
    term.setCursorPos(x, y)
    term.write("[" .. string.rep("-", barWidth) .. "]")
    
    term.setBackgroundColor(colors.green)
    term.setCursorPos(x + 1, y)
    term.write(string.rep("-", progress))
    
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
end

local function drawStartupScreen()
    clearScreen()
    centerText("Nindows", 1)
    
    for i = 0, 100, 10 do
        drawProgressBar(i)
        sleep(0.5)  -- Adjust delay for loading effect
    end
    
    term.setCursorPos(1, 1)  -- Reset cursor position
end

-- Main startup procedure
drawStartupScreen()
sleep(1)  -- Simulate some additional startup delay
shell.run("/ProtectedFiles/kernal.txt")
