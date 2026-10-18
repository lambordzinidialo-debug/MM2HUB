-- AAR0N4IK MEGA HUB | БЕЗ КНОПОК (Чат-управление)
local P=game:GetService("Players")local U=game:GetService("UserInputService")local T=game:GetService("TweenService")local L=game:GetService("Lighting")local W=game:GetService("Workspace")local CG=game:GetService("CoreGui")local TS=game:GetService("TeleportService")local HS=game:GetService("HttpService")local VU=game:GetService("VirtualUser")local RS=game:GetService("RunService")local plr=P.LocalPlayer
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="AAR0N4IK",Text="Меню открыто! В чат: /close или /open",Duration=5})end)
local C={bg=Color3.fromRGB(10,5,20),bg2=Color3.fromRGB(22,12,40),bg3=Color3.fromRGB(40,20,65),a=Color3.fromRGB(168,85,247),a2=Color3.fromRGB(236,72,153),t=Color3.fromRGB(245,235,255),sub=Color3.fromRGB(170,160,190),r=Color3.fromRGB(255,60,60),b=Color3.fromRGB(60,150,255),g=Color3.fromRGB(60,220,100)}
pcall(function()for _,n in ipairs({"AAR0N4IK_Hub","AAR0N4IK_Track"})do local o=CG:FindFirstChild(n)if o then o:Destroy()end end end)
local function N(c,p)local o=Instance.new(c)for k,v in pairs(p)do o[k]=v end return o end
local function cr(p,r)N("UICorner",{CornerRadius=UDim2.new(0,r or 8),Parent=p})end
local function st(p,c,t,tr)N("UIStroke",{Color=c or C.bg3,Thickness=t or 1,Transparency=tr or 0.5,Parent=p})end
local function grad(p,c1,c2,rot)N("UIGradient",{Color=ColorSequence.new(c1,c2),Rotation=rot or 90,Parent=p})end
local vp=W.CurrentCamera.ViewportSize local SW=math.min(vp.X-20,420)local SH=math.min(vp.Y-90,500)
local MAX_ORDER=2147483647

local gui=N("ScreenGui",{Name="AAR0N4IK_Hub",ResetOnSpawn=false,IgnoreGuiInset=true,DisplayOrder=MAX_ORDER})pcall(function()gui.Parent=CG end)if not gui.Parent then gui.Parent=plr:WaitForChild("PlayerGui")end

-- Окно (Сразу видимое)
local win=N("Frame",{Size=UDim2.fromOffset(SW,SH),Position=UDim2.new(0.5,-SW/2,0.5,-SH/2),BackgroundColor3=C.bg,BorderSizePixel=0,Visible=true,Parent=gui}) 
cr(win,16) st(win,C.a,1.5,0.2) grad(win,C.bg,C.bg2,135)
local th=N("Frame",{Size=UDim2.new(1,0,0,55),BackgroundColor3=C.bg2,BorderSizePixel=0,Parent=win}) 
cr(th,16) local thLine=N("Frame",{Size=UDim2.new(1,0,0,2),Position=UDim2.new(0,0,1,0),BackgroundColor3=C.a,Parent=th}) 
grad(thLine,C.a,C.a2,0)
N("TextLabel",{Size=UDim2.new(1,-100,1,0),Position=UDim2.fromOffset(20,0),BackgroundTransparency=1,Font=Enum.Font.GothamBlack,Text="AAR0N4IK",TextColor3=C.t,TextSize=18,TextXAlignment=Enum.TextXAlignment.Left,Parent=th})
N("TextLabel",{Size=UDim2.new(1,-100,1,0),Position=UDim2.fromOffset(130,2),BackgroundTransparency=1,Font=Enum.Font.GothamBlack,Text="MEGA",TextColor3=C.a2,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,Parent=th})

-- Скрыть/Показать (крестик)
local xb=N("TextButton",{Size=UDim2.fromOffset(35,35),Position=UDim2.new(1,-45,0.5,-17.5),BackgroundColor3=C.r,Text="×",Font=Enum.Font.GothamBold,TextSize=22,TextColor3=C.t,AutoButtonColor=false,Active=true,Parent=th}) 
cr(xb,8)
xb.MouseButton1Click:Connect(function() win.Visible=false end)

-- Перетаскивание окна
local dg,ds,dp=false,nil,nil 
th.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dg=true ds=i.Position dp=win.Position i.Changed:Connect(function()if i.UserInputState==Enum.UserInputState.End then dg=false end end)end end)
U.InputChanged:Connect(function(i)if dg and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then local d=i.Position-ds win.Position=UDim2.new(dp.X.Scale,dp.X.Offset+d.X,dp.Y.Scale,dp.Y.Offset+d.Y)end end)

-- Управление чатом
plr.Chatted:Connect(function(msg)
    local m = msg:lower()
    if m == "/open" or m == "/hub" then
        win.Visible = true
    elseif m == "/close" or m == "/hide" then
        win.Visible = false
    end
end)

-- Боковая панель
local tb=N("ScrollingFrame",{Size=UDim2.new(0,95,1,-55),Position=UDim2.fromOffset(0,55),BackgroundTransparency=1,ScrollBarThickness=0,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y,Parent=win})
N("UIListLayout",{Padding=UDim.new(0,6),HorizontalAlignment=Enum.HorizontalAlignment.Center,Parent=tb}) N("UIPadding",{PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0,10),Parent=tb})
local ct=N("ScrollingFrame",{Size=UDim2.new(1,-105,1,-65),Position=UDim2.fromOffset(100,60),BackgroundTransparency=1,ScrollBarThickness=4,ScrollBarImageColor3=C.a,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y,Parent=win})
N("UIListLayout",{Padding=UDim.new(0,6),Parent=ct}) N("UIPadding",{PaddingRight=UDim.new(0,10),PaddingBottom=UDim.new(0,15),Parent=ct})

local tabs={}
local function mTab(nm,icon)
    local b=N("TextButton",{Size=UDim2.new(1,0,0,40),BackgroundColor3=C.bg2,Text=icon.." "..nm,Font=Enum.Font.GothamBold,TextSize=12,TextColor3=C.sub,AutoButtonColor=false,Active=true,Parent=tb}) 
    cr(b,8) st(b,C.bg3,1,0.5) 
    local p=N("Frame",{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1,Visible=false,Parent=ct}) 
    N("UIListLayout",{Padding=UDim.new(0,6),Parent=p}) N("AutomaticSize",{Parent=p}) 
    table.insert(tabs,{b=b,p=p}) 
    local function switchTab()
        for _,x in ipairs(tabs)do x.p.Visible=false x.b.BackgroundColor3=C.bg2 x.b.TextColor3=C.sub local g=x.b:FindFirstChildOfClass("UIGradient") if g then g:Destroy() end end 
        p.Visible=true b.BackgroundColor3=C.bg3 b.TextColor3=C.t grad(b,C.a,C.a2,0) ct.CanvasPosition=Vector2.new()
    end 
    b.MouseButton1Click:Connect(switchTab)
    if #tabs==1 then switchTab() end 
    return p 
end

local function lab(pp,tx)N("TextLabel",{Size=UDim2.new(1,0,0,18),BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=11,TextColor3=C.a2,TextXAlignment=Enum.TextXAlignment.Left,Text=tx,Parent=pp,AutomaticSize=Enum.AutomaticSize.Y})end

local function tog(pp,tx,d,cb)
    local f=N("Frame",{Size=UDim2.new(1,0,0,40),BackgroundColor3=C.bg2,Parent=pp}) 
    cr(f,8) st(f,C.bg3,1,0.5) 
    N("TextLabel",{Size=UDim2.new(1,-60,1,0),Position=UDim2.fromOffset(12,0),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,TextSize=13,TextColor3=C.t,TextXAlignment=Enum.TextXAlignment.Left,Text=tx,Parent=f}) 
    local bg=N("Frame",{Size=UDim2.fromOffset(40,22),Position=UDim2.new(1,-50,0.5,-11),BackgroundColor3=C.bg3,Parent=f}) 
    cr(bg,11) st(bg,C.bg3,1,0.5) 
    local kn=N("Frame",{Size=UDim2.fromOffset(16,16),Position=d and UDim2.new(1,-18,0.5,-8) or UDim2.fromOffset(3,3),BackgroundColor3=C.t,Parent=bg}) 
    cr(kn,8) if d then grad(bg,C.a,C.a2,0) end 
    local s=d 
    local btn=N("TextButton",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text="",Active=true,Parent=f}) 
    btn.MouseButton1Click:Connect(function()
        s=not s 
        T:Create(bg,T.new(0.2),{BackgroundColor3=s and C.a or C.bg3}):Play() 
        T:Create(kn,T.new(0.2),{Position=s and UDim2.new(1,-18,0.5,-8) or UDim2.fromOffset(3,3)}):Play() 
        if s then grad(bg,C.a,C.a2,0) else local g=bg:FindFirstChildOfClass("UIGradient") if g then g:Destroy() end end 
        if cb then pcall(cb,s) end 
    end)
end

local function sl(pp,tx,mn,mx,d,cb)
    local f=N("Frame",{Size=UDim2.new(1,0,0,58),BackgroundColor3=C.bg2,Parent=pp}) 
    cr(f,8) st(f,C.bg3,1,0.5) 
    local lb=N("TextLabel",{Size=UDim2.new(1,-20,0,18),Position=UDim2.fromOffset(12,4),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,TextSize=13,TextColor3=C.t,TextXAlignment=Enum.TextXAlignment.Left,Text=tx..": "..d,Parent=f}) 
    local bar=N("Frame",{Size=UDim2.new(1,-24,0,5),Position=UDim2.new(0,12,1,-12),BackgroundColor3=C.bg3,Parent=f}) 
    cr(bar,2.5) local fl=N("Frame",{Size=UDim2.new((d-mn)/(mx-mn),0,1,0),BackgroundColor3=C.a,Parent=bar}) 
    cr(fl,2.5) grad(fl,C.a,C.a2,0) 
    local hb=N("TextButton",{Size=UDim2.new(1,24,0,40),Position=UDim2.new(0,-12,1,-37),BackgroundTransparency=1,Text="",Active=true,Parent=f}) 
    local drag=false 
    local function sv(x)
        local r=math.clamp((x-bar.AbsolutePosition.X)/math.max(bar.AbsoluteSize.X,1),0,1)
        local v=math.floor(mn+(mx-mn)*r+0.5) 
        T:Create(fl,T.new(0.1),{Size=UDim2.new(r,0,1,0)}):Play() lb.Text=tx..": "..v 
        if cb then pcall(cb,v)end 
    end 
    hb.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then drag=true sv(i.Position.X)end end) 
    U.InputChanged:Connect(function(i)if drag and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then sv(i.Position.X)end end) 
    U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then drag=false end end)
end

local function btn(pp,tx,cb)
    local b=N("TextButton",{Size=UDim2.new(1,0,0,40),BackgroundColor3=C.a,Font=Enum.Font.GothamBold,TextSize=13,TextColor3=Color3.new(1,1,1),Text=tx,AutoButtonColor=false,Active=true,Parent=pp}) 
    cr(b,8) grad(b,C.a,C.a2,0) 
    b.MouseButton1Click:Connect(function() if cb then pcall(cb) end end)
end

-- ФУНКЦИИ (Базовые)
local function role(p)if not p or not p.Character then return"Innocent"end local bp=p:FindFirstChild("Backpack")if bp then if bp:FindFirstChild("Knife")then return"Murderer"end if bp:FindFirstChild("Gun")then return"Sheriff"end end local c=p.Character if c:FindFirstChild("Knife")then return"Murderer"end if c:FindFirstChild("Gun")then return"Sheriff"end return"Innocent"end
local function fm()for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character and role(p)=="Murderer"then return p end end end
local function sw(v)local c=plr.Character if c then local h=c:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=v end end end
local function sj(v)local c=plr.Character if c then local h=c:FindFirstChildOfClass("Humanoid")if h then h.UseJumpPower=true h.JumpPower=v end end end

local m1=mTab("Move","🏃")
lab(m1,"Основное") sl(m1,"Speed",16,300,16,sw) sl(m1,"Jump",50,500,50,sj)
local fly=false local bv,bg
tog(m1,"Fly",false,function(s) fly=s local c=plr.Character if not c then return end local h=c:FindFirstChild("HumanoidRootPart") if s then bv=Instance.new("BodyVelocity",h) bv.MaxForce=Vector3.new(1e5,1e5,1e5) bv.Velocity=Vector3.new(0,0,0) bg=Instance.new("BodyGyro",h) bg.MaxTorque=Vector3.new(1e5,1e5,1e5) bg.P=1e4 task.spawn(function() while fly do task.wait() local cam=W.CurrentCamera local move=Vector3.new() if U:IsKeyDown(Enum.KeyCode.W) then move=move+cam.CFrame.LookVector end if U:IsKeyDown(Enum.KeyCode.S) then move=move-cam.CFrame.LookVector end if U:IsKeyDown(Enum.KeyCode.A) then move=move-cam.CFrame.RightVector end if U:IsKeyDown(Enum.KeyCode.D) then move=move+cam.CFrame.RightVector end if bv then bv.Velocity=move*50 end end end) else if bv then bv:Destroy() end if bg then bg:Destroy() end end end)
local noclip=false RS.Stepped:Connect(function() if noclip and plr.Character then for _,v in pairs(plr.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end)
tog(m1,"Noclip",false,function(s)noclip=s end)

local m2=mTab("ESP","👁")
local esp=false local function aE()for _,p in ipairs(P:GetPlayers())do if p.Character then local o=p.Character:FindFirstChild("AAR0N4IK_ESP")if o then o:Destroy()end end end if not esp then return end for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character then local h=Instance.new("Highlight")h.Name="AAR0N4IK_ESP"h.Adornee=p.Character h.FillTransparency=0.5 h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop local r=role(p)if r=="Murderer"then h.FillColor=C.r elseif r=="Sheriff"then h.FillColor=C.b else h.FillColor=C.g end h.Parent=p.Character end end end task.spawn(function()while task.wait(1)do if esp then aE()end end end)
tog(m2,"Player ESP",false,function(s)esp=s aE() end)
local fbA,fbO=false,{}local function sf(on)if on and not fbA then fbA=true fbO.a=L.Ambient fbO.o=L.OutdoorAmbient fbO.f=L.FogEnd fbO.b=L.Brightness L.Ambient=Color3.new(1,1,1)L.OutdoorAmbient=Color3.new(1,1,1)L.FogEnd=1e6 L.Brightness=2 elseif not on and fbA then fbA=false L.Ambient=fbO.a L.OutdoorAmbient=fbO.o L.FogEnd=fbO.f L.Brightness=fbO.b end end
tog(m2,"Fullbright",false,sf)

local m3=mTab("Fight","⚔️")
local ka=false task.spawn(function()while task.wait(0.1)do if ka then local c=plr.Character local k=c and c:FindFirstChild("Knife")if k then for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then if(p.Character.HumanoidRootPart.Position-c.HumanoidRootPart.Position).Magnitude<15 then pcall(function()k:Activate()end)end end end end end end end)
tog(m3,"Melee Aura",false,function(s)ka=s end)
local hug=false local hugConn
tog(m3,"bang (Hug)",false,function(s) hug=s if s then hugConn=RS.Heartbeat:Connect(function() if not hug then return end local c=plr.Character if not c then return end local m=fm() if not m or not m.Character then return end c.HumanoidRootPart.CFrame=m.Character.HumanoidRootPart.CFrame*CFrame.new(0,-2.5,2.5) end) else if hugConn then hugConn:Disconnect() end end end)

local m6=mTab("Info","ℹ️")
N("TextLabel",{Size=UDim2.new(1,0,0,30),BackgroundTransparency=1,Font=Enum.Font.GothamBlack,TextSize=16,TextColor3=C.a2,Text="Управление",Parent=m6})
N("TextLabel",{Size=UDim2.new(1,0,0,80),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,TextSize=13,TextColor3=C.sub,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,Text="Так как Delta блокирует кнопки, управляй чатом:\n/open — открыть меню\n/close — скрыть меню",Parent=m6})

pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="AAR0N4IK",Text="Hub загружен! Пиши в чат /open",Duration=5})end)
