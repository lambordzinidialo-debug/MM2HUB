local P=game:GetService("Players")local U=game:GetService("UserInputService")local T=game:GetService("TweenService")local L=game:GetService("Lighting")local W=game:GetService("Workspace")local RS=game:GetService("RunService")local VU=game:GetService("VirtualUser")local TS=game:GetService("TeleportService")local HS=game:GetService("HttpService")local plr=P.LocalPlayer

pcall(function()local o=plr.PlayerGui:FindFirstChild("AAR0N4IK_Overdrive")if o then o:Destroy()end end)
local C={bg=Color3.fromRGB(15,15,20),bg2=Color3.fromRGB(22,22,30),bg3=Color3.fromRGB(35,35,45),a=Color3.fromRGB(145,65,225),a2=Color3.fromRGB(190,120,255),t=Color3.fromRGB(255,255,255),sub=Color3.fromRGB(150,150,160),r=Color3.fromRGB(255,60,60),b=Color3.fromRGB(60,150,255),g=Color3.fromRGB(60,220,100)}

local gui=Instance.new("ScreenGui")
gui.Name="AAR0N4IK_Overdrive"
gui.ResetOnSpawn=false
gui.DisplayOrder=10
gui.Parent=plr:WaitForChild("PlayerGui")

-- Главное окно (Огромное, по центру)
local main=Instance.new("Frame",gui)
main.Size=UDim2.new(0.85, 0, 0.75, 0) -- 85% ширины и 75% высоты
main.Position=UDim2.new(0.5, 0, 0.5, 0) -- Ровно по центру
main.AnchorPoint=Vector2.new(0.5, 0.5)
main.BackgroundColor3=C.bg
main.BorderSizePixel=0
Instance.new("UICorner",main).CornerRadius=UDim.new(0,10)

-- Заголовок
local topbar=Instance.new("Frame",main)
topbar.Size=UDim2.new(1,0,0,35)
topbar.BackgroundColor3=C.bg2
topbar.BorderSizePixel=0
Instance.new("UICorner",topbar).CornerRadius=UDim.new(0,10)
topbar.Parent=main
local title=Instance.new("TextLabel",topbar)
title.Size=UDim2.new(1,-40,1,0)
title.BackgroundTransparency=1
title.Text="AAR0N4IK | Overdrive"
title.TextColor3=C.a2
title.Font=Enum.Font.GothamBold
title.TextSize=15
title.Parent=topbar

-- Кнопка закрытия (Крестик)
local closeBtn=Instance.new("TextButton",topbar)
closeBtn.Size=UDim2.fromOffset(35,35)
closeBtn.Position=UDim2.new(1,-35,0,0)
closeBtn.BackgroundColor3=C.r
closeBtn.Text="×"
closeBtn.TextColor3=C.t
closeBtn.Font=Enum.Font.GothamBold
closeBtn.TextSize=22
closeBtn.AutoButtonColor=false
Instance.new("UICorner",closeBtn).CornerRadius=UDim.new(0,6)
closeBtn.Parent=topbar

-- Кнопка "А" (Появляется когда меню закрыто, ровно по центру)
local aBtn=Instance.new("TextButton",gui)
aBtn.Size=UDim2.fromOffset(60,60)
aBtn.Position=UDim2.new(0.5,0,0.5,0)
aBtn.AnchorPoint=Vector2.new(0.5,0.5)
aBtn.BackgroundColor3=C.a
aBtn.Text="A"
aBtn.TextColor3=C.t
aBtn.Font=Enum.Font.GothamBlack
aBtn.TextSize=28
aBtn.AutoButtonColor=false
aBtn.Visible=false
Instance.new("UICorner",aBtn).CornerRadius=UDim.new(0,30)

-- ЛОГИКА ОТКРЫТИЯ/ЗАКРЫТИЯ
closeBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    aBtn.Visible = true
end)

aBtn.MouseButton1Click:Connect(function()
    main.Visible = true
    aBtn.Visible = false
end)

-- Боковая панель (Вкладки)
local sidebar=Instance.new("Frame",main)
sidebar.Size=UDim2.new(0,110,1,-40)
sidebar.Position=UDim2.new(0,5,0,40)
sidebar.BackgroundTransparency=1
sidebar.Parent=main
local sLayout=Instance.new("UIListLayout",sidebar)
sLayout.Padding=UDim.new(0,5)

-- Контент
local content=Instance.new("Frame",main)
content.Size=UDim2.new(1,-125,1,-50)
content.Position=UDim2.new(0,120,0,45)
content.BackgroundTransparency=1
content.Parent=main

local tabs={}
local function createTab(name, icon)
    local b=Instance.new("TextButton",sidebar)
    b.Size=UDim2.new(1,0,0,32)
    b.BackgroundColor3=C.bg2
    b.Text=icon.." "..name
    b.TextColor3=C.sub
    b.Font=Enum.Font.GothamBold
    b.TextSize=13
    b.AutoButtonColor=false
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
    
    local p=Instance.new("ScrollingFrame",content)
    p.Size=UDim2.new(1,0,1,0)
    p.BackgroundTransparency=1
    p.ScrollBarThickness=3
    p.ScrollBarImageColor3=C.a
    p.CanvasSize=UDim2.new()
    p.AutomaticCanvasSize=Enum.AutomaticSize.Y
    p.Visible=false
    local pLayout=Instance.new("UIListLayout",p)
    pLayout.Padding=UDim.new(0,5)
    
    table.insert(tabs,{b=b,p=p})
    b.MouseButton1Click:Connect(function()
        for _,x in ipairs(tabs)do x.p.Visible=false x.b.BackgroundColor3=C.bg2 x.b.TextColor3=C.sub end
        p.Visible=true b.BackgroundColor3=C.bg3 b.TextColor3=C.t
    end)
    if #tabs==1 then p.Visible=true b.BackgroundColor3=C.bg3 b.TextColor3=C.t end
    return p
end

local function createToggle(parent, text, default, callback)
    local f=Instance.new("Frame",parent)
    f.Size=UDim2.new(1,-5,0,36)
    f.BackgroundColor3=C.bg2
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)
    local lbl=Instance.new("TextLabel",f)
    lbl.Size=UDim2.new(1,-50,1,0)
    lbl.Position=UDim2.new(0,10,0,0)
    lbl.BackgroundTransparency=1
    lbl.Text=text
    lbl.TextColor3=C.t
    lbl.Font=Enum.Font.GothamMedium
    lbl.TextSize=13
    lbl.TextXAlignment=Enum.TextXAlignment.Left
    lbl.Parent=f
    local bg=Instance.new("Frame",f)
    bg.Size=UDim2.fromOffset(40,20)
    bg.Position=UDim2.new(1,-50,0.5,-10)
    bg.BackgroundColor3=default and C.a or C.bg3
    Instance.new("UICorner",bg).CornerRadius=UDim.new(0,10)
    bg.Parent=f
    local kn=Instance.new("Frame",bg)
    kn.Size=UDim2.fromOffset(16,16)
    kn.Position=default and UDim2.new(1,-18,0.5,-8) or UDim2.fromOffset(2,2)
    kn.BackgroundColor3=C.t
    Instance.new("UICorner",kn).CornerRadius=UDim.new(0,8)
    kn.Parent=bg
    local state=default
    local btn=Instance.new("TextButton",f)
    btn.Size=UDim2.fromScale(1,1)
    btn.BackgroundTransparency=1
    btn.Text=""
    btn.Parent=f
    btn.MouseButton1Click:Connect(function()
        state=not state
        T:Create(bg,T.new(0.15),{BackgroundColor3=state and C.a or C.bg3}):Play()
        T:Create(kn,T.new(0.15),{Position=state and UDim2.new(1,-18,0.5,-8) or UDim2.fromOffset(2,2)}):Play()
        if callback then callback(state) end
    end)
end

local function createButton(parent, text, callback)
    local b=Instance.new("TextButton",parent)
    b.Size=UDim2.new(1,-5,0,36)
    b.BackgroundColor3=C.bg2
    b.Text=text
    b.TextColor3=C.a2
    b.Font=Enum.Font.GothamBold
    b.TextSize=13
    b.AutoButtonColor=false
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
    b.MouseButton1Click:Connect(function() if callback then callback() end end)
end

-- БАЗА
local function role(p)if not p or not p.Character then return"Innocent"end local bp=p:FindFirstChild("Backpack")if bp then if bp:FindFirstChild("Knife")then return"Murderer"end if bp:FindFirstChild("Gun")then return"Sheriff"end end local c=p.Character if c:FindFirstChild("Knife")then return"Murderer"end if c:FindFirstChild("Gun")then return"Sheriff"end return"Innocent"end
local function fm()for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character and role(p)=="Murderer"then return p end end end

local t1=createTab("Main","🏃")
local t2=createTab("Visual","👁")
local t3=createTab("Combat","⚔️")
local t4=createTab("Players","👥")
local t5=createTab("Troll","🎮")
local t6=createTab("Misc","🌐")

-- MAIN
local noclip=false; RS.Stepped:Connect(function() if noclip and plr.Character then for _,v in pairs(plr.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end)
local af=false; plr.Idled:Connect(function() if af then VU:CaptureController(); VU:ClickButton2(Vector2.new()) end end)
local autoFarm=false
task.spawn(function()
    while task.wait(0.5) do
        if autoFarm and plr.Character then
            local hrp=plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _,v in ipairs(W:GetDescendants()) do
                    if v:IsA("BasePart") and v.Name:lower():find("coin") then hrp.CFrame=v.CFrame end
                end
            end
        end
    end
end)
createToggle(t1,"Noclip",false,function(s)noclip=s end)
createToggle(t1,"Anti-AFK",false,function(s)af=s end)
createToggle(t1,"Auto Farm Coins",false,function(s)autoFarm=s end)
createButton(t1,"Speed 100",function() if plr.Character then plr.Character.Humanoid.WalkSpeed=100 end end)

-- VISUAL
local esp=false; local function aE()for _,p in ipairs(P:GetPlayers())do if p.Character then local o=p.Character:FindFirstChild("AAR0N_ESP")if o then o:Destroy()end end end if not esp then return end for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character then local h=Instance.new("Highlight")h.Name="AAR0N_ESP"h.Adornee=p.Character h.FillTransparency=0.5 h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop local r=role(p)if r=="Murderer"then h.FillColor=C.r elseif r=="Sheriff"then h.FillColor=C.b else h.FillColor=C.g end h.Parent=p.Character end end end task.spawn(function()while task.wait(1)do if esp then aE()end end end)
local hbExp=false; RS.Heartbeat:Connect(function() if hbExp then for _,p in ipairs(P:GetPlayers()) do if p~=plr and p.Character then for _,v in ipairs(p.Character:GetDescendants()) do if v:IsA("BasePart") then v.Size=Vector3.new(10,10,10) end end end end end end)
createToggle(t2,"Player ESP",false,function(s)esp=s; aE() end)
createToggle(t2,"Hitbox Expander",false,function(s)hbExp=s end)

-- COMBAT
local ka=false; task.spawn(function()while task.wait(0.1)do if ka then local c=plr.Character local k=c and c:FindFirstChild("Knife")if k then for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then if(p.Character.HumanoidRootPart.Position-c.HumanoidRootPart.Position).Magnitude<15 then pcall(function()k:Activate()end)end end end end end end end)
local silentAim=false; RS.RenderStepped:Connect(function() if silentAim then local m=fm() if m and m.Character and m.Character:FindFirstChild("HumanoidRootPart") then W.CurrentCamera.CFrame=CFrame.lookAt(W.CurrentCamera.CFrame.Position, m.Character.HumanoidRootPart.Position) end end end)
local autoKill=false; task.spawn(function() while task.wait(0.2) do if autoKill then local c=plr.Character local k=c and c:FindFirstChild("Knife") if k then for _,p in ipairs(P:GetPlayers()) do if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then c.HumanoidRootPart.CFrame=p.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,1) k:Activate() end end end end end end)
createToggle(t3,"Melee Aura",false,function(s)ka=s end)
createToggle(t3,"Silent Aim (Шериф)",false,function(s)silentAim=s end)
createToggle(t3,"Auto-Kill (Маньяк)",false,function(s)autoKill=s end)
createButton(t3,"Gun Drop (Сброс)",function() local g=plr.Character:FindFirstChild("Gun") if g then g.Parent=W end end)

-- PLAYERS
local function flingPlayer(target)if target and target.Character and plr.Character then local hrp = target.Character:FindFirstChild("HumanoidRootPart")if hrp then local bv = Instance.new("BodyAngularVelocity", hrp)bv.AngularVelocity = Vector3.new(99999, 99999, 99999)bv.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)task.delay(1, function() bv:Destroy() end)end end end
local function updatePlayerList()
    for _, child in ipairs(t4:GetChildren()) do if child:IsA("Frame") then child:Destroy() end end
    for _, p in ipairs(P:GetPlayers()) do
        if p ~= plr then
            local pf = Instance.new("Frame", t4)
            pf.Size = UDim2.new(1, -5, 0, 38) pf.BackgroundColor3 = C.bg2 Instance.new("UICorner", pf).CornerRadius = UDim.new(0, 6)
            local nl = Instance.new("TextLabel", pf) nl.Size = UDim2.new(0.5, 0, 1, 0) nl.Position = UDim2.new(0, 10, 0, 0) nl.BackgroundTransparency = 1 nl.Text = p.Name nl.TextColor3 = C.t nl.Font = Enum.Font.GothamMedium nl.TextSize = 13 nl.TextXAlignment = Enum.TextXAlignment.Left nl.Parent = pf
            local tpBtn = Instance.new("TextButton", pf) tpBtn.Size = UDim2.new(0.2, 0, 0.7, 0) tpBtn.Position = UDim2.new(0.55, 0, 0.15, 0) tpBtn.BackgroundColor3 = C.a tpBtn.Text = "TP" tpBtn.TextColor3 = C.t tpBtn.Font = Enum.Font.GothamBold tpBtn.TextSize = 12 Instance.new("UICorner", tpBtn).CornerRadius = UDim.new(0, 4)
            tpBtn.MouseButton1Click:Connect(function() if p.Character and plr.Character then plr.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3) end end) tpBtn.Parent = pf
            local flingBtn = Instance.new("TextButton", pf) flingBtn.Size = UDim2.new(0.2, 0, 0.7, 0) flingBtn.Position = UDim2.new(0.78, 0, 0.15, 0) flingBtn.BackgroundColor3 = C.r flingBtn.Text = "Fling" flingBtn.TextColor3 = C.t flingBtn.Font = Enum.Font.GothamBold flingBtn.TextSize = 12 Instance.new("UICorner", flingBtn).CornerRadius = UDim.new(0, 4)
            flingBtn.MouseButton1Click:Connect(function() flingPlayer(p) end) flingBtn.Parent = pf
        end
    end
end
updatePlayerList() task.spawn(function() while task.wait(5) do updatePlayerList() end end)

-- TROLL
local ride = false
local rideConn
createToggle(t5, "Piggyback (На плечах)", false, function(s)
    ride = s
    if s then
        rideConn = RS.Heartbeat:Connect(function()
            if not ride then return end
            local c = plr.Character if not c then return end
            local m = fm() if not m then m = P:GetPlayers()[math.random(1, #P:GetPlayers())] end
            if m and m ~= plr and m.Character and m.Character:FindFirstChild("HumanoidRootPart") then
                c.HumanoidRootPart.CFrame = m.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2.5, 0)
                c.HumanoidRootPart.Velocity = m.Character.HumanoidRootPart.Velocity
            end
        end)
    else
        if rideConn then rideConn:Disconnect() end
    end
end)

-- MISC
local antiFling = false
RS.Heartbeat:Connect(function()
    if antiFling and plr.Character then
        local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0, 0, 0)
            if hrp.Velocity.Magnitude > 100 then hrp.Velocity = Vector3.new(0, 0, 0) end
        end
    end
end)
createToggle(t6,"Anti-Fling",false,function(s)antiFling=s end)
createButton(t6,"Fling All (Троллинг)",function() for _,p in ipairs(P:GetPlayers()) do if p~=plr then flingPlayer(p) end end end)
createButton(t6,"Server Hop",function()local ok,d=pcall(function()return HS:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?limit=100"))end)if ok and d and d.data then for _,s in ipairs(d.data)do if s.playing<s.maxPlayers and s.id~=game.JobId then pcall(function()TS:TeleportToPlaceInstance(game.PlaceId,s.id,plr)end)return end end end end)

-- Перетаскивание (теперь с учетом центрирования)
local drag=false local startPos, startWinPos
topbar.InputBegan:Connect(function(i) 
    if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then 
        drag=true 
        startPos=i.Position 
        startWinPos=main.Position 
    end 
end)
U.InputChanged:Connect(function(i) 
    if drag and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then 
        local d=i.Position-startPos 
        -- Так как AnchorPoint 0.5, мы двигаем Offset относительно центра
        main.Position=UDim2.new(startWinPos.X.Scale, startWinPos.X.Offset + d.X, startWinPos.Y.Scale, startWinPos.Y.Offset + d.Y) 
    end 
end)
U.InputEnded:Connect(function(i) 
    if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end 
end)

pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="AAR0N4IK",Text="Увеличенное меню загружено!",Duration=5})end)
