local P=game:GetService("Players")local U=game:GetService("UserInputService")local L=game:GetService("Lighting")local W=game:GetService("Workspace")local RS=game:GetService("RunService")local VU=game:GetService("VirtualUser")local TS=game:GetService("TeleportService")local HS=game:GetService("HttpService")local plr=P.LocalPlayer local pg=plr:WaitForChild("PlayerGui") if pg:FindFirstChild("AAR0N_Max")then pg.AAR0N_Max:Destroy()end
local C={bg=Color3.fromRGB(15,10,20),bg2=Color3.fromRGB(25,15,35),a=Color3.fromRGB(168,85,247),t=Color3.fromRGB(255,255,255),r=Color3.fromRGB(255,60,60),b=Color3.fromRGB(60,150,255),g=Color3.fromRGB(60,220,100)}
local function clk(b,f)b.MouseButton1Click:Connect(f)b.TouchTap:Connect(f)end
local g=Instance.new("ScreenGui",pg)g.Name="AAR0N_Max" g.ResetOnSpawn=false g.DisplayOrder=100
local a=Instance.new("TextButton",g)a.Size=UDim2.fromOffset(60,60)a.Position=UDim2.new(0.5,0,0.5,0)a.AnchorPoint=Vector2.new(0.5,0.5)a.BackgroundColor3=C.a a.Text="A" a.TextColor3=C.t a.Font=Enum.Font.GothamBlack a.TextSize=28 a.Visible=false Instance.new("UICorner",a).CornerRadius=UDim.new(0,30)
local m=Instance.new("Frame",g)m.Size=UDim2.new(0.85,0,0.75,0)m.Position=UDim2.new(0.5,0,0.5,0)m.AnchorPoint=Vector2.new(0.5,0.5)m.BackgroundColor3=C.bg Instance.new("UICorner",m).CornerRadius=UDim.new(0,12)Instance.new("UIStroke",m).Color=C.a
local t=Instance.new("Frame",m)t.Size=UDim2.new(1,0,0,40)t.BackgroundColor3=C.bg2 Instance.new("UICorner",t).CornerRadius=UDim.new(0,12)t.Parent=m
local ti=Instance.new("TextLabel",t)ti.Size=UDim2.new(1,-40,1,0)ti.BackgroundTransparency=1 ti.Text="AAR0N4IK | MAX" ti.TextColor3=C.a ti.Font=Enum.Font.GothamBlack ti.TextSize=15 ti.Parent=t
local c=Instance.new("TextButton",t)c.Size=UDim2.fromOffset(30,30)c.Position=UDim2.new(1,-35,0.5,-15)c.BackgroundColor3=C.r c.Text="×" c.TextColor3=C.t c.Font=Enum.Font.GothamBold c.TextSize=20 Instance.new("UICorner",c).CornerRadius=UDim.new(0,6)c.Parent=t
clk(c,function()m.Visible=false a.Visible=true end)clk(a,function()m.Visible=true a.Visible=false end)
local s=Instance.new("Frame",m)s.Size=UDim2.new(0.25,-5,1,-45)s.Position=UDim2.new(0,5,0,45)s.BackgroundTransparency=1 s.Parent=m Instance.new("UIListLayout",s).Padding=UDim.new(0,6)
local ct=Instance.new("Frame",m)ct.Size=UDim2.new(0.75,-5,1,-55)ct.Position=UDim2.new(0.25,0,0,50)ct.BackgroundTransparency=1 ct.Parent=m
local tb={}
local function mkT(n,i)local b=Instance.new("TextButton",s)b.Size=UDim2.new(1,-10,0,36)b.BackgroundColor3=C.bg2 b.Text=i.." "..n b.TextColor3=C.t b.Font=Enum.Font.GothamBold b.TextSize=13 Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)
local p=Instance.new("ScrollingFrame",ct)p.Size=UDim2.new(1,0,1,0)p.BackgroundTransparency=1 p.ScrollBarThickness=3 p.CanvasSize=UDim2.new()p.AutomaticCanvasSize=Enum.AutomaticSize.Y p.Visible=false Instance.new("UIListLayout",p).Padding=UDim.new(0,4)
table.insert(tb,{b=b,p=p})clk(b,function()for _,x in ipairs(tb)do x.p.Visible=false x.b.BackgroundColor3=C.bg2 end p.Visible=true b.BackgroundColor3=C.a end)
if #tb==1 then p.Visible=true b.BackgroundColor3=C.a end return p end
local function mkTog(pr,tx,cb)local f=Instance.new("Frame",pr)f.Size=UDim2.new(1,-5,0,36)f.BackgroundColor3=C.bg2 Instance.new("UICorner",f).CornerRadius=UDim.new(0,8)
local ll=Instance.new("TextLabel",f)ll.Size=UDim2.new(1,-50,1,0)ll.Position=UDim2.new(0,10,0,0)ll.BackgroundTransparency=1 ll.Text=tx ll.TextColor3=C.t ll.Font=Enum.Font.Gotham ll.TextSize=13 ll.TextXAlignment=Enum.TextXAlignment.Left ll.Parent=f
local bg=Instance.new("Frame",f)bg.Size=UDim2.fromOffset(36,18)bg.Position=UDim2.new(1,-46,0.5,-9)bg.BackgroundColor3=C.bg Instance.new("UICorner",bg).CornerRadius=UDim.new(0,9)bg.Parent=f
local kn=Instance.new("Frame",bg)kn.Size=UDim2.fromOffset(14,14)kn.Position=UDim2.fromOffset(2,2)kn.BackgroundColor3=C.t Instance.new("UICorner",kn).CornerRadius=UDim.new(0,7)kn.Parent=bg
local st=false local bt=Instance.new("TextButton",f)bt.Size=UDim2.fromScale(1,1)bt.BackgroundTransparency=1 bt.Text=""bt.Parent=f
clk(bt,function()st=not st bg.BackgroundColor3=st and C.a or C.bg kn.Position=st and UDim2.new(1,-16,0.5,-7)or UDim2.fromOffset(2,2)if cb then cb(st)end end)end
local function mkBtn(pr,tx,cb)local b=Instance.new("TextButton",pr)b.Size=UDim2.new(1,-5,0,36)b.BackgroundColor3=C.bg2 b.Text=tx b.TextColor3=C.a b.Font=Enum.Font.GothamBold b.TextSize=13 Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)clk(b,cb)end
local function mkBox(pr,ph,cb)local b=Instance.new("TextBox",pr)b.Size=UDim2.new(1,-5,0,36)b.BackgroundColor3=C.bg2 b.PlaceholderText=ph b.PlaceholderColor3=C.t b.TextColor3=C.t b.Font=Enum.Font.Gotham b.TextSize=13 b.Text=""Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)b.FocusLost:Connect(function(e)if e and tonumber(b.Text)then cb(tonumber(b.Text))end end)end

local t1=mkT("Main","🏃")local t2=mkT("Visual","👁")local t3=mkT("Combat","⚔️")local t4=mkT("Players","👥")local t5=mkT("Emote","💃")local t6=mkT("Epic","💥")local t7=mkT("Misc","🌐")
local S={fly=false,noclip=false,infjump=false,esp=false,nameesp=false,hitbox=false,fb=false,aura=false,aim=false,autoKill=false,dodge=false,agun=false,antiFling=false,spin=false,speed=50}
local function role(pl)if not pl or not pl.Character then return"Innocent"end local bp=pl:FindFirstChild("Backpack")if bp and bp:FindFirstChild("Knife")then return"Murderer"end if bp and bp:FindFirstChild("Gun")then return"Sheriff"end return"Innocent"end
local function fm()for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character and role(p)=="Murderer"then return p end end end

-- MAIN
mkTog(t1,"Noclip",function(s)S.noclip=s end) mkTog(t1,"Fly",function(s)S.fly=s end) mkBox(t1,"Скорость полета",function(n)S.speed=n end) mkBox(t1,"Скорость ходьбы",function(n)if plr.Character then plr.Character.Humanoid.WalkSpeed=n end end) mkBox(t1,"Прыжок",function(n)if plr.Character then plr.Character.Humanoid.UseJumpPower=true plr.Character.Humanoid.JumpPower=n end end) mkTog(t1,"Infinite Jump",function(s)S.infjump=s end) mkBtn(t1,"Anti-AFK",function()plr.Idled:Connect(function()VU:CaptureController()VU:ClickButton2(Vector2.new())end)end)
-- VISUAL
mkTog(t2,"See Roles (ESP)",function(s)S.esp=s end) mkTog(t2,"Name ESP",function(s)S.nameesp=s end) mkTog(t2,"Hitbox Expander",function(s)S.hitbox=s end) mkTog(t2,"Fullbright",function(s)S.fb=s L.Ambient=s and Color3.new(1,1,1)or Color3.new(0.5,0.5,0.5)end)
-- COMBAT
mkTog(t3,"Melee Aura",function(s)S.aura=s end) mkTog(t3,"Silent Aim",function(s)S.aim=s end) mkTog(t3,"Auto-Kill",function(s)S.autoKill=s end) mkTog(t3,"Auto-Dodge",function(s)S.dodge=s end) mkTog(t3,"Auto Dropped Gun",function(s)S.agun=s end) mkBtn(t3,"TP to Murderer",function()local mm=fm()if mm and mm.Character then plr.Character.HumanoidRootPart.CFrame=mm.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,3)end end)
-- PLAYERS
local function fling(t)if t and t.Character then local h=t.Character:FindFirstChild("HumanoidRootPart")if h then local b=Instance.new("BodyAngularVelocity",h)b.AngularVelocity=Vector3.new(99999,99999,99999)b.MaxTorque=Vector3.new(math.huge,math.huge,math.huge)task.delay(1,function()b:Destroy()end)end end end
local function upd()for _,c in ipairs(t4:GetChildren())do if c:IsA("Frame")then c:Destroy()end end for _,p in ipairs(P:GetPlayers())do if p~=plr then local f=Instance.new("Frame",t4)f.Size=UDim2.new(1,-5,0,35)f.BackgroundColor3=C.bg2 Instance.new("UICorner",f).CornerRadius=UDim.new(0,6)local l=Instance.new("TextLabel",f)l.Size=UDim2.new(0.5,0,1,0)l.Position=UDim2.fromOffset(5,0)l.BackgroundTransparency=1 l.Text=p.Name l.TextColor3=C.t l.Font=Enum.Font.Gotham l.TextSize=12 l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=f local tp=Instance.new("TextButton",f)tp.Size=UDim2.new(0.2,0,0.7,0)tp.Position=UDim2.new(0.55,0,0.15,0)tp.BackgroundColor3=C.a tp.Text="TP" tp.TextColor3=C.t tp.Font=Enum.Font.GothamBold tp.TextSize=12 Instance.new("UICorner",tp).CornerRadius=UDim.new(0,4)tp.Parent=f clk(tp,function()if p.Character and plr.Character then plr.Character.HumanoidRootPart.CFrame=p.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,3)end end)local fl=Instance.new("TextButton",f)fl.Size=UDim2.new(0.2,0,0.7,0)fl.Position=UDim2.new(0.77,0,0.15,0)fl.BackgroundColor3=C.r fl.Text="Fling" fl.TextColor3=C.t fl.Font=Enum.Font.GothamBold fl.TextSize=12 Instance.new("UICorner",fl).CornerRadius=UDim.new(0,4)fl.Parent=f clk(fl,function()fling(p)end)end end end
upd() task.spawn(function()while task.wait(5)do upd()end end) mkBtn(t4,"Fling All",function()for _,p in ipairs(P:GetPlayers())do if p~=plr then fling(p)end end end)
-- EMOTE
local function playAnim(id)local c=plr.Character if c and c:FindFirstChildOfClass("Humanoid")then local aa=Instance.new("Animation")aa.AnimationId="rbxassetid://"..tostring(id)local an=c.Humanoid:FindFirstChildOfClass("Animator")if an then local tr=an:LoadAnimation(aa)tr:Play()end end end
mkBtn(t5,"Floss",function()playAnim(5915694204)end) mkBtn(t5,"Dab",function()playAnim(2482632600)end) mkBtn(t5,"Orange Justice",function()playAnim(3264923498)end) mkBtn(t5,"Default Dance",function()playAnim(507771019)end) mkBtn(t5,"Gangnam Style",function()playAnim(4341064546)end) mkBtn(t5,"Macarena",function()playAnim(1286874805)end) mkBtn(t5,"Russian Dance",function()playAnim(7823163342)end) mkBtn(t5,"Zombie Walk",function()playAnim(616163682)end) mkBtn(t5,"Levitate",function()playAnim(3132104140)end) mkBtn(t5,"Hacker Dance",function()playAnim(13121459905)end) mkBtn(t5,"Moonwalk",function()playAnim(8299783018)end) mkBtn(t5,"Salute",function()playAnim(3382359835)end) mkBtn(t5,"Shuffle",function()playAnim(8036852701)end) mkBtn(t5,"Electro Shuffle",function()playAnim(5102713912)end) mkBtn(t5,"Best Mates",function()playAnim(6692709646)end)
-- EPIC
mkBtn(t6,"Spawn Clone",function()if plr.Character then local cl=plr.Character:Clone()cl.Name="Clone"for _,v in ipairs(cl:GetDescendants())do if v:IsA("Script")or v:IsA("LocalScript")then v:Destroy()end end local sp=plr.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-5)cl.Parent=W local hrp=cl:FindFirstChild("HumanoidRootPart")if hrp then hrp.CFrame=sp hrp.Anchored=true end end end) mkBtn(t6,"Mass Freeze",function()for _,p in ipairs(P:GetPlayers())do if p.Character and p.Character:FindFirstChild("HumanoidRootPart")then p.Character.HumanoidRootPart.Anchored=true end end end) mkBtn(t6,"Mass Unfreeze",function()for _,p in ipairs(P:GetPlayers())do if p.Character and p.Character:FindFirstChild("HumanoidRootPart")then p.Character.HumanoidRootPart.Anchored=false end end end) mkBtn(t6,"Mass Void",function()for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then p.Character.HumanoidRootPart.CFrame=CFrame.new(0,-500,0)end end end) mkBtn(t6,"Earthquake",function()local cam=W.CurrentCamera task.spawn(function()for i=1,50 do cam.CFrame=cam.CFrame*CFrame.Angles(math.random(-10,10)/100,math.random(-10,10)/100,math.random(-10,10)/100)task.wait(0.05)end end)end)
-- MISC
mkTog(t7,"Anti-Fling",function(s)S.antiFling=s end) mkBtn(t7,"Server Hop",function()local ok,d=pcall(function()return HS:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?limit=100"))end)if ok and d and d.data then for _,v in ipairs(d.data)do if v.playing<v.maxPlayers and v.id~=game.JobId then TS:TeleportToPlaceInstance(game.PlaceId,v.id,plr)return end end end end) mkBtn(t7,"Rejoin",function()TS:Teleport(game.PlaceId,plr)end) mkBtn(t7,"Destroy UI",function()g:Destroy()end)

-- ЕДИНЫЙ ЦИКЛ
local et=0
RS.Heartbeat:Connect(function(dt)
    local ch=plr.Character if not ch then return end
    local hrp=ch:FindFirstChild("HumanoidRootPart")local hum=ch:FindFirstChildOfClass("Humanoid")if not hrp or not hum then return end
    if S.noclip then for _,v in pairs(ch:GetDescendants())do if v:IsA("BasePart")then v.CanCollide=false end end end
    if S.fly then
        hum.PlatformStand=true
        local bv=hrp:FindFirstChildOfClass("BodyVelocity")
        if not bv then bv=Instance.new("BodyVelocity",hrp)bv.MaxForce=Vector3.new(1e5,1e5,1e5)end
        if hum.MoveDirection.Magnitude>0 then bv.Velocity=hum.MoveDirection*S.speed else bv.Velocity=Vector3.zero end
    elseif not S.fly and hum.PlatformStand then
        hum.PlatformStand=false
        local bv=hrp:FindFirstChildOfClass("BodyVelocity")if bv then bv:Destroy()end
    end
    if S.aura then local k=ch:FindFirstChild("Knife")if k then for _,v in ipairs(P:GetPlayers())do if v~=plr and v.Character and v.Character:FindFirstChild("HumanoidRootPart")then if(v.Character.HumanoidRootPart.Position-hrp.Position).Magnitude<15 then k:Activate()end end end end end
    if S.aim then local mm=fm()if mm and mm.Character and mm.Character:FindFirstChild("HumanoidRootPart")then W.CurrentCamera.CFrame=CFrame.lookAt(W.CurrentCamera.CFrame.Position,mm.Character.HumanoidRootPart.Position)end end
    if S.autoKill then local k=ch:FindFirstChild("Knife")if k then for _,v in ipairs(P:GetPlayers())do if v~=plr and v.Character and v.Character:FindFirstChild("HumanoidRootPart")then hrp.CFrame=v.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,1)k:Activate()end end end end
    if S.dodge then local mm=fm()if mm and mm.Character and mm.Character:FindFirstChild("HumanoidRootPart")then if(mm.Character.HumanoidRootPart.Position-hrp.Position).Magnitude<20 then hum.Jump=true end end end
    if S.agun then local bp=plr:FindFirstChild("Backpack")if not ch:FindFirstChild("Gun")and not(bp and bp:FindFirstChild("Gun"))then for _,v in ipairs(W:GetDescendants())do if v.Name=="Gun"and(v:IsA("BasePart")or(v:IsA("Tool")and v:FindFirstChild("Handle")))then hrp.CFrame=v:IsA("BasePart")and v.CFrame or v.Handle.CFrame break end end end end
    if S.antiFling then hrp.CustomPhysicalProperties=PhysicalProperties.new(0.01,0,0,0,0)if hrp.Velocity.Magnitude>100 then hrp.Velocity=Vector3.zero end end
    if S.hitbox then for _,v in ipairs(P:GetPlayers())do if v~=plr and v.Character then for _,b in ipairs(v.Character:GetDescendants())do if b:IsA("BasePart")then b.Size=Vector3.new(10,10,10)end end end end end
    et=et+dt
    if et>=1 then
        et=0
        for _,v in ipairs(P:GetPlayers())do
            if v~=plr and v.Character then
                local hl=v.Character:FindFirstChild("HL")
                if S.esp then if not hl then hl=Instance.new("Highlight",v.Character)hl.Name="HL"hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop end local rr=role(v)if rr=="Murderer"then hl.FillColor=C.r elseif rr=="Sheriff"then hl.FillColor=C.b else hl.FillColor=C.g end elseif hl then hl:Destroy()end
                local b=v.Character:FindFirstChild("Head")and v.Character.Head:FindFirstChild("NM")
                if S.nameesp and not b then local bg=Instance.new("BillboardGui",v.Character.Head)bg.Name="NM"bg.Size=UDim2.new(0,100,0,20)bg.AlwaysOnTop=true local tt=Instance.new("TextLabel",bg)tt.Size=UDim2.new(1,0,1,0)tt.BackgroundTransparency=1 tt.Text=v.Name.." | "..role(v)tt.TextColor3=C.a tt.TextStrokeTransparency=0 elseif not S.nameesp and b then b:Destroy()end
            end
        end
    end
end)
game:GetService("StarterGui"):SetCore("SendNotification",{Title="AAR0N",Text="MAX версия загружена!",Duration=5})
