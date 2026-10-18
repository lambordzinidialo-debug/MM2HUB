-- AAR0N4IK MEGA HUB | 105 Functions | Mobile Fixed
local P=game:GetService("Players")local U=game:GetService("UserInputService")local T=game:GetService("TweenService")local L=game:GetService("Lighting")local W=game:GetService("Workspace")local CG=game:GetService("CoreGui")local TS=game:GetService("TeleportService")local HS=game:GetService("HttpService")local VU=game:GetService("VirtualUser")local RS=game:GetService("RunService")local plr=P.LocalPlayer
pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="AAR0N4IK MEGA",Text="Загружено 105 функций!",Duration=5})end)
local C={bg=Color3.fromRGB(10,5,20),bg2=Color3.fromRGB(22,12,40),bg3=Color3.fromRGB(40,20,65),a=Color3.fromRGB(168,85,247),a2=Color3.fromRGB(236,72,153),t=Color3.fromRGB(245,235,255),sub=Color3.fromRGB(170,160,190),r=Color3.fromRGB(255,60,60),b=Color3.fromRGB(60,150,255),g=Color3.fromRGB(60,220,100)}
local mob=U.TouchEnabled and not U.KeyboardEnabled
pcall(function()for _,n in ipairs({"AAR0N4IK_Hub","AAR0N4IK_Btn","AAR0N4IK_Track"})do local o=CG:FindFirstChild(n)if o then o:Destroy()end end end)
local function N(c,p)local o=Instance.new(c)for k,v in pairs(p)do o[k]=v end return o end
local function cr(p,r)N("UICorner",{CornerRadius=UDim2.new(0,r or 8),Parent=p})end
local function st(p,c,t,tr)N("UIStroke",{Color=c or C.bg3,Thickness=t or 1,Transparency=tr or 0.5,Parent=p})end
local function grad(p,c1,c2,rot)N("UIGradient",{Color=ColorSequence.new(c1,c2),Rotation=rot or 90,Parent=p})end
local vp=W.CurrentCamera.ViewportSize local SW=math.min(vp.X-20,420)local SH=math.min(vp.Y-90,500)
local MAX_ORDER=2147483647
local gui=N("ScreenGui",{Name="AAR0N4IK_Hub",ResetOnSpawn=false,IgnoreGuiInset=true,DisplayOrder=MAX_ORDER})pcall(function()gui.Parent=CG end)if not gui.Parent then gui.Parent=plr:WaitForChild("PlayerGui")end
local tg=N("ScreenGui",{Name="AAR0N4IK_Btn",ResetOnSpawn=false,IgnoreGuiInset=true,DisplayOrder=MAX_ORDER})pcall(function()tg.Parent=CG end)if not tg.Parent then tg.Parent=plr:WaitForChild("PlayerGui")end

-- Кнопка А
local fb=N("TextButton",{Size=UDim2.fromOffset(65,65),Position=UDim2.new(0.5,-32.5,0.5,-32.5),BackgroundColor3=C.bg2,Text="A",Font=Enum.Font.GothamBlack,TextSize=30,TextColor3=C.t,AutoButtonColor=false,Active=true,Parent=tg}) 
cr(fb,32.5) local fbStroke=st(fb,C.a,2.5,0) grad(fb,C.a,C.a2,45)
task.spawn(function()while fb.Parent do T:Create(fbStroke,T.new(1.5),{Thickness=4,Transparency=0.5}):Play() T:Create(fb,T.new(1.5),{TextColor3=C.a2}):Play() task.wait(1.5) T:Create(fbStroke,T.new(1.5),{Thickness=2.5,Transparency=0}):Play() T:Create(fb,T.new(1.5),{TextColor3=C.t}):Play() task.wait(1.5) end end)

-- Окно
local win=N("Frame",{Size=UDim2.fromOffset(SW,SH),Position=UDim2.new(0.5,-SW/2,0.5,-SH/2),BackgroundColor3=C.bg,BorderSizePixel=0,Visible=false,Parent=gui}) 
cr(win,16) st(win,C.a,1.5,0.2) grad(win,C.bg,C.bg2,135)
local th=N("Frame",{Size=UDim2.new(1,0,0,55),BackgroundColor3=C.bg2,BorderSizePixel=0,Parent=win}) 
cr(th,16) local thLine=N("Frame",{Size=UDim2.new(1,0,0,2),Position=UDim2.new(0,0,1,0),BackgroundColor3=C.a,Parent=th}) 
grad(thLine,C.a,C.a2,0)
N("TextLabel",{Size=UDim2.new(1,-100,1,0),Position=UDim2.fromOffset(20,0),BackgroundTransparency=1,Font=Enum.Font.GothamBlack,Text="AAR0N4IK MEGA",TextColor3=C.t,TextSize=18,TextXAlignment=Enum.TextXAlignment.Left,Parent=th})
local xb=N("TextButton",{Size=UDim2.fromOffset(35,35),Position=UDim2.new(1,-45,0.5,-17.5),BackgroundColor3=C.r,Text="×",Font=Enum.Font.GothamBold,TextSize=22,TextColor3=C.t,AutoButtonColor=false,Active=true,Parent=th}) 
cr(xb,8)

local function showMenu()win.Visible=true fb.Visible=false end
local function hideMenu()win.Visible=false fb.Visible=true end
local function addClick(btn,func) btn.MouseButton1Click:Connect(func) btn.TouchTap:Connect(func) btn.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then func() end end) end
addClick(xb,hideMenu) 

-- МАТЕМАТИЧЕСКИЙ ОБХОД КЛИКОВ (Delta Bypass)
local btnDrag=false local btnStartPos,btnInitialPos,isMoving=nil,nil,false
U.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.Touch or input.UserInputType==Enum.UserInputType.MouseButton1 then
        local pos=input.Position local bPos=fb.AbsolutePosition local bSize=fb.AbsoluteSize
        if pos.X>=bPos.X and pos.X<=bPos.X+bSize.X and pos.Y>=bPos.Y and pos.Y<=bPos.Y+bSize.Y then
            btnDrag=true isMoving=false btnStartPos=pos btnInitialPos=fb.Position
            T:Create(fb,T.new(0.1),{Size=UDim2.fromOffset(55,55),Position=UDim2.new(fb.Position.X.Scale,fb.Position.X.Offset+5,fb.Position.Y.Scale,fb.Position.Y.Offset+5)}):Play()
        end
    end
end)
U.InputChanged:Connect(function(input)
    if btnDrag and (input.UserInputType==Enum.UserInputType.Touch or input.UserInputType==Enum.UserInputType.MouseMovement) then
        local delta=input.Position-btnStartPos
        if math.abs(delta.X)>10 or math.abs(delta.Y)>10 then isMoving=true fb.Position=UDim2.new(btnInitialPos.X.Scale,btnInitialPos.X.Offset+delta.X,btnInitialPos.Y.Scale,btnInitialPos.Y.Offset+delta.Y) end
    end
end)
U.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.Touch or input.UserInputType==Enum.UserInputType.MouseButton1 then
        if btnDrag then
            btnDrag=false T:Create(fb,T.new(0.1),{Size=UDim2.fromOffset(65,65),Position=UDim2.new(fb.Position.X.Scale,fb.Position.X.Offset-5,fb.Position.Y.Scale,fb.Position.Y.Offset-5)}):Play()
            if not isMoving then showMenu() end
        end
    end
end)
plr.Chatted:Connect(function(msg) if msg:lower()=="/open" or msg:lower()=="/hub" then showMenu() end end)

-- Перетаскивание окна
local dg,ds,dp=false,nil,nil 
th.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dg=true ds=i.Position dp=win.Position i.Changed:Connect(function()if i.UserInputState==Enum.UserInputState.End then dg=false end end)end end)
U.InputChanged:Connect(function(i)if dg and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then local d=i.Position-ds win.Position=UDim2.new(dp.X.Scale,dp.X.Offset+d.X,dp.Y.Scale,dp.Y.Offset+d.Y)end end)

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
    addClick(b,switchTab) 
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
    local function fl()
        s=not s 
        T:Create(bg,T.new(0.2),{BackgroundColor3=s and C.a or C.bg3}):Play() 
        T:Create(kn,T.new(0.2),{Position=s and UDim2.new(1,-18,0.5,-8) or UDim2.fromOffset(3,3)}):Play() 
        if s then grad(bg,C.a,C.a2,0) else local g=bg:FindFirstChildOfClass("UIGradient") if g then g:Destroy() end end 
        if cb then pcall(cb,s) end 
    end 
    addClick(btn,fl)
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
    local f=function()if cb then pcall(cb)end end addClick(b,f)
end

local function nt(m)local n=N("TextLabel",{Size=UDim2.fromOffset(math.min(vp.X-40,300),40),AnchorPoint=Vector2.new(0.5,0),BackgroundColor3=C.bg2,Font=Enum.Font.GothamBold,TextSize=13,TextColor3=C.t,Text="🔔 "..m,Parent=gui}) cr(n,8) st(n,C.a2,1,0) grad(n,C.bg2,C.bg3,45) n.Position=UDim2.new(0.5,0,0,-60) T:Create(n,T.new(0.3),{Position=UDim2.new(0.5,0,0,20)}):Play() task.delay(2.5,function()T:Create(n,T.new(0.3),{Position=UDim2.new(0.5,0,0,-60)}):Play()task.delay(0.4,function()n:Destroy()end)end)end

-- БАЗОВЫЕ ФУНКЦИИ
local function role(p)if not p or not p.Character then return"Innocent"end local bp=p:FindFirstChild("Backpack")if bp then if bp:FindFirstChild("Knife")then return"Murderer"end if bp:FindFirstChild("Gun")then return"Sheriff"end end local c=p.Character if c:FindFirstChild("Knife")then return"Murderer"end if c:FindFirstChild("Gun")then return"Sheriff"end return"Innocent"end
local function fm()for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character and role(p)=="Murderer"then return p end end end
local function sw(v)local c=plr.Character if c then local h=c:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=v end end end
local function sj(v)local c=plr.Character if c then local h=c:FindFirstChildOfClass("Humanoid")if h then h.UseJumpPower=true h.JumpPower=v end end end

-- ВКЛАДКА 1: Movement (Движение)
local m1=mTab("Move","🏃")
lab(m1,"Основное") sl(m1,"Speed",16,300,16,sw) sl(m1,"Jump",50,500,50,sj)
local fly=false local bv,bg
tog(m1,"Fly (Полёт)",false,function(s) fly=s local c=plr.Character if not c then return end local h=c:FindFirstChild("HumanoidRootPart") if s then bv=Instance.new("BodyVelocity",h) bv.MaxForce=Vector3.new(1e5,1e5,1e5) bv.Velocity=Vector3.new(0,0,0) bg=Instance.new("BodyGyro",h) bg.MaxTorque=Vector3.new(1e5,1e5,1e5) bg.P=1e4 task.spawn(function() while fly do task.wait() local cam=W.CurrentCamera local move=Vector3.new() if U:IsKeyDown(Enum.KeyCode.W) then move=move+cam.CFrame.LookVector end if U:IsKeyDown(Enum.KeyCode.S) then move=move-cam.CFrame.LookVector end if U:IsKeyDown(Enum.KeyCode.A) then move=move-cam.CFrame.RightVector end if U:IsKeyDown(Enum.KeyCode.D) then move=move+cam.CFrame.RightVector end if bv then bv.Velocity=move*50 end end end) else if bv then bv:Destroy() end if bg then bg:Destroy() end end end)
local noclip=false RS.Stepped:Connect(function() if noclip and plr.Character then for _,v in pairs(plr.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end)
tog(m1,"Noclip (Сквозь стены)",false,function(s)noclip=s end)
local infjump=false U.InputBegan:Connect(function(i,gp) if gp then return end if infjump and i.KeyCode==Enum.KeyCode.Space then local h=plr.Character:FindFirstChildOfClass("Humanoid") if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end end end)
tog(m1,"Infinite Jump",false,function(s)infjump=s end)
tog(m1,"Anti-Fling",false,function(s) if s then plr.CharacterAdded:Connect(function(c) task.wait(1) local h=c:FindFirstChildOfClass("Humanoid") if h then h.PlatformStand=false end end) end end)
lab(m1,"Телепорты")
btn(m1,"TP to Murderer",function() local m=fm() if m and m.Character then plr.Character.HumanoidRootPart.CFrame=m.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,3) end end)
btn(m1,"TP to Random Player",function() local p=P:GetPlayers()[math.random(1,#P:GetPlayers())] if p and p~=plr and p.Character then plr.Character.HumanoidRootPart.CFrame=p.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,3) end end)
tog(m1,"Orbit Player (Кружение)",false,function(s) if s then task.spawn(function() local angle=0 while s do task.wait() angle=angle+0.05 local m=fm() if m and m.Character then local r=5 plr.Character.HumanoidRootPart.CFrame=m.Character.HumanoidRootPart.CFrame*CFrame.Angles(0,angle,0)*CFrame.new(0,0,r) end end end) end end)

-- ВКЛАДКА 2: ESP (Визуал)
local m2=mTab("ESP","👁")
lab(m2,"Игроки")
local esp=false local function aE()for _,p in ipairs(P:GetPlayers())do if p.Character then local o=p.Character:FindFirstChild("AAR0N4IK_ESP")if o then o:Destroy()end end end if not esp then return end for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character then local h=Instance.new("Highlight")h.Name="AAR0N4IK_ESP"h.Adornee=p.Character h.FillTransparency=0.5 h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop local r=role(p)if r=="Murderer"then h.FillColor=C.r elseif r=="Sheriff"then h.FillColor=C.b else h.FillColor=C.g end h.Parent=p.Character end end end task.spawn(function()while task.wait(1)do if esp then aE()end end end)
tog(m2,"Player ESP",false,function(s)esp=s aE() end)
tog(m2,"Name ESP",false,function(s) if s then task.spawn(function() while s do task.wait(1) for _,p in ipairs(P:GetPlayers()) do if p~=plr and p.Character then local b=Instance.new("BillboardGui",p.Character.Head) b.Name="AAR0N4IK_N" b.Size=UDim2.new(0,100,0,50) b.AlwaysOnTop=true b.Adornee=p.Character.Head local t=Instance.new("TextLabel",b) t.Size=UDim2.new(1,0,1,0) t.BackgroundTransparency=1 t.Text=p.Name t.TextColor3=C.t t.TextStrokeTransparency=0 end end end end) end end)
lab(m2,"Объекты")
local ie=false local function doIE()for _,v in ipairs(W:GetDescendants())do if v:IsA("BasePart")and(v.Name:lower():find("coin")or v.Name:lower():find("gun")or v.Name:lower():find("knife"))then local h=v:FindFirstChild("AAR0N4IK_IE")if ie and not h then local h2=Instance.new("Highlight")h2.Name="AAR0N4IK_IE"h2.Adornee=v h2.FillColor=C.a2 h2.OutlineColor=C.a2 h2.Parent=v elseif not ie and h then h:Destroy()end end end end task.spawn(function()while task.wait(2)do if ie then doIE()end end end)
tog(m2,"Item ESP",false,function(s)ie=s if not s then doIE() end end)
tog(m2,"Coin ESP",false,function(s) if s then task.spawn(function() while s do task.wait(1) for _,v in ipairs(W:GetDescendants()) do if v:IsA("BasePart") and v.Name:lower():find("coin") then local h=Instance.new("Highlight",v) h.FillColor=Color3.new(1,1,0) end end end end) end end)
lab(m2,"Свет")
local fbA,fbO=false,{}local function sf(on)if on and not fbA then fbA=true fbO.a=L.Ambient fbO.o=L.OutdoorAmbient fbO.f=L.FogEnd fbO.b=L.Brightness L.Ambient=Color3.new(1,1,1)L.OutdoorAmbient=Color3.new(1,1,1)L.FogEnd=1e6 L.Brightness=2 elseif not on and fbA then fbA=false L.Ambient=fbO.a L.OutdoorAmbient=fbO.o L.FogEnd=fbO.f L.Brightness=fbO.b end end
tog(m2,"Fullbright",false,sf)
tog(m2,"No Fog (Без тумана)",false,function(s) if s then L.FogEnd=1e6 else L.FogEnd=1000 end end)
tog(m2,"FPS Boost",false,function(s) if s then for _,v in ipairs(W:GetDescendants()) do if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") then v.Enabled=false end end end end)
tog(m2,"Remove Textures",false,function(s) if s then for _,v in ipairs(W:GetDescendants()) do if v:IsA("Decal") or v:IsA("Texture") then v.Transparency=1 end end end end)

-- ВКЛАДКА 3: Combat (Бой)
local m3=mTab("Fight","⚔️")
lab(m3,"Ауры")
local ka=false task.spawn(function()while task.wait(0.1)do if ka then local c=plr.Character local k=c and c:FindFirstChild("Knife")if k then for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then if(p.Character.HumanoidRootPart.Position-c.HumanoidRootPart.Position).Magnitude<15 then pcall(function()k:Activate()end)end end end end end end end)
tog(m3,"Melee Aura",false,function(s)ka=s end)
local ga=false task.spawn(function()while task.wait(0.2)do if ga then local c=plr.Character local g=c and c:FindFirstChild("Gun")if g then for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then if(p.Character.HumanoidRootPart.Position-c.HumanoidRootPart.Position).Magnitude<100 then pcall(function()local cm=W.CurrentCamera cm.CFrame=CFrame.new(cm.CFrame.Position,p.Character.HumanoidRootPart.Position)g:Activate()end)end end end end end end end)
tog(m3,"Ranged Aura",false,function(s)ga=s end)
tog(m3,"Auto-Shoot",false,function(s) if s then task.spawn(function() while s do task.wait(0.2) local m=fm() if m and m.Character then local g=plr.Character:FindFirstChild("Gun") if g then W.CurrentCamera.CFrame=CFrame.new(W.CurrentCamera.CFrame.Position,m.Character.HumanoidRootPart.Position) g:Activate() end end end end) end end)
tog(m3,"Auto-Jump (Dodge)",false,function(s) if s then task.spawn(function() while s do task.wait(0.1) local m=fm() if m and m.Character then if (m.Character.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude<20 then plr.Character.Humanoid.Jump=true end end end end) end end)
lab(m3,"Sheriff")
tog(m3,"Silent Aim",false,func
