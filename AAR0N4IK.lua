local P = game:GetService("Players")
local U = game:GetService("UserInputService")
local L = game:GetService("Lighting")
local W = game:GetService("Workspace")
local RS = game:GetService("RunService")
local VU = game:GetService("VirtualUser")
local TS = game:GetService("TeleportService")
local HS = game:GetService("HttpService")
local plr = P.LocalPlayer

pcall(function()
    local old = plr.PlayerGui:FindFirstChild("AAR0N_Ultimate")
    if old then old:Destroy() end
end)

local C = {
    bg = Color3.fromRGB(12, 10, 18),
    bg2 = Color3.fromRGB(20, 16, 30),
    bg3 = Color3.fromRGB(35, 25, 50),
    a = Color3.fromRGB(168, 85, 247),
    a2 = Color3.fromRGB(236, 72, 153),
    t = Color3.fromRGB(255, 255, 255),
    sub = Color3.fromRGB(180, 170, 200),
    r = Color3.fromRGB(255, 60, 60),
    b = Color3.fromRGB(60, 150, 255),
    g = Color3.fromRGB(60, 220, 100)
}

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
gui.Name = "AAR0N_Ultimate"
gui.ResetOnSpawn = false
gui.DisplayOrder = 100
gui.Parent = plr:WaitForChild("PlayerGui")

-- === ГРАФФИТИ ===
task.spawn(function()
    task.wait(1)
    local shop = W:FindFirstChild("Shop", true) or W:FindFirstChild("Radio", true) or W:FindFirstChild("Market", true)
    local pos = plr.Character and plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -2.8, -5) or CFrame.new(0, 0, 0)
    if shop and shop:IsA("BasePart") then 
        pos = shop.CFrame * CFrame.new(0, 0.5, 5) 
    end
    
    local paint = Instance.new("Part", W)
    paint.Size = Vector3.new(15, 1, 15)
    paint.CFrame = pos
    paint.Anchored = true
    paint.CanCollide = false
    paint.Transparency = 1
    
    local sg = Instance.new("SurfaceGui", paint)
    sg.Face = Enum.NormalId.Top
    local text = Instance.new("TextLabel", sg)
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "AAR0N4IK"
    text.TextColor3 = Color3.fromRGB(255, 0, 0)
    text.Font = Enum.Font.GothamBlack
    text.TextScaled = true
    text.TextStrokeTransparency = 0.7
end)

-- === КНОПКА А ===
local aBtn = Instance.new("TextButton", gui)
aBtn.Size = UDim2.fromOffset(60, 60)
aBtn.Position = UDim2.new(0.5, 0, 0.5, 0)
aBtn.AnchorPoint = Vector2.new(0.5, 0.5)
aBtn.BackgroundColor3 = C.a
aBtn.Text = "A"
aBtn.TextColor3 = C.t
aBtn.Font = Enum.Font.GothamBlack
aBtn.TextSize = 28
aBtn.AutoButtonColor = false
aBtn.Visible = false
Instance.new("UICorner", aBtn).CornerRadius = UDim.new(0, 30)

-- === ГЛАВНОЕ ОКНО ===
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0.85, 0, 0.75, 0)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = C.bg
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", main).Color = C.a

local topbar = Instance.new("Frame", main)
topbar.Size = UDim2.new(1, 0, 0, 40)
topbar.BackgroundColor3 = C.bg2
topbar.BorderSizePixel = 0
Instance.new("UICorner", topbar).CornerRadius = UDim.new(0, 12)
topbar.Parent = main

local title = Instance.new("TextLabel", topbar)
title.Size = UDim2.new(1, -40, 1, 0)
title.BackgroundTransparency = 1
title.Text = "AAR0N4IK | ULTIMATE"
title.TextColor3 = C.a2
title.Font = Enum.Font.GothamBlack
title.TextSize = 15
title.Parent = topbar

local closeBtn = Instance.new("TextButton", topbar)
closeBtn.Size = UDim2.fromOffset(30, 30)
closeBtn.Position = UDim2.new(1, -35, 0.5, -15)
closeBtn.BackgroundColor3 = C.r
closeBtn.Text = "×"
closeBtn.TextColor3 = C.t
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.AutoButtonColor = false
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)
closeBtn.Parent = topbar

addClick(closeBtn, function() 
    main.Visible = false 
    aBtn.Visible = true 
end)

addClick(aBtn, function() 
    main.Visible = true 
    aBtn.Visible = false 
end)

-- === ШИРОКАЯ ПАНЕЛЬ (25%) ===
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0.25, -5, 1, -45)
sidebar.Position = UDim2.new(0, 5, 0, 45)
sidebar.BackgroundTransparency = 1
sidebar.Parent = main
local sLayout = Instance.new("UIListLayout", sidebar)
sLayout.Padding = UDim.new(0, 6)
sLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- === КОНТЕНТ (75%) ===
local content = Instance.new("Frame", main)
content.Size = UDim2.new(0.75, -5, 1, -55)
content.Position = UDim2.new(0.25, 0, 0, 50)
content.BackgroundTransparency = 1
content.Parent = main

local tabs = {}
local function createTab(name, icon)
    local b = Instance.new("TextButton", sidebar)
    b.Size = UDim2.new(1, -10, 0, 36)
    b.BackgroundColor3 = C.bg2
    b.Text = icon .. " " .. name
    b.TextColor3 = C.sub
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    b.AutoButtonColor = false
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    
    local p = Instance.new("ScrollingFrame", content)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.ScrollBarThickness = 3
    p.ScrollBarImageColor3 = C.a
    p.CanvasSize = UDim2.new()
    p.AutomaticCanvasSize = Enum.AutomaticSize.Y
    p.Visible = false
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 4)
    
    table.insert(tabs, {b = b, p = p})
    
    addClick(b, function()
        for _, x in ipairs(tabs) do 
            x.p.Visible = false 
            x.b.BackgroundColor3 = C.bg2 
            x.b.TextColor3 = C.sub 
        end
        p.Visible = true 
        b.BackgroundColor3 = C.a 
        b.TextColor3 = C.t
    end)
    
    if #tabs == 1 then 
        p.Visible = true 
        b.BackgroundColor3 = C.a 
        b.TextColor3 = C.t 
    end
    return p
end

local function createToggle(parent, text, default, callback)
    local f = Instance.new("Frame", parent)
    f.Size = UDim2.new(1, -5, 0, 36)
    f.BackgroundColor3 = C.bg2
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
    
    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(1, -60, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = C.t
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = f
    
    local bg = Instance.new("Frame", f)
    bg.Size = UDim2.fromOffset(40, 20)
    bg.Position = UDim2.new(1, -50, 0.5, -10)
    bg.BackgroundColor3 = default and C.a or C.bg3
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 10)
    bg.Parent = f
    
    local kn = Instance.new("Frame", bg)
    kn.Size = UDim2.fromOffset(16, 16)
    kn.Position = default and UDim2.new(1, -18, 0.5, -8) or UDim2.fromOffset(2, 2)
    kn.BackgroundColor3 = C.t
    Instance.new("UICorner", kn).CornerRadius = UDim.new(0, 8)
    kn.Parent = bg
    
    local state = default
    local btn = Instance.new("TextButton", f)
    btn.Size = UDim2.fromScale(1, 1)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.Parent = f
    
    addClick(btn, function()
        state = not state
        bg.BackgroundColor3 = state and C.a or C.bg3
        kn.Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.fromOffset(2, 2)
        if callback then callback(state) end
    end)
end

local function createButton(parent, text, callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, -5, 0, 36)
    b.BackgroundColor3 = C.bg2
    b.Text = text
    b.TextColor3 = C.a2
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    b.AutoButtonColor = false
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    addClick(b, function() if callback then callback() end end)
end

local function createTextBox(parent, placeholder, callback)
    local b = Instance.new("TextBox", parent)
    b.Size = UDim2.new(1, -5, 0, 36)
    b.BackgroundColor3 = C.bg2
    b.Text = ""
    b.PlaceholderText = placeholder
    b.PlaceholderColor3 = C.sub
    b.TextColor3 = C.t
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    b.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local num = tonumber(b.Text)
            if num and callback then callback(num) end
        end
    end)
end

local function role(p)
    if not p or not p.Character then return "Innocent" end
    local bp = p:FindFirstChild("Backpack")
    if bp then 
        if bp:FindFirstChild("Knife") then return "Murderer" end 
        if bp:FindFirstChild("Gun") then return "Sheriff" end 
    end
    return "Innocent"
end

local function fm()
    for _, p in ipairs(P:GetPlayers()) do 
        if p ~= plr and p.Character and role(p) == "Murderer" then return p end 
    end 
end

-- ВКЛАДКИ
local t1 = createTab("Main", "🏃")
local t2 = createTab("Visual", "👁")
local t3 = createTab("Combat", "⚔️")
local t4 = createTab("Players", "👥")
local t5 = createTab("Emote", "💃")
local t6 = createTab("Epic", "💥")
local t7 = createTab("Misc", "🌐")

-- 1. MAIN
local noclip = false
local af = false
local autoFarm = false
local infjump = false
local fly = false
local flySpeed = 50
local lowGrav = false
local walkWater = false

RS.Stepped:Connect(function() 
    if noclip and plr.Character then 
        for _, v in pairs(plr.Character:GetDescendants()) do 
            if v:IsA("BasePart") then v.CanCollide = false end 
        end 
    end 
end)

plr.Idled:Connect(function() 
    if af then 
        VU:CaptureController() 
        VU:ClickButton2(Vector2.new()) 
    end 
end)

task.spawn(function() 
    while task.wait(0.5) do 
        if autoFarm and plr.Character then 
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart") 
            if hrp then 
                for _, v in ipairs(W:GetDescendants()) do 
                    if v:IsA("BasePart") and v.Name:lower():find("coin") then 
                        hrp.CFrame = v.CFrame 
                    end 
                end 
            end 
        end 
    end 
end)

U.InputBegan:Connect(function(i, gp) 
    if gp then return end 
    if infjump and i.KeyCode == Enum.KeyCode.Space then 
        local h = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") 
        if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end 
    end 
end)

RS.Heartbeat:Connect(function() 
    if lowGrav and W.Gravity ~= 50 then W.Gravity = 50 
    elseif not lowGrav and W.Gravity ~= 196.2 then W.Gravity = 196.2 end 
end)

task.spawn(function() 
    while task.wait(0.5) do 
        if walkWater and plr.Character then 
            local h = plr.Character:FindFirstChild("Humanoid") 
            if h then h:ChangeState(Enum.HumanoidStateType.Swimming) end 
        end 
    end 
end)

createToggle(t1, "Noclip", false, function(s) noclip = s end)
createToggle(t1, "Anti-AFK", false, function(s) af = s end)
createToggle(t1, "Auto Farm Coins", false, function(s) autoFarm = s end)
createToggle(t1, "Infinite Jump", false, function(s) infjump = s end)

createToggle(t1, "Fly (Джойстик)", false, function(s)
    fly = s
    local c = plr.Character
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    local hum = c:FindFirstChildOfClass("Humanoid")
    if s and hrp and hum then
        hum.PlatformStand = true
        local bv = Instance.new("BodyVelocity", hrp)
        bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        bv.Velocity = Vector3.zero
        task.spawn(function()
            while fly and bv.Parent do
                local moveDir = hum.MoveDirection
                if moveDir.Magnitude > 0 then
                    bv.Velocity = moveDir * flySpeed
                else
                    bv.Velocity = Vector3.zero
                end
                RS.RenderStepped:Wait()
            end
        end)
    elseif not s and hrp and hum then
        hum.PlatformStand = false
        local b = hrp:FindFirstChildOfClass("BodyVelocity")
        if b then b:Destroy() end
    end
end)

createTextBox(t1, "Введи скорость полета", function(num) flySpeed = num end)
createToggle(t1, "Low Gravity", false, function(s) lowGrav = s end)
createToggle(t1, "Walk on Water", false, function(s) walkWater = s end)
createTextBox(t1, "Введи скорость", function(num) if plr.Character then plr.Character.Humanoid.WalkSpeed = num end end)
createTextBox(t1, "Введи прыжок", function(num) if plr.Character then plr.Character.Humanoid.UseJumpPower = true; plr.Character.Humanoid.JumpPower = num end end)
createButton(t1, "Speed 16 (Reset)", function() if plr.Character then plr.Character.Humanoid.WalkSpeed = 16 end end)
createButton(t1, "Jump 50 (Reset)", function() if plr.Character then plr.Character.Humanoid.JumpPower = 50 end end)
createButton(t1, "Reset Character", function() if plr.Character then plr.Character:BreakJoints() end end)

-- 2. VISUAL
local esp = false
local hbExp = false
local fbA = false
local fbO = {}
local nameEsp = false
local ie = false
local coinEsp = false
local rainbow = false
local crosshair = false

local function aE()
    for _, p in ipairs(P:GetPlayers()) do 
        if p.Character then 
            local o = p.Character:FindFirstChild("AAR0N_ESP")
            if o then o:Destroy() end 
        end 
    end
    if not esp then return end
    for _, p in ipairs(P:GetPlayers()) do 
        if p ~= plr and p.Character then 
            local h = Instance.new("Highlight")
            h.Name = "AAR0N_ESP"
            h.Adornee = p.Character
            h.FillTransparency = 0.5
            h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            local r = role(p)
            if r == "Murderer" then h.FillColor = C.r 
            elseif r == "Sheriff" then h.FillColor = C.b 
            else h.FillColor = C.g end
            h.Parent = p.Character 
        end 
    end 
end

task.spawn(function() 
    while task.wait(1) do 
        if esp then aE() end 
    end 
end)

RS.Heartbeat:Connect(function() 
    if hbExp then 
        for _, p in ipairs(P:GetPlayers()) do 
            if p ~= plr and p.Character then 
                for _, v in ipairs(p.Character:GetDescendants()) do 
                    if v:IsA("BasePart") then v.Size = Vector3.new(10,10,10) end 
                end 
            end 
        end 
    end 
end)

task.spawn(function() 
    while task.wait(1) do 
        for _, p in ipairs(P:GetPlayers()) do 
            if p.Character and p.Character:FindFirstChild("Head") then 
                local b = p.Character.Head:FindFirstChild("AAR0N_N") 
                if nameEsp and p ~= plr and not b then 
                    local bg = Instance.new("BillboardGui", p.Character.Head) 
                    bg.Name = "AAR0N_N" 
                    bg.Size = UDim2.new(0,100,0,20) 
                    bg.AlwaysOnTop = true 
                    local t = Instance.new("TextLabel", bg) 
                    t.Size = UDim2.new(1,0,1,0) 
                    t.BackgroundTransparency = 1 
                    t.Text = p.Name .. " | " .. role(p) 
                    t.TextColor3 = C.a2 
                    t.TextStrokeTransparency = 0 
                elseif not nameEsp and b then 
                    b:Destroy() 
                end 
            end 
        end 
    end 
end)

task.spawn(function() 
    while task.wait(2) do 
        if ie then 
            for _, v in ipairs(W:GetDescendants()) do 
                if v:IsA("BasePart") and (v.Name:lower():find("coin") or v.Name:lower():find("gun") or v.Name:lower():find("knife")) then 
                    local h = v:FindFirstChild("AAR0N_IE") 
                    if not h then 
                        local h2 = Instance.new("Highlight") 
                        h2.Name = "AAR0N_IE" 
                        h2.Adornee = v 
                        h2.FillColor = C.a2 
                        h2.Parent = v 
                    end 
                end 
            end 
        end 
    end 
end)

task.spawn(function() 
    while task.wait(1) do 
        if coinEsp then 
            for _, v in ipairs(W:GetDescendants()) do 
                if v:IsA("BasePart") and v.Name:lower():find("coin") then 
                    if not v:FindFirstChild("AAR0N_CE") then 
                        local h = Instance.new("Highlight", v) 
                        h.Name = "AAR0N_CE" 
                        h.FillColor = Color3.new(1,1,0) 
                    end 
                end 
            end 
        end 
    end 
end)

RS.Heartbeat:Connect(function() 
    if rainbow and plr.Character then 
        local h = plr.Character:FindFirstChild("Humanoid") 
        if h then 
            h.DisplayName = string.format("<font color='#%02X%02X%02X'>AAR0N4IK</font>", math.random(255), math.random(255), math.random(255)) 
        end 
    end 
end)

local chGui = Instance.new("Frame", gui)
chGui.Size = UDim2.fromOffset(10,10)
chGui.Position = UDim2.new(0.5,-5,0.5,-5)
chGui.BackgroundTransparency = 1
chGui.Visible = false
local chDot = Instance.new("Frame", chGui)
chDot.Size = UDim2.new(1,0,1,0)
chDot.BackgroundColor3 = C.a
Instance.new("UICorner", chDot).CornerRadius = UDim.new(0,5)
chDot.Parent = chGui

createToggle(t2, "See Roles (ESP)", false, function(s) esp = s; aE() end)
createToggle(t2, "Name ESP", false, function(s) nameEsp = s end)
createToggle(t2, "Item ESP", false, function(s) ie = s end)
createToggle(t2, "Coin ESP", false, function(s) coinEsp = s end)
createToggle(t2, "Hitbox Expander", false, function(s) hbExp = s end)
createToggle(t2, "Fullbright", false, function(s) 
    if s and not fbA then 
        fbA = true
        fbO.a = L.Ambient; fbO.o = L.OutdoorAmbient; fbO.f = L.FogEnd; fbO.b = L.Brightness
        L.Ambient = Color3.new(1,1,1); L.OutdoorAmbient = Color3.new(1,1,1); L.FogEnd = 1e6; L.Brightness = 2
    elseif not s and fbA then 
        fbA = false
        L.Ambient = fbO.a; L.OutdoorAmbient = fbO.o; L.FogEnd = fbO.f; L.Brightness = fbO.b
    end
end)
createToggle(t2, "No Fog", false, function(s) if s then L.FogEnd = 1e6 else L.FogEnd = 1000 end end)
createToggle(t2, "Remove Textures", false, function(s) if s then for _, v in ipairs(W:GetDescendants()) do if v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1 end end end end)
createToggle(t2, "Show Hitboxes", false, function(s) if s then for _, v in ipairs(W:GetDescendants()) do if v:IsA("BasePart") then v.Transparency = 0.5 end end end end)
createToggle(t2, "Hide Self", false, function(s) if s and plr.Character then plr.Character.HumanoidRootPart.Transparency = 1 elseif plr.Character then plr.Character.HumanoidRootPart.Transparency = 0 end end)
createToggle(t2, "Invisible (Local)", false, function(s) if plr.Character then for _, v in ipairs(plr.Character:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then if s then v.LocalTransparencyModifier = 1 else v.LocalTransparencyModifier = 0 end end end end end)
createToggle(t2, "Rainbow Name", false, function(s) rainbow = s end)
createToggle(t2, "Crosshair", false, function(s) chGui.Visible = s end)

-- 3. COMBAT
local ka = false
local silentAim = false
local autoKill = false
local ajump = false
local flingAura = false
local autoGun = false -- НОВАЯ ФУНКЦИЯ

task.spawn(function() 
    while task.wait(0.1) do 
        if ka then 
            local c = plr.Character 
            local k = c and c:FindFirstChild("Knife") 
            if k then 
                for _, p in ipairs(P:GetPlayers()) do 
                    if p ~= plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then 
                        if (p.Character.HumanoidRootPart.Position - c.HumanoidRootPart.Position).Magnitude < 15 then 
                            pcall(function() k:Activate() end) 
                        end 
                    end 
                end 
 
