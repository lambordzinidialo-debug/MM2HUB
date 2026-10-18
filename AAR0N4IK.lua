-- ==========================================
-- AAR0N4IK | ULTIMATE BALANCE EDITION (~17KB)
-- Оптимизировано под мобильные устройства
-- ==========================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Удаляем старую версию, если есть
if PlayerGui:FindFirstChild("AAR0N_Ultimate") then 
    PlayerGui.AAR0N_Ultimate:Destroy() 
end

-- Настройки цветов интерфейса
local Colors = {
    bg = Color3.fromRGB(15, 10, 20),
    bg2 = Color3.fromRGB(25, 15, 35),
    bg3 = Color3.fromRGB(40, 25, 55),
    accent = Color3.fromRGB(168, 85, 247),
    accent2 = Color3.fromRGB(236, 72, 153),
    text = Color3.fromRGB(255, 255, 255),
    subtext = Color3.fromRGB(180, 170, 200),
    red = Color3.fromRGB(255, 60, 60),
    blue = Color3.fromRGB(60, 150, 255),
    green = Color3.fromRGB(60, 220, 100)
}

-- Вспомогательная функция для кликов (работает на телефоне)
local function addClick(btn, func)
    btn.MouseButton1Click:Connect(func)
    btn.TouchTap:Connect(func)
    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            func()
        end
    end)
end

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AAR0N_Ultimate"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 100
ScreenGui.Parent = PlayerGui

-- Кнопка "А"
local ABtn = Instance.new("TextButton", ScreenGui)
ABtn.Size = UDim2.fromOffset(60, 60)
ABtn.Position = UDim2.new(0.5, 0, 0.5, 0)
ABtn.AnchorPoint = Vector2.new(0.5, 0.5)
ABtn.BackgroundColor3 = Colors.accent
ABtn.Text = "A"
ABtn.TextColor3 = Colors.text
ABtn.Font = Enum.Font.GothamBlack
ABtn.TextSize = 28
ABtn.Visible = false
Instance.new("UICorner", ABtn).CornerRadius = UDim.new(0, 30)

-- Главное окно
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0.85, 0, 0.75, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Colors.bg
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", MainFrame).Color = Colors.accent

-- Верхняя панель
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Colors.bg2
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 12)
TopBar.Parent = MainFrame

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -40, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "AAR0N4IK | ULTIMATE"
Title.TextColor3 = Colors.accent
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 15
Title.Parent = TopBar

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.fromOffset(30, 30)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
CloseBtn.BackgroundColor3 = Colors.red
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Colors.text
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 20
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
CloseBtn.Parent = TopBar

addClick(CloseBtn, function() MainFrame.Visible = false ABtn.Visible = true end)
addClick(ABtn, function() MainFrame.Visible = true ABtn.Visible = false end)

-- Боковая панель
local Sidebar = Instance.new("Frame", MainFrame)
Sidebar.Size = UDim2.new(0.25, -5, 1, -45)
Sidebar.Position = UDim2.new(0, 5, 0, 45)
Sidebar.BackgroundTransparency = 1
Sidebar.Parent = MainFrame
Instance.new("UIListLayout", Sidebar).Padding = UDim.new(0, 6)

-- Контент
local Content = Instance.new("Frame", MainFrame)
Content.Size = UDim2.new(0.75, -5, 1, -55)
Content.Position = UDim2.new(0.25, 0, 0, 50)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local Tabs = {}
local function createTab(name, icon)
    local btn = Instance.new("TextButton", Sidebar)
    btn.Size = UDim2.new(1, -10, 0, 36)
    btn.BackgroundColor3 = Colors.bg2
    btn.Text = icon .. " " .. name
    btn.TextColor3 = Colors.text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    
    local page = Instance.new("ScrollingFrame", Content)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = Colors.accent
    page.CanvasSize = UDim2.new()
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.Visible = false
    Instance.new("UIListLayout", page).Padding = UDim.new(0, 4)
    
    table.insert(Tabs, {b = btn, p = page})
    
    addClick(btn, function()
        for _, x in ipairs(Tabs) do 
            x.p.Visible = false 
            x.b.BackgroundColor3 = Colors.bg2 
        end
        page.Visible = true 
        btn.BackgroundColor3 = Colors.accent
    end)
    
    if #Tabs == 1 then 
        page.Visible = true 
        btn.BackgroundColor3 = Colors.accent
    end
    return page
end

local function createToggle(parent, text, default, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, -5, 0, 36)
    frame.BackgroundColor3 = Colors.bg2
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -50, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Colors.text
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local bg = Instance.new("Frame", frame)
    bg.Size = UDim2.fromOffset(36, 18)
    bg.Position = UDim2.new(1, -46, 0.5, -9)
    bg.BackgroundColor3 = Colors.bg
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 9)
    bg.Parent = frame
    
    local knob = Instance.new("Frame", bg)
    knob.Size = UDim2.fromOffset(14, 14)
    knob.Position = UDim2.fromOffset(2, 2)
    knob.BackgroundColor3 = Colors.text
    Instance.new("UICorner", knob).CornerRadius = UDim.new(0, 7)
    knob.Parent = bg
    
    local state = default
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.fromScale(1, 1)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.Parent = frame
    
    addClick(btn, function()
        state = not state
        bg.BackgroundColor3 = state and Colors.accent or Colors.bg
        knob.Position = state and UDim2.new(1, -16, 0.5, -7) or UDim2.fromOffset(2, 2)
        if callback then callback(state) end
    end)
end

local function createButton(parent, text, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -5, 0, 36)
    btn.BackgroundColor3 = Colors.bg2
    btn.Text = text
    btn.TextColor3 = Colors.accent
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    addClick(btn, callback)
end

local function createTextBox(parent, placeholder, callback)
    local box = Instance.new("TextBox", parent)
    box.Size = UDim2.new(1, -5, 0, 36)
    box.BackgroundColor3 = Colors.bg2
    box.PlaceholderText = placeholder
    box.PlaceholderColor3 = Colors.subtext
    box.TextColor3 = Colors.text
    box.Font = Enum.Font.Gotham
    box.TextSize = 13
    box.Text = ""
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)
    box.FocusLost:Connect(function(enterPressed)
        if enterPressed and tonumber(box.Text) then 
            callback(tonumber(box.Text)) 
        end
    end)
end

local function getRole(player)
    if not player or not player.Character then return "Innocent" end
    local bp = player:FindFirstChild("Backpack")
    if bp and bp:FindFirstChild("Knife") then return "Murderer" end
    if bp and bp:FindFirstChild("Gun") then return "Sheriff" end
    return "Innocent"
end

local function getMurderer()
    for _, p in ipairs(Players:GetPlayers()) do 
        if p ~= LocalPlayer and p.Character and getRole(p) == "Murderer" then 
            return p 
        end 
    end
end

-- Создание вкладок
local TabMain = createTab("Main", "🏃")
local TabVisual = createTab("Visual", "👁")
local TabCombat = createTab("Combat", "⚔️")
local TabPlayers = createTab("Players", "👥")
local TabEmote = createTab("Emote", "💃")
local TabEpic = createTab("Epic", "💥")
local TabMisc = createTab("Misc", "🌐")

-- Переменные состояний
local Settings = {
    Fly = false,
    Noclip = false,
    InfJump = false,
    AntiAFK = false,
    AutoFarm = false,
    FlySpeed = 50,
    ESP = false,
    NameESP = false,
    Hitbox = false,
    Fullbright = false,
    Aura = false,
    SilentAim = false,
    AutoKill = false,
    AutoDodge = false,
    AutoGun = false,
    AntiFling = false
}

-- Вкладка MAIN
createToggle(TabMain, "Noclip", false, function(s) Settings.Noclip = s end)
createToggle(TabMain, "Fly (Джойстик)", false, function(s) Settings.Fly = s end)
createTextBox(TabMain, "Скорость полета", function(n) Settings.FlySpeed = n end)
createTextBox(TabMain, "Скорость ходьбы", function(n) if LocalPlayer.Character then LocalPlayer.Character.Humanoid.WalkSpeed = n end end)
createTextBox(TabMain, "Высота прыжка", function(n) if LocalPlayer.Character then LocalPlayer.Character.Humanoid.UseJumpPower = true; LocalPlayer.Character.Humanoid.JumpPower = n end end)
createToggle(TabMain, "Infinite Jump", false, function(s) Settings.InfJump = s end)
createToggle(TabMain, "Anti-AFK", false, function(s) Settings.AntiAFK = s end)
createToggle(TabMain, "Auto Farm Coins", false, function(s) Settings.AutoFarm = s end)
createButton(TabMain, "Reset Character", function() if LocalPlayer.Character then LocalPlayer.Character:BreakJoints() end end)

-- Вкладка VISUAL
local function updateESP()
    for _, p in ipairs(Players:GetPlayers()) do 
        if p.Character then 
            local old = p.Character:FindFirstChild("AAR0N_ESP")
            if old then old:Destroy() end 
        end 
    end
    if not Settings.ESP then return end
    for _, p in ipairs(Players:GetPlayers()) do 
        if p ~= LocalPlayer and p.Character then 
            local hl = Instance.new("Highlight")
            hl.Name = "AAR0N_ESP"
            hl.Adornee = p.Character
            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            local r = getRole(p)
            if r == "Murderer" then hl.FillColor = Colors.red 
            elseif r == "Sheriff" then hl.FillColor = Colors.blue 
            else hl.FillColor = Colors.green end
            hl.Parent = p.Character 
        end 
    end 
end

createToggle(TabVisual, "See Roles (ESP)", false, function(s) Settings.ESP = s; updateESP() end)
createToggle(TabVisual, "Hitbox Expander", false, function(s) Settings.Hitbox = s end)
createToggle(TabVisual, "Fullbright", false, function(s) 
    Settings.Fullbright = s
    if s then
        Lighting.Ambient = Color3.new(1,1,1)
        Lighting.OutdoorAmbient = Color3.new(1,1,1)
    else
        Lighting.Ambient = Color3.new(0.5,0.5,0.5)
        Lighting.OutdoorAmbient = Color3.new(0.5,0.5,0.5)
    end
end)

-- Вкладка COMBAT
createToggle(TabCombat, "Melee Aura", false, function(s) Settings.Aura = s end)
createToggle(TabCombat, "Silent Aim", false, function(s) Settings.SilentAim = s end)
createToggle(TabCombat, "Auto-Kill (TP)", false, function(s) Settings.AutoKill = s end)
createToggle(TabCombat, "Auto-Dodge (Jump)", false, function(s) Settings.AutoDodge = s end)
createToggle(TabCombat, "Auto Dropped Gun", false, function(s) Settings.AutoGun = s end)
createButton(TabCombat, "TP to Murderer", function() 
    local m = getMurderer()
    if m and m.Character then 
        LocalPlayer.Character.HumanoidRootPart.CFrame = m.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3) 
    end 
end)
createButton(TabCombat, "TP to Coin", function() 
    for _, v in ipairs(Workspace:GetDescendants()) do 
        if v:IsA("BasePart") and v.Name:lower():find("coin") then 
            LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame 
        end 
    end 
end)

-- Вкладка PLAYERS
local function flingPlayer(target)
    if target and target.Character then 
        local hrp = target.Character:FindFirstChild("HumanoidRootPart")
        if hrp then 
            local bv = Instance.new("BodyAngularVelocity", hrp)
            bv.AngularVelocity = Vector3.new(99999, 99999, 99999)
            bv.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            task.delay(1, function() bv:Destroy() end)
        end 
    end 
end

local function updatePlayerList()
    for _, child in ipairs(TabPlayers:GetChildren()) do 
        if child:IsA("Frame") then child:Destroy() end 
    end
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            local pf = Instance.new("Frame", TabPlayers) 
            pf.Size = UDim2.new(1, -5, 0, 40) 
            pf.BackgroundColor3 = Colors.bg2 
            Instance.new("UICorner", pf).CornerRadius = UDim.new(0, 8)
            
            local nl = Instance.new("TextLabel", pf) 
            nl.Size = UDim2.new(0.4, 0, 1, 0) 
            nl.Position = UDim2.new(0, 10, 0, 0) 
            nl.BackgroundTransparency = 1 
            nl.Text = p.Name 
            nl.TextColor3 = Colors.text 
            nl.Font = Enum.Font.GothamMedium 
            nl.TextSize = 12 
            nl.TextXAlignment = Enum.TextXAlignment.Left 
            nl.Parent = pf
            
            local tpBtn = Instance.new("TextButton", pf) 
            tpBtn.Size = UDim2.new(0.2, 0, 0.7, 0) 
            tpBtn.Position = UDim2.new(0.45, 0, 0.15, 0) 
            tpBtn.BackgroundColor3 = Colors.accent 
            tpBtn.Text = "TP" 
            tpBtn.TextColor3 = Colors.text 
            tpBtn.Font = Enum.Font.GothamBold 
            tpBtn.TextSize = 12 
            Instance.new("UICorner", tpBtn).CornerRadius = UDim.new(0, 4)
            addClick(tpBtn, function() 
                if p.Character and LocalPlayer.Character then 
                    LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3) 
                end 
            end) 
            tpBtn.Parent = pf
            
            local flingBtn = Instance.new("TextButton", pf) 
            flingBtn.Size = UDim2.new(0.25, 0, 0.7, 0) 
            flingBtn.Position = UDim2.new(0.7, 0, 0.15, 0) 
            flingBtn.BackgroundColor3 = Colors.red 
            flingBtn.Text = "Fling" 
            flingBtn.TextColor3 = Colors.text 
            flingBtn.Font = Enum.Font.GothamBold 
            flingBtn.TextSize = 12 
            Instance.new("UICorner", flingBtn).CornerRadius = UDim.new(0, 4)
            addClick(flingBtn, function() flingPlayer(p) end) 
            flingBtn.Parent = pf
        end
    end
end
updatePlayerList() 
task.spawn(function() while task.wait(5) do updatePlayerList() end end)
createButton(TabPlayers, "Fling All", function() for _, p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer then flingPlayer(p) end end end)

-- Вкладка EMOTE
local function playAnim(id) 
    local c = LocalPlayer.Character 
    if c and c:FindFirstChildOfClass("Humanoid") then 
        local a = Instance.new("Animation") 
        a.AnimationId = "rbxassetid://"..tostring(id) 
        local an = c.Humanoid:FindFirstChildOfClass("Animator") 
        if an then 
            local tr = an:LoadAnimation(a) 
            tr:Play() 
        end 
    end 
end

createButton(TabEmote, "Floss", function() playAnim(5915694204) end) 
createButton(TabEmote, "Dab", function() playAnim(2482632600) end) 
createButton(TabEmote, "Orange Justice", function() playAnim(3264923498) end) 
createButton(TabEmote, "Default Dance", function() playAnim(507771019) end) 
createButton(TabEmote, "Gangnam Style", function() playAnim(4341064546) end) 
createButton(TabEmote, "Macarena", function() playAnim(1286874805) end) 
createButton(TabEmote, "Russian Dance", function() playAnim(7823163342) end) 
createButton(TabEmote, "Zombie Walk", function() playAnim(616163682) end) 
createButton(TabEmote, "Levitate", function() playAnim(3132104140) end) 
createButton(TabEmote, "Hacker Dance", function() playAnim(13121459905) end) 
createButton(TabEmote, "Moonwalk", function() playAnim(8299783018) end) 
createButton(TabEmote, "Salute", function() playAnim(3382359835) end) 
createButton(TabEmote, "Shuffle", function() playAnim(8036852701) end) 
createButton(TabEmote, "Electro Shuffle", function() playAnim(5102713912) end) 
createButton(TabEmote, "Best Mates", function() playAnim(6692709646) end)
createButton(TabEmote, "Twerk", function() playAnim(5828553173) end)
createButton(TabEmote, "Breakdance", function() playAnim(3412021141) end)

-- Вкладка EPIC
createButton(TabEpic, "Spawn My Clone", function() 
    if LocalPlayer.Character then 
        local clone = LocalPlayer.Character:Clone() 
        clone.Name = "AAR0N_Clone" 
        for _, v in ipairs(clone:GetDescendants()) do 
            if v:IsA("Script") or v:IsA("LocalScript") then v:Destroy() end 
        end 
        local spawnPos = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5) 
        clone.Parent = Workspace 
        local hrp = clone:FindFirstChild("HumanoidRootPart") 
        if hrp then hrp.CFrame = spawnPos; hrp.Anchored = true end 
    end 
end)
createButton(TabEpic, "Mass Freeze", function() for _, p in ipairs(Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then p.Character.HumanoidRootPart.Anchored = true end end end)
createButton(TabEpic, "Mass Unfreeze", function() for _, p in ipairs(Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then p.Character.HumanoidRootPart.Anchored = false end end end)
createButton(TabEpic, "Mass TP", function() local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") if myHRP then for _, p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then p.Character.HumanoidRootPart.CFrame = myHRP.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5)) end end end end)
createButton(TabEpic, "Earthquake", function() local cam = Workspace.CurrentCamera task.spawn(function() for i=1, 50 do cam.CFrame = cam.CFrame * CFrame.Angles(math.random(-10,10)/100, math.random(-10,10)/100, math.random(-10,10)/100) task.wait(0.05) end end) end)
createButton(TabEpic, "Rain Coins", function() for i=1, 20 do task.spawn(function() local coin = Instance.new("Part", Workspace) coin.Size = Vector3.new(2,2,2) coin.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.random(-20,20), 50, math.random(-20,20)) coin.Color = Color3.new(1,1,0) coin.Material = Enum.Material.Neon task.wait(5) coin:Destroy() end) end end)

-- Вкладка MISC
createToggle(TabMisc, "Anti-Fling", false, function(s) Settings.AntiFling = s end)
createButton(TabMisc, "Server Hop", function() 
    local ok, d = pcall(function() 
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?limit=100")) 
    end) 
    if ok and d and d.data then 
        for _, s in ipairs(d.data) do 
            if s.playing < s.maxPlayers and s.id ~= game.JobId then 
                TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, LocalPlayer) 
                return 
            end 
        end 
    end 
end)
createButton(TabMisc, "Rejoin", function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)
createButton(TabMisc, "Time Day", function() Lighting.ClockTime = 12 e
