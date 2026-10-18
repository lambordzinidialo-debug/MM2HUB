-- AAR0N4IK HUB | Premium Edition | Mobile Fix
local P=game:GetService("Players")local U=game:GetService("UserInputService")local T=game:GetService("TweenService")local L=game:GetService("Lighting")local W=game:GetService("Workspace")local CG=game:GetService("CoreGui")local TS=game:GetService("TeleportService")local HS=game:GetService("HttpService")local VU=game:GetService("VirtualUser")local RS=game:GetService("RunService")local plr=P.LocalPlayer

-- Тема (Deep Purple & Neon)
local C={
    bg=Color3.fromRGB(15,8,25), bg2=Color3.fromRGB(26,15,45), bg3=Color3.fromRGB(45,25,75),
    a=Color3.fromRGB(168,85,247), a2=Color3.fromRGB(217,70,239), 
    t=Color3.fromRGB(245,235,255), sub=Color3.fromRGB(160,150,180),
    r=Color3.fromRGB(255,60,60), b=Color3.fromRGB(60,150,255), g=Color3.fromRGB(60,220,100)
}
local mob=U.TouchEnabled and not U.KeyboardEnabled
pcall(function()for _,n in ipairs({"AAR0N4IK_Hub","AAR0N4IK_Btn","AAR0N4IK_Shoot","AAR0N4IK_Track"})do local o=CG:FindFirstChild(n)if o then o:Destroy()end end end)

local function N(c,p)local o=Instance.new(c)for k,v in pairs(p)do o[k]=v end return o end
local function cr(p,r)N("UICorner",{CornerRadius=UDim2.new(0,r or 8),Parent=p})end
local function st(p,c,t)N("UIStroke",{Color=c or C.bg3,Thickness=t or 1,Transparency=0.5,Parent=p})end
local function grad(p,c1,c2,rot)N("UIGradient",{Color=ColorSequence.new(c1,c2),Rotation=rot or 90,Parent=p})end

local vp=W.CurrentCamera.ViewportSize
local SW=math.min(vp.X-20,420)local SH=math.min(vp.Y-90,500)local RH=mob and 48 or 40

-- Экраны
local gui=N("ScreenGui",{Name="AAR0N4IK_Hub",ResetOnSpawn=false,IgnoreGuiInset=true,DisplayOrder=999})pcall(function()gui.Parent=CG end)
local tg=N("ScreenGui",{Name="AAR0N4IK_Btn",ResetOnSpawn=false,IgnoreGuiInset=true,DisplayOrder=1000})pcall(function()tg.Parent=CG end)
local sg=N("ScreenGui",{Name="AAR0N4IK_Shoot",ResetOnSpawn=false,IgnoreGuiInset=true,DisplayOrder=1001})pcall(function()sg.Parent=CG end)
local trg=N("ScreenGui",{Name="AAR0N4IK_Track",ResetOnSpawn=false,IgnoreGuiInset=true,DisplayOrder=1002})pcall(function()trg.Parent=CG end)

-- Кнопка А (Стеклянная)
local fb=N("TextButton",{Size=UDim2.fromOffset(50,50),Position=UDim2.new(0,15,0,90),BackgroundColor3=C.bg2,Text="A",Font=Enum.Font.GothamBlack,TextSize=24,TextColor3=C.a2,AutoButtonColor=false,Active=true,Parent=tg})
cr(fb,25) st(fb,C.a,2) grad(fb,C.bg3,C.bg2,45)

-- Кнопка SHOOT (Неоновая)
local sb=N("TextButton",{Size=UDim2.fromOffset(76,76),Position=UDim2.new(0,15,0,155),BackgroundColor3=C.a,Text="🔫\nSHOOT",Font=Enum.Font.GothamBlack,TextSize=12,TextColor3=Color3.new(1,1,1),AutoButtonColor=false,Visible=false,Active=true,Parent=sg})
cr(sb,38) st(sb,C.a2,2) grad(sb,C.a,C.a2,90)
local gl=N("UIStroke",{Color=C.a2,Thickness=4,Transparency=0.2,Parent=sb})
task.spawn(function()while sb.Parent do T:Create(gl,T.new(1),{Transparency=0.8}):Play()T:Create(sb,T.new(1),{Size=UDim2.fromOffset(80,80),Position=UDim2.new(0,13,0,153)}):Play()task.wait(1)T:Create(gl,T.new(1),{Transparency=0.2}):Play()T:Create(sb,T.new(1),{Size=UDim2.fromOffset(76,76),Position=UDim2.new(0,15,0,155)}):Play()task.wait(1)end end)

-- Радар
local trackLbl=N("TextLabel",{Size=UDim2.fromOffset(180,32),Position=UDim2.new(1,-195,0,15),BackgroundColor3=C.bg2,TextColor3=C.a2,Font=Enum.Font.GothamBold,TextSize=14,Visible=false,Parent=trg})
cr(trackLbl,8) st(trackLbl,C.a,1) grad(trackLbl,C.bg2,C.bg3,0)

-- Главное окно (Стекло)
local win=N("Frame",{Size=UDim2.fromOffset(SW,SH),Position=UDim2.new(.5,-SW/2,.5,-SH/2),BackgroundColor3=C.bg,BorderSizePixel=0,Visible=not mob,Parent=gui})
cr(win,16) st(win,C.a,1.5) grad(win,C.bg,C.bg2,135)

-- Заголовок
local th=N("Frame",{Size=UDim2.new(1,0,0,50),BackgroundColor3=C.bg2,BorderSizePixel=0,Parent=win})
cr(th,16) 
local thLine=N("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,1,0),BackgroundColor3=C.a,Parent=th}) grad(thLine,C.a,C.a2,0)

N("TextLabel",{Size=UDim2.new(1,-100,1,0),Position=UDim2.fromOffset(20,0),BackgroundTransparency=1,Font=Enum.Font.GothamBlack,Text="AAR0N4IK",TextColor3=C.t,TextSize=18,TextXAlignment=Enum.TextXAlignment.Left,Parent=th})
N("TextLabel",{Size=UDim2.new(1,-100,1,0),Position=UDim2.fromOffset(125,2),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,Text="PREMIUM",TextColor3=C.a2,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,Parent=th})

-- Кнопки закрытия
local xb=N("TextButton",{Size=UDim2.fromOffset(32,32),Position=UDim2.new(1,-44,.5,-16),BackgroundColor3=C.r,Text="×",Font=Enum.Font.GothamBold,TextSize=20,TextColor3=Color3.new(1,1,1),AutoButtonColor=false,Active=true,Parent=th}) cr(xb,8)
local mb2=N("TextButton",{Size=UDim2.fromOffset(32,32),Position=UDim2.new(1,-84,.5,-16),BackgroundColor3=C.bg3,Text="—",Font=Enum.Font.GothamBold,TextSize=18,TextColor3=C.t,AutoButtonColor=false,Active=true,Parent=th}) cr(mb2,8)

local function showMenu()win.Visible=true fb.Visible=false end
local function hideMenu()win.Visible=false fb.Visible=true end

-- ИСПРАВЛЕННЫЕ КЛИКИ (Для телефона)
local function addClick(btn, func)
    btn.MouseButton1Click:Connect(func)
    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            func()
        end
    end)
end

addClick(xb, hideMenu) addClick(mb2, hideMenu)
addClick(fb, showMenu)

-- Перетаскивание
local dg,ds,dp=false,nil,nil
th.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dg=true ds=i.Position dp=win.Position i.Changed:Connect(function()if i.UserInputState==Enum.UserInputState.End then dg=false end end)end end)
U.InputChanged:Connect(function(i)if dg and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then local d=i.Position-ds win.Position=UDim2.new(dp.X.Scale,dp.X.Offset+d.X,dp.Y.Scale,dp.Y.Offset+d.Y)end end)

-- Вкладки (Sidebar)
local tb=N("Frame",{Size=UDim2.new(0,90,1,-50),Position=UDim2.fromOffset(0,50),BackgroundTransparency=1,Parent=win})
N("UIListLayout",{Padding=UDim.new(0,6),HorizontalAlignment=Enum.HorizontalAlignment.Center,Parent=tb}) 
N("UIPadding",{PaddingTop=UDim.new(0,10),Parent=tb})

-- Контент
local ct=N("ScrollingFrame",{Size=UDim2.new(1,-100,1,-60),Position=UDim2.fromOffset(95,55),BackgroundTransparency=1,ScrollBarThickness=4,ScrollBarImageColor3=C.a,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y,Parent=win})
N("UIListLayout",{Padding=UDim.new(0,8),Parent=ct}) N("UIPadding",{PaddingRight=UDim.new(0,10),PaddingBottom=UDim.new(0,15),Parent=ct})

local tabs={}
local function mTab(nm, icon)
    local b=N("TextButton",{Size=UDim2.new(1,0,0,40),BackgroundColor3=C.bg2,Text=icon.." "..nm,Font=Enum.Font.GothamBold,TextSize=13,TextColor3=C.sub,AutoButtonColor=false,Active=true,Parent=tb})
    cr(b,8) st(b,C.bg3,1)
    local p=N("Frame",{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1,Visible=false,Parent=ct})
    N("UIListLayout",{Padding=UDim.new(0,8),Parent=p}) N("AutomaticSize",{Parent=p})
    table.insert(tabs,{b=b,p=p})
    
    local function switchTab()
        for _,x in ipairs(tabs)do 
            x.p.Visible=false 
            x.b.BackgroundColor3=C.bg2 
            x.b.TextColor3=C.sub
            local g=x.b:FindFirstChildOfClass("UIGradient") if g then g:Destroy() end
        end
        p.Visible=true 
        b.BackgroundColor3=C.bg3
        b.TextColor3=C.t
        grad(b,C.a,C.a2,0)
        ct.CanvasPosition=Vector2.new()
    end
    addClick(b, switchTab)
    if #tabs==1 then switchTab() end
    return p 
end

-- Элементы UI
local function lab(pp,tx)N("TextLabel",{Size=UDim2.new(1,0,0,20),BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextSize=12,TextColor3=C.a2,TextXAlignment=Enum.TextXAlignment.Left,Text=tx,Parent=pp,AutomaticSize=Enum.AutomaticSize.Y})end

local function tog(pp,tx,d,cb)
    local f=N("Frame",{Size=UDim2.new(1,0,0,RH),BackgroundColor3=C.bg2,Parent=pp})
    cr(f,10) st(f,C.bg3,1)
    N("TextLabel",{Size=UDim2.new(1,-70,1,0),Position=UDim2.fromOffset(15,0),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,TextSize=14,TextColor3=C.t,TextXAlignment=Enum.TextXAlignment.Left,Text=tx,Parent=f})
    
    local bg=N("Frame",{Size=UDim2.fromOffset(44,24),Position=UDim2.new(1,-60,.5,-12),BackgroundColor3=C.bg3,Parent=f})
    cr(bg,12) st(bg,C.bg3,1)
    local kn=N("Frame",{Size=UDim2.fromOffset(18,18),Position=d and UDim2.new(1,-22,.5,-9) or UDim2.fromOffset(3,3),BackgroundColor3=C.t,Parent=bg})
    cr(kn,12)
    if d then grad(bg,C.a,C.a2,0) end
    
    local s=d 
    local btn=N("TextButton",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text="",Active=true,Parent=f})
    local function fl()
        s=not s 
        T:Create(bg,T.new(.2),{BackgroundColor3=s and C.a or C.bg3}):Play()
        T:Create(kn,T.new(.2),{Position=s and UDim2.new(1,-22,.5,-9) or UDim2.fromOffset(3,3)}):Play()
        if s then grad(bg,C.a,C.a2,0) else local g=bg:FindFirstChildOfClass("UIGradient") if g then g:Destroy() end end
        if cb then pcall(cb,s) end 
    end
    addClick(btn, fl)
end

local function sl(pp,tx,mn,mx,d,cb)
    local f=N("Frame",{Size=UDim2.new(1,0,0,RH+20),BackgroundColor3=C.bg2,Parent=pp})
    cr(f,10) st(f,C.bg3,1)
    local lb=N("TextLabel",{Size=UDim2.new(1,-20,0,20),Position=UDim2.fromOffset(15,5),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,TextSize=14,TextColor3=C.t,TextXAlignment=Enum.TextXAlignment.Left,Text=tx..": "..d,Parent=f})
    
    local bar=N("Frame",{Size=UDim2.new(1,-30,0,6),Position=UDim2.new(0,15,1,-15),BackgroundColor3=C.bg3,Parent=f})
    cr(bar,3)
    local fl=N("Frame",{Size=UDim2.new((d-mn)/(mx-mn),0,1,0),BackgroundColor3=C.a,Parent=bar}) cr(fl,3) grad(fl,C.a,C.a2,0)
    local hb=N("TextButton",{Size=UDim2.new(1,30,0,RH),Position=UDim2.new(0,-15,1,-RH+5),BackgroundTransparency=1,Text="",Active=true,Parent=f})
    
    local dg2=false 
    local function sv(x)
        local r=math.clamp((x-bar.AbsolutePosition.X)/math.max(bar.AbsoluteSize.X,1),0,1)
        local v=math.floor(mn+(mx-mn)*r+.5)
        T:Create(fl,T.new(.1),{Size=UDim2.new(r,0,1,0)}):Play()
        lb.Text=tx..": "..v 
        if cb then pcall(cb,v)end 
    end
    hb.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dg2=true sv(i.Position.X)end end)
    U.InputChanged:Connect(function(i)if dg2 and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then sv(i.Position.X)end end)
    U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dg2=false end end)
end

local function btn(pp,tx,cb)
    local b=N("TextButton",{Size=UDim2.new(1,0,0,RH),BackgroundColor3=C.a,Font=Enum.Font.GothamBold,TextSize=14,TextColor3=Color3.new(1,1,1),Text=tx,AutoButtonColor=false,Active=true,Parent=pp})
    cr(b,10) grad(b,C.a,C.a2,0)
    local f=function()if cb then pcall(cb)end end 
    addClick(b, f)
end

local function nt(m)
    local n=N("TextLabel",{Size=UDim2.fromOffset(math.min(vp.X-40,300),40),AnchorPoint=Vector2.new(.5,0),BackgroundColor3=C.bg2,Font=Enum.Font.GothamBold,TextSize=13,TextColor3=C.t,Text="🔔 "..m,Parent=gui})
    cr(n,8) st(n,C.a2,1) grad(n,C.bg2,C.bg3,45)
    n.Position=UDim2.new(.5,0,0,-60)
    T:Create(n,T.new(.3),{Position=UDim2.new(.5,0,0,20)}):Play()
    task.delay(2.5,function()T:Create(n,T.new(.3),{Position=UDim2.new(.5,0,0,-60)}):Play()task.delay(.4,function()n:Destroy()end)end)
end

-- ЛОГИКА
local function role(p)if not p or not p.Character then return"Innocent"end local bp=p:FindFirstChild("Backpack")if bp then if bp:FindFirstChild("Knife")then return"Murderer"end if bp:FindFirstChild("Gun")then return"Sheriff"end end local c=p.Character if c:FindFirstChild("Knife")then return"Murderer"end if c:FindFirstChild("Gun")then return"Sheriff"end return"Innocent"end
local function fm()for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character and role(p)=="Murderer"then return p end end end

local esp=false local function aE()for _,p in ipairs(P:GetPlayers())do if p.Character then local o=p.Character:FindFirstChild("AAR0N4IK_ESP")if o then o:Destroy()end end end if not esp then return end for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character then local h=Instance.new("Highlight")h.Name="AAR0N4IK_ESP"h.Adornee=p.Character h.FillTransparency=.5 h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop local r=role(p)if r=="Murderer"then h.FillColor=C.r h.OutlineColor=C.r elseif r=="Sheriff"then h.FillColor=C.b h.OutlineColor=C.b else h.FillColor=C.g h.OutlineColor=C.g end h.Parent=p.Character end end end task.spawn(function()while task.wait(1)do if esp then aE()end end end)
local fbA,fbO=false,{}local function sf(on)if on and not fbA then fbA=true fbO.a=L.Ambient fbO.o=L.OutdoorAmbient fbO.f=L.FogEnd fbO.b=L.Brightness L.Ambient=Color3.new(1,1,1)L.OutdoorAmbient=Color3.new(1,1,1)L.FogEnd=1e6 L.Brightness=2 elseif not on and fbA then fbA=false L.Ambient=fbO.a L.OutdoorAmbient=fbO.o L.FogEnd=fbO.f L.Brightness=fbO.b end end
local function sw(v)local c=plr.Character if c then local h=c:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=v end end end
local function sj(v)local c=plr.Character if c then local h=c:FindFirstChildOfClass("Humanoid")if h then h.UseJumpPower=true h.JumpPower=v end end end
local af=false local function fc()for _,o in ipairs(W:GetDescendants())do if o:IsA("BasePart")and o.Name:lower():find("coin")then return o end end end task.spawn(function()while task.wait(.5)do if af then local c=plr.Character if c then local h=c:FindFirstChild("HumanoidRootPart")if h then local k=fc()if k and(k.Position-h.Position).Magnitude<200 then pcall(function()h.CFrame=k.CFrame end)end end end end end end)
local fps=false local function doFps()for _,v in ipairs(W:GetDescendants())do if v:IsA("ParticleEmitter")or v:IsA("Smoke")or v:IsA("Fire")or v:IsA("Sparkles")then pcall(function()v.Enabled=false end)end end end
local ie=false local function doIE()for _,v in ipairs(W:GetDescendants())do if v:IsA("BasePart")and(v.Name:lower():find("coin")or v.Name:lower():find("gun")or v.Name:lower():find("knife"))then local h=v:FindFirstChild("AAR0N4IK_IE")if ie and not h then local h2=Instance.new("Highlight")h2.Name="AAR0N4IK_IE"h2.Adornee=v h2.FillColor=C.a2 h2.OutlineColor=C.a2 h2.Parent=v elseif not ie and h then h:Destroy()end end end end task.spawn(function()while task.wait(2)do if ie then doIE()end end end)
local ka=false task.spawn(function()while task.wait(.1)do if ka then local c=plr.Character local k=c and c:FindFirstChild("Knife")if k then for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then if(p.Character.HumanoidRootPart.Position-c.HumanoidRootPart.Position).Magnitude<15 then pcall(function()k:Activate()end)end end end end end end end)
local ga=false task.spawn(function()while task.wait(.2)do if ga then local c=plr.Character local g=c and c:FindFirstChild("Gun")if g then for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then if(p.Character.HumanoidRootPart.Position-c.HumanoidRootPart.Position).Magnitude<100 then pcall(function()local cm=W.CurrentCamera cm.CFrame=CFrame.new(cm.CFrame.Position,p.Character.HumanoidRootPart.Position)g:Activate()end)end end end end end end end)
local as=false task.spawn(function()while task.wait(.15)do if as then local c=plr.Character if c then local g=c:FindFirstChild("Gun")if g and g:IsA("Tool")then local m=fm()if m and m.Character then local h=m.Character:FindFirstChild("HumanoidRootPart")if h then pcall(function()local cm=W.CurrentCamera cm.CFrame=CFrame.new(cm.CFrame.Position,h.Position)g:Activate()end)end end end end end end end)
local spin=false RS.Heartbeat:Connect(function()if spin and plr.Character then local h=plr.Character:FindFirstChild("HumanoidRootPart")if h then h.CFrame=h.CFrame*CFrame.Angles(0,math.rad(15),0)end end end)
local ajump=false task.spawn(function()while task.wait(.1)do if ajump and plr.Character then local m=fm()if m and m.Character and m.Character:FindFirstChild("HumanoidRootPart")then local d=(m.Character.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude if d<20 then plr.Character.Humanoid.Jump=true end end end end end)
local track=false task.spawn(function()while task.wait(.5)do if track then local m=fm()if m and m.Character and plr.Character then local d=math.floor((m.Character.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude)trackLbl.Text="🎯 Murderer: "..d.."m"trackLbl.TextColor3=C.r trackLbl.Visible=true else trackLbl.Text="🎯 Murderer: Safe"trackLbl.TextColor3=C.g trackLbl.Visible=true end else trackLbl.Visible=false end end end)

local function shootM()local ch=plr.Character if not ch then return false end local gun=ch:FindFirstChild("Gun")if not gun or not gun:IsA("Tool")then return false,"Нужен пистолет"end local m=fm()if not m or not m.Character then return false,"Маньяк не найден"end local hrp=m.Character:FindFirstChild("HumanoidRootPart")if not hrp then return false,"Маньяк не найден"end pcall(function()local cm=W.CurrentCamera cm.CFrame=CFrame.new(cm.CFrame.Position,hrp.Position)gun:Activate()end)return true end
local shooting=false local lm=0
local function tryS()local ok,e=shootM()if not ok and e and tick()-lm>1.5 then lm=tick()nt(e)end end
sb.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then shooting=true tryS()task.spawn(function()while shooting do task.wait(.12)if shooting then tryS()end end end)end end)
sb.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then shooting=false end end)

local hug=false local hugT=nil local hugRun=nil local hugConn=nil
local function nearP()local c,d=nil,1e9 local m=plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")if not m then return nil end for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character then local h=p.Character:FindFirstChild("HumanoidRootPart")if h then local dx=(h.Position-m.Position).Magnitude if dx<d then c=p d=dx end end end end return c end
local function stopHug()if hugConn then hugConn:Disconnect()hugConn=nil end if hugRun then pcall(function()hugRun:Stop()end)hugRun=nil end hugT=nil local ch=plr.Character if ch then local h=ch:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=16 end end end
local function startHug()hugT=nearP()if not hugT then nt("Нет игроков рядом")return end local ch=plr.Character if ch then local hum=ch:FindFirstChildOfClass("Humanoid")local an=hum and hum:FindFirstChildOfClass("Animator")if an then local aid="rbxassetid://913402848"local anim=ch:FindFirstChild("Animate")if anim then local r=anim:FindFirstChild("run")if r and r:FindFirstChild("RunAnim")then aid=r.RunAnim.AnimationId end end local a=Instance.new("Animation")a.AnimationId=aid hugRun=an:LoadAnimation(a)hugRun.Looped=true pcall(function()hugRun:Play()end)end end if hugConn then hugConn:Disconnect()end hugConn=RS.Heartbeat:Connect(function()if not hug then return end local c=plr.Character if not c then return end if not hugT or not hugT.Character then hugT=nearP()end if not hugT then return end local th=hugT.Character:FindFirstChild("HumanoidRootPart")local my=c:FindFirstChild("HumanoidRootPart")if not th or not my then return end my.CFrame=th.CFrame*CFrame.new(0,-2.5,2.5)my.Velocity=th.Velocity end)nt("Прилип к "..hugT.Name)end
plr.CharacterAdded:Connect(function()task.wait(1.5)if hug then startHug()end end)
plr.Idled:Connect(function()VU:CaptureController()VU:ClickButton2(Vector2.new())end)
local function hop()local ok,d=pcall(function()return HS:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?limit=100"))end)if ok an
