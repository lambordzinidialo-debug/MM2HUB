-- ==============================================
-- EXCLUSIVE AAR0N4IK | HUGE EDITION
-- Оптимизировано для слабых устройств (Lazy Load)
-- ==============================================

local P = game:GetService("Players")
local U = game:GetService("UserInputService")
local L = game:GetService("Lighting")
local W = game:GetService("Workspace")
local RS = game:GetService("RunService")
local VU = game:GetService("VirtualUser")
local TS = game:GetService("TeleportService")
local HS = game:GetService("HttpService")
local plr = P.LocalPlayer
local pg = plr:WaitForChild("PlayerGui")

pcall(function() if pg:FindFirstChild("AAR0N_Huge") then pg.AAR0N_Huge:Destroy() end end)

-- ГРАФФИТИ ПРИ ЗАГРУЗКЕ
task.spawn(function()
    task.wait(1)
    local shop = W:FindFirstChild("Shop", true) or W:FindFirstChild("Radio", true)
    local pos = plr.Character and plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -2.8, -5) or CFrame.new(0,0,0)
    if shop and shop:IsA("BasePart") then pos = shop.CFrame * CFrame.new(0, 0.5, 5) end
    local paint = Instance.new("Part", W) paint.Size = Vector3.new(15, 1, 15) paint.CFrame = pos paint.Anchored = true paint.CanCollide = false paint.Transparency = 1
    local sg = Instance.new("SurfaceGui", paint) sg.Face = Enum.NormalId.Top
    local text = Instance.new("TextLabel", sg) text.Size = UDim2.new(1,0,1,0) text.BackgroundTransparency = 1 text.Text = "AAR0N4IK" text.TextColor3 = Color3.fromRGB(255,0,0) text.Font = Enum.Font.GothamBlack text.TextScaled = true text.TextStrokeTransparency = 0.7
end)

local C = {
    bg = Color3.fromRGB(15,10,20), bg2 = Color3.fromRGB(25,15,35),
    a = Color3.fromRGB(168,85,247), a2 = Color3.fromRGB(236,72,153),
    t = Color3.fromRGB(255,255,255), r = Color3.fromRGB(255,60,60),
    b = Color3.fromRGB(60,150,255), g = Color3.fromRGB(60,220,100)
}

local function clk(b,f) 
    b.MouseButton1Click:Connect(function() pcall(f) end) 
    b.TouchTap:Connect(function() pcall(f) end) 
end

-- ГЛАВНОЕ ОКНО
local gui = Instance.new("ScreenGui", pg)
gui.Name = "AAR0N_Huge" gui.ResetOnSpawn = false gui.DisplayOrder = 100

-- Кнопка "А"
local aBtn = Instance.new("TextButton", gui)
aBtn.Size = UDim2.fromOffset(60,60) aBtn.Position = UDim2.new(0.5,0,0.5,0) aBtn.AnchorPoint = Vector2.new(0.5,0.5)
aBtn.BackgroundColor3 = C.a aBtn.Text = "A" aBtn.TextColor3 = C.t aBtn.Font = Enum.Font.GothamBlack aBtn.TextSize = 28 aBtn.Visible = false
Instance.new("UICorner", aBtn).CornerRadius = UDim.new(0,30)

-- Основное окно
local m = Instance.new("Frame", gui)
m.Size = UDim2.new(0.9, 0, 0.8, 0) m.Position = UDim2.new(0.5, 0, 0.5, 0) m.AnchorPoint = Vector2.new(0.5,0.5)
m.BackgroundColor3 = C.bg Instance.new("UICorner", m).CornerRadius = UDim.new(0,12) Instance.new("UIStroke", m).Color = C.a

-- Заголовок
local t = Instance.new("Frame", m) t.Size = UDim2.new(1,0,0,40) t.BackgroundColor3 = C.bg2 Instance.new("UICorner", t).CornerRadius = UDim.new(0,12) t.Parent = m
local ti = Instance.new("TextLabel", t) ti.Size = UDim2.new(1,-40,1,0) ti.BackgroundTransparency = 1 ti.Text = "EXCLUSIVE AAR0N4IK | HUGE" ti.TextColor3 = C.a ti.Font = Enum.Font.GothamBlack ti.TextSize = 15 ti.Parent = t
local c = Instance.new("TextButton", t) c.Size = UDim2.fromOffset(30,30) c.Position = UDim2.new(1,-35,0.5,-15) c.BackgroundColor3 = C.r c.Text = "×" c.TextColor3 = C.t c.Font = Enum.Font.GothamBold c.TextSize = 20 Instance.new("UICorner", c).CornerRadius = UDim.new(0,6) c.Parent = t
clk(c, function() m.Visible = false aBtn.Visible = true end)
clk(aBtn, function() m.Visible = true aBtn.Visible = false end)

-- Боковая панель (Вкладки)
local side = Instance.new("Frame", m) side.Size = UDim2.new(0.25,-5,1,-45) side.Position = UDim2.new(0,5,0,45) side.BackgroundTransparency = 1 side.Parent = m
Instance.new("UIListLayout", side).Padding = UDim.new(0,6)

-- Контент (Сюда загружаются кнопки)
local cont = Instance.new("Frame", m) cont.Size = UDim2.new(0.75,-5,1,-55) cont.Position = UDim2.new(0.25,0,0,50) cont.BackgroundTransparency = 1 cont.Parent = m

-- ПЕРЕМЕННЫЕ СОСТОЯНИЙ
local S = {
    fly=false, noclip=false, esp=false, hitbox=false, nameesp=false,
    aura=false, aim=false, autoKill=false, dodge=false, agun=false,
    antiFling=false, spin=false, speed=50
}
local currentPage = nil

-- ФУНКЦИЯ ПЕРЕКЛЮЧЕНИЯ ВКЛАДОК (Ленивая загрузка)
local function switchTab(tabName)
    if currentPage then currentPage:Destroy() end
    currentPage = Instance.new("ScrollingFrame", cont)
    currentPage.Size = UDim2.new(1,0,1,0) currentPage.BackgroundTransparency = 1
    currentPage.ScrollBarThickness = 3 currentPage.CanvasSize = UDim2.new() currentPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Instance.new("UIListLayout", currentPage).Padding = UDim.new(0,4)

    local function mkTog(tx,cb)
        local f=Instance.new("Frame",currentPage) f.Size=UDim2.new(1,-5,0,32) f.BackgroundColor3=C.bg2 Instance.new("UICorner",f).CornerRadius=UDim.new(0,8)
        local ll=Instance.new("TextLabel",f) ll.Size=UDim2.new(1,-50,1,0) ll.Position=UDim2.new(0,10,0,0) ll.BackgroundTransparency=1 ll.Text=tx ll.TextColor3=C.t ll.Font=Enum.Font.Gotham ll.TextSize=12 ll.TextXAlignment=Enum.TextXAlignment.Left ll.Parent=f
        local bg=Instance.new("Frame",f) bg.Size=UDim2.fromOffset(34,16) bg.Position=UDim2.new(1,-44,0.5,-8) bg.BackgroundColor3=C.bg Instance.new("UICorner",bg).CornerRadius=UDim.new(0,8) bg.Parent=f
        local kn=Instance.new("Frame",bg) kn.Size=UDim2.fromOffset(12,12) kn.Position=UDim2.fromOffset(2,2) kn.BackgroundColor3=C.t Instance.new("UICorner",kn).CornerRadius=UDim.new(0,6) kn.Parent=bg
        local st=false local bt=Instance.new("TextButton",f) bt.Size=UDim2.fromScale(1,1) bt.BackgroundTransparency=1 bt.Text="" bt.Parent=f
        clk(bt,function() st=not st bg.BackgroundColor3=st and C.a or C.bg kn.Position=st and UDim2.new(1,-14,0.5,-6) or UDim2.fromOffset(2,2) if cb then cb(st) end end)
    end
    local function mkBtn(tx,cb)
        local b=Instance.new("TextButton",currentPage) b.Size=UDim2.new(1,-5,0,32) b.BackgroundColor3=C.bg2 b.Text=tx b.TextColor3=C.a b.Font=Enum.Font.GothamBold b.TextSize=12 Instance.new("UICorner",b).CornerRadius=UDim.new(0,8) clk(b,cb)
    end
    local function mkBox(ph,cb)
        local b=Instance.new("TextBox",currentPage) b.Size=UDim2.new(1,-5,0,32) b.BackgroundColor3=C.bg2 b.PlaceholderText=ph b.PlaceholderColor3=C.t b.TextColor3=C.t b.Font=Enum.Font.Gotham b.TextSize=12 b.Text="" Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)
        b.FocusLost:Connect(function(e) if e and tonumber(b.Text) then cb(tonumber(b.Text)) end end)
    end

    if tabName == "Main" then
        mkBtn("🛑 СТОП (Сброс)", function() if plr.Character then local h=plr.Character:FindFirstChildOfClass("Humanoid") local hrp=plr.Character:FindFirstChild("HumanoidRootPart") if h then h.PlatformStand=false end if hrp then hrp.Velocity=Vector3.zero hrp.AngularVelocity=Vector3.zero end S.fly=false S.spin=false end end)
        mkTog("Noclip", function(v) S.noclip=v end) mkTog("Fly", function(v) S.fly=v end)
        mkBox("Скорость полета", function(v) S.speed=v end) mkBox("Скорость ходьбы", function(v) if plr.Character then plr.Character.Humanoid.WalkSpeed=v end end) mkBox("Прыжок", function(v) if plr.Character then plr.Character.Humanoid.UseJumpPower=true plr.Character.Humanoid.JumpPower=v end end)
    elseif tabName == "Visual" then
        mkTog("See Roles (ESP)", function(v) S.esp=v end) mkTog("Name ESP", function(v) S.nameesp=v end) mkTog("Hitbox Expander", function(v) S.hitbox=v end) mkTog("Fullbright", function(v) L.Ambient=v and Color3.new(1,1,1) or Color3.new(0.5,0.5,0.5) end)
    elseif tabName == "Combat" then
        mkTog("Melee Aura", function(v) S.aura=v end) mkTog("Silent Aim", function(v) S.aim=v end) mkTog("Auto-Kill", function(v) S.autoKill=v end) mkTog("Auto-Dodge", function(v) S.dodge=v end) mkTog("Auto Dropped Gun", function(v) S.agun=v end)
    elseif tabName == "Players" then
        -- Создаем список игроков вручную, чтобы не было лагов
        for _, p in ipairs(P:GetPlayers()) do
            if p ~= plr then
                local f = Instance.new("Frame", currentPage) f.Size = UDim2.new(1,-5,0,32) f.BackgroundColor3 = C.bg2 Instance.new("UICorner",f).CornerRadius = UDim.new(0,6)
                local l = Instance.new("TextLabel", f) l.Size = UDim2.new(0.5,0,1,0) l.Position = UDim2.fromOffset(5,0) l.BackgroundTransparency = 1 l.Text = p.Name l.TextColor3 = C.t l.Font = Enum.Font.Gotham l.TextSize = 11 l.TextXAlignment = Enum.TextXAlignment.Left l.Parent = f
                local tp = Instance.new("TextButton", f) tp.Size = UDim2.new(0.2,0,0.7,0) tp.Position = UDim2.new(0.55,0,0.15,0) tp.BackgroundColor3 = C.a tp.Text = "TP" tp.TextColor3 = C.t tp.Font = Enum.Font.GothamBold tp.TextSize = 10 Instance.new("UICorner",tp).CornerRadius = UDim.new(0,4) tp.Parent = f
                clk(tp, function() if p.Character and plr.Character then plr.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3) end end)
                local fl = Instance.new("TextButton", f) fl.Size = UDim2.new(0.2,0,0.7,0) fl.Position = UDim2.new(0.77,0,0.15,0) fl.BackgroundColor3 = C.r fl.Text = "Fling" fl.TextColor3 = C.t fl.Font = Enum.Font.GothamBold fl.TextSize = 10 Instance.new("UICorner",fl).CornerRadius = UDim.new(0,4) fl.Parent = f
                clk(fl, function() if p.Character then local h=p.Character:FindFirstChild("HumanoidRootPart") if h then local b=Instance.new("BodyAngularVelocity",h) b.AngularVelocity=Vector3.new(99999,99999,99999) b.MaxTorque=Vector3.new(math.huge,math.huge,math.huge) task.delay(1,function() b:Destroy() end) end end end)
            end
        end
    elseif tabName == "Emotes" then
        local function playAnim(id) local c=plr.Character if c and c:FindFirstChildOfClass("Humanoid") then local aa=Instance.new("Animation") aa.AnimationId="rbxassetid://"..tostring(id) local an=c.Humanoid:FindFirstChildOfClass("Animator") if an then an:LoadAnimation(aa):Play() end end end
        mkBtn("Floss", function() playAnim(5915694204) end) mkBtn("Dab", function() playAnim(2482632600) end) mkBtn("Orange Justice", function() playAnim(3264923498) end)
        mkBtn("Default Dance", function() playAnim(507771019) end) mkBtn("Gangnam Style", function() playAnim(4341064546) end) mkBtn("Macarena", function() playAnim(1286874805) end)
        mkBtn("Russian Dance", function() playAnim(7823163342) end) mkBtn("Zombie Walk", function() playAnim(616163682) end) mkBtn("Levitate", function() playAnim(3132104140) end)
    elseif tabName == "Exclusive" then
        mkBtn("Mass Freeze", function() for _, p in ipairs(P:GetPlayers()) do if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then p.Character.HumanoidRootPart.Anchored = true end end end)
        mkBtn("Mass Unfreeze", function() for _, p in ipairs(P:GetPlayers()) do if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then p.Character.HumanoidRootPart.Anchored = false end end end)
        mkBtn("Mass Void", function() for _, p in ipairs(P:GetPlayers()) do if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then p.Character.HumanoidRootPart.CFrame = CFrame.new(0,-500,0) end end end)
        mkBtn("Earthquake", function() local cam = W.CurrentCamera task.spawn(function() for i=1,50 do cam.CFrame = cam.CFrame * CFrame.Angles(math.random(-10,10)/100, math.random(-10,10)/100, math.random(-10,10)/100) task.wait(0.05) end end) end)
        mkBtn("Rain Coins", function() for i=1,20 do task.spawn(function() local coin=Instance.new("Part",W) coin.Size=Vector3.new(2,2,2) coin.Position=plr.Character.HumanoidRootPart.Position+Vector3.new(math.random(-20,20),50,math.random(-20,20)) coin.Color=Color3.new(1,1,0) coin.Material=Enum.Material.Neon task.wait(5) coin:Destroy() end) end end)
    elseif tabName == "Misc" then
        mkBtn("Server Hop", function() local ok,d=pcall(function() return HS:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?limit=100")) end) if ok and d and d.data then for _,v in ipairs(d.data) do if v.playing<v.maxPlayers and v.id~=game.JobId then TS:TeleportToPlaceInstance(game.PlaceId,v.id,plr) return end end end end)
        mkBtn("Rejoin", function() TS:Teleport(game.PlaceId, plr) end)
        mkBtn("Destroy UI", function() gui:Destroy() end)
    end
end

-- Создание кнопок вкладок
local function mkT(n) 
    local b=Instance.new("TextButton",side) b.Size=UDim2.new(1,-10,0,32) b.BackgroundColor3=C.bg2 b.Text=n b.TextColor3=C.t b.Font=Enum.Font.GothamBold b.TextSize=12 Instance.new("UICorner",b).CornerRadius=UDim.new(0,8) 
    clk(b,function() 
        for _,x in ipairs(side:GetChildren()) do if x:IsA("TextButton") then x.BackgroundColor3=C.bg2 end end 
        b.BackgroundColor3=C.a 
        switchTab(n) 
    end) 
end
mkT("Main") mkT("Visual") mkT("Combat") mkT("Players") mkT("Emotes") mkT("Exclusive") mkT("Misc")

switchTab("Main") -- Открываем главную при запуске

-- ЕДИНЫЙ ЦИКЛ (ОПТИМИЗАЦИЯ)
local et=0
RS.Heartbeat:Connect(function(dt)
    pcall(function()
        local ch=plr.Character if not ch then return end
        local hrp=ch:FindFirstChild("HumanoidRootPart") local hum=ch:FindFirstChildOfClass("Humanoid") if not hrp or not hum then return end
        
        if S.noclip then for _,v in pairs(ch:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end
        if S.fly then
            hum.PlatformStand=true
            local bv=hrp:FindFirstChildOfClass("BodyVelocity")
            if not bv then bv=Instance.new("BodyVelocity",hrp) bv.MaxForce=Vector3.new(1e5,1e5,1e5) end
            if hum.MoveDirection.Magnitude>0 then bv.Velocity=hum.MoveDirection*S.speed else bv.Velocity=Vector3.zero end
        elseif not S.fly and hum.PlatformStand then
            hum.PlatformStand=false
            local bv=hrp:FindFirstChildOfClass("BodyVelocity") if bv then bv:Destroy() end
        end
        if S.aura then local k=ch:FindFirstChild("Knife") if k then for _,v in ipairs(P:GetPlayers()) do if v~=plr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then if(v.Character.HumanoidRootPart.Position-hrp.Position).Magnitude<15 then k:Activate() end end end end end
        if S.aim then local mm=nil for _,v in ipairs(P:GetPlayers()) do if v~=plr and v.Character then local bp=v:FindFirstChild("Backpack") if bp and bp:FindFirstChild("Knife") then mm=v break end end end if mm then W.CurrentCamera.CFrame=CFrame.lookAt(W.CurrentCamera.CFrame.Position,mm.Character.HumanoidRootPart.Position) end end
        if S.autoKill then local k=ch:FindFirstChild("Knife") if k then for _,v in ipairs(P:GetPlayers()) do if v~=plr and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then hrp.CFrame=v.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,1) k:Activate() end end end end
        if S.dodge then local mm=nil for _,v in ipairs(P:GetPlayers()) do if v~=plr and v.Character then local bp=v:FindFirstChild("Backpack") if bp and bp:FindFirstChild("Knife") then mm=v break end end end if mm and mm.Character and mm.Character:FindFirstChild("HumanoidRootPart") then if(mm.Character.HumanoidRootPart.Position-hrp.Position).Magnitude<20 then hum.Jump=true end end end
        if S.agun then local bp=plr:FindFirstChild("Backpack") if not ch:FindFirstChild("Gun") and not(bp and bp:FindFirstChild("Gun")) then for _,v in ipairs(W:GetDescendants()) do if v.Name=="Gun" and (v:IsA("BasePart") or (v:IsA("Tool") and v:FindFirstChild("Handle"))) then hrp.CFrame=v:IsA("BasePart") and v.CFrame or v.Handle.CFrame break end end end end
        if S.antiFling then hrp.CustomPhysicalProperties=PhysicalProperties.new(0.01,0,0,0,0) if hrp.Velocity.Magnitude>100 then hrp.Velocity=Vector3.zero end end
        if S.hitbox then for _,v in ipairs(P:GetPlayers()) do if v~=plr and v.Character then for _,b in ipairs(v.Character:GetDescendants()) do if b:IsA("BasePart") then b.Size=Vector3.new(10,10,10) end end end end end
        
        et=et+dt
        if et>=1 then
            et=0
            for _,v in ipairs(P:GetPlayers()) do
                if v~=plr and v.Character then
                    local hl=v.Character:FindFirstChild("HL")
                    if S.esp then 
                        if not hl then hl=Instance.new("Highlight",v.Character) hl.Name="HL" hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop end 
                        local bp=v:FindFirstChild("Backpack")
                        if bp and bp:FindFirstChild("Knife") then hl.FillColor=C.r elseif bp and bp:FindFirstChild("Gun") then hl.FillColor=C.b else hl.FillColor=C.g end 
                    elseif hl then hl:Destroy() end
                end
            end
        end
    end)
end)

game:GetService("StarterGui"):SetCore("SendNotification",{Title="AAR0N4IK",Text="HUGE EDITION загружено!",Duration=5})
