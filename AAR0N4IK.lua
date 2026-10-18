local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local plr = Players.LocalPlayer

pcall(function() 
    local old = plr.PlayerGui:FindFirstChild("AAR0N_Lite")
    if old then old:Destroy() end 
end)

local Color1 = Color3.fromRGB(20, 10, 30)
local Color2 = Color3.fromRGB(35, 20, 50)
local Accent = Color3.fromRGB(168, 85, 247)
local TextColor = Color3.fromRGB(255, 255, 255)
local Red = Color3.fromRGB(255, 60, 60)
local Blue = Color3.fromRGB(60, 150, 255)
local Green = Color3.fromRGB(60, 220, 100)

local function addClick(btn, func)
    btn.MouseButton1Click:Connect(func)
    btn.TouchTap:Connect(func)
    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            func()
        end
    end)
end

local gui = Instance.new("ScreenGui")
gui.Name = "AAR0N_Lite"
gui.ResetOnSpawn = false
gui.Parent = plr:WaitForChild("PlayerGui")

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0.8, 0, 0.7, 0)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color1
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", main).Color = Accent

local top = Instance.new("Frame", main)
top.Size = UDim2.new(1, 0, 0, 40)
top.BackgroundColor3 = Color2
Instance.new("UICorner", top).CornerRadius = UDim.new(0, 10)
top.Parent = main

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "AAR0N4IK | LITE"
title.TextColor3 = Accent
title.Font = Enum.Font.GothamBlack
title.TextSize = 14
title.Parent = top

local close = Instance.new("TextButton", top)
close.Size = UDim2.fromOffset(30, 30)
close.Position = UDim2.new(1, -35, 0.5, -15)
close.BackgroundColor3 = Red
close.Text = "×"
close.TextColor3 = TextColor
close.Font = Enum.Font.GothamBold
close.TextSize = 18
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 6)
close.Parent = top

local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1, -10, 1, -50)
scroll.Position = UDim2.new(0, 5, 0, 45)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 3
scroll.ScrollBarImageColor3 = Accent
scroll.CanvasSize = UDim2.new()
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = main

Instance.new("UIListLayout", scroll).Padding = UDim.new(0, 5)

local function makeToggle(text, callback)
    local frame = Instance.new("Frame", scroll)
    frame.Size = UDim2.new(1, -5, 0, 35)
    frame.BackgroundColor3 = Color2
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -50, 1, 0)
    label.Position = UDim2.fromOffset(10, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = TextColor
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local bg = Instance.new("Frame", frame)
    bg.Size = UDim2.fromOffset(40, 20)
    bg.Position = UDim2.new(1, -50, 0.5, -10)
    bg.BackgroundColor3 = Color1
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 10)
    bg.Parent = frame
    
    local knob = Instance.new("Frame", bg)
    knob.Size = UDim2.fromOffset(16, 16)
    knob.Position = UDim2.fromOffset(2, 2)
    knob.BackgroundColor3 = TextColor
    Instance.new("UICorner", knob).CornerRadius = UDim.new(0, 8)
    knob.Parent = bg
    
    local state = false
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.fromScale(1, 1)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.Parent = frame
    
    addClick(btn, function()
        state = not state
        bg.BackgroundColor3 = state and Accent or Color1
        knob:TweenPosition(state and UDim2.new(1, -18, 0.5, -8) or UDim2.fromOffset(2, 2), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1)
        if callback then callback(state) end
    end)
end

local function makeButton(text, callback)
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1, -5, 0, 35)
    btn.BackgroundColor3 = Color2
    btn.Text = text
    btn.TextColor3 = Accent
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    addClick(btn, callback)
end

local function makeBox(placeholder, callback)
    local box = Instance.new("TextBox", scroll)
    box.Size = UDim2.new(1, -5, 0, 35)
    box.BackgroundColor3 = Color2
    box.PlaceholderText = placeholder
    box.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    box.Text = ""
    box.TextColor3 = TextColor
    box.Font = Enum.Font.GothamBold
    box.TextSize = 13
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)
    box.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local num = tonumber(box.Text)
            if num then callback(num) end
        end
    end)
end

-- ЛОГИКА
local espEnabled = false
local function updateESP()
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Character then
            local old = p.Character:FindFirstChild("AAR0N_ESP")
            if old then old:Destroy() end
        end
    end
    if not espEnabled then return end
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= plr and p.Character then
            local hl = Instance.new("Highlight")
            hl.Name = "AAR0N_ESP"
            hl.Adornee = p.Character
            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            local bp = p:FindFirstChild("Backpack")
            if bp and bp:FindFirstChild("Knife") then hl.FillColor = Red
            elseif bp and bp:FindFirstChild("Gun") then hl.FillColor = Blue
            else hl.FillColor = Green end
            hl.Parent = p.Character
        end
    end
end

makeToggle("See Roles (ESP)", function(state)
    espEnabled = state
    updateESP()
    task.spawn(function()
        while espEnabled do
            RunService.Heartbeat:Wait()
            updateESP()
        end
    end)
end)

makeToggle("Fullbright", function(state)
    if state then
        Lighting.Ambient = Color3.new(1,1,1)
        Lighting.OutdoorAmbient = Color3.new(1,1,1)
        Lighting.Brightness = 2
    else
        Lighting.Ambient = Color3.new(0.5,0.5,0.5)
        Lighting.OutdoorAmbient = Color3.new(0.5,0.5,0.5)
        Lighting.Brightness = 1
    end
end)

local noclip = false
makeToggle("Noclip", function(state)
    noclip = state
    if plr.Character then
        for _, v in pairs(plr.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = not state end
        end
    end
end)

local flying = false
local flyVelocity = 50
makeToggle("Fly (WASD)", function(state)
    flying = state
    local char = plr.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    
    if state and hrp then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        bv.Velocity = Vector3.zero
        task.spawn(function()
            while flying and bv.Parent do
                local move = Vector3.zero
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + Workspace.CurrentCamera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - Workspace.CurrentCamera.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - Workspace.CurrentCamera.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + Workspace.CurrentCamera.CFrame.RightVector end
                bv.Velocity = move * flyVelocity
                RunService.RenderStepped:Wait()
            end
        end)
    else
        local bv = hrp and hrp:FindFirstChildOfClass("BodyVelocity")
        if bv then bv:Destroy() end
    end
end)

makeBox("Введи скорость", function(num)
    if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
        plr.Character.Humanoid.WalkSpeed = num
    end
end)

makeBox("Введи скорость полета", function(num)
    flyVelocity = num
end)

makeButton("Server Hop", function()
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local ok, d = pcall(function() 
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100")) 
    end)
    if ok and d and d.data then
        for _, s in ipairs(d.data) do
            if s.playing < s.maxPlayers and s.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, plr)
                return
            end
        end
    end
end)

addClick(close, function() 
    gui:Destroy() 
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "AAR0N",
    Text = "Lite версия загружена!",
    Duration = 5
})
