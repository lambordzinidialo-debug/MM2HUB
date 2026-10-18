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

pcall(function() if pg:FindFirstChild("AAR0N_Hub") then pg.AAR0N_Hub:Destroy() end end)

local C = {bg = Color3.fromRGB(15,10,20), bg2 = Color3.fromRGB(25,15,35), a = Color3.fromRGB(168,85,247), a2 = Color3.fromRGB(236,72,153), t = Color3.fromRGB(255,255,255), sub = Color3.fromRGB(180,170,200), r = Color3.fromRGB(255,60,60), b = Color3.fromRGB(60,150,255), g = Color3.fromRGB(60,220,100)}

local function addClick(btn, func)
    btn.MouseButton1Click:Connect(func)
    btn.TouchTap:Connect(func)
end

local gui = Instance.new("ScreenGui", pg)
gui.Name = "AAR0N_Hub" gui.ResetOnSpawn = false gui.DisplayOrder = 100

local aBtn = Instance.new("TextButton", gui)
aBtn.Size = UDim2.fromOffset(60,60) aBtn.Position = UDim2.new(0.5,0,0.5,0) aBtn.AnchorPoint = Vector2.new(0.5,0.5) aBtn.BackgroundColor3 = C.a aBtn.Text = "A" aBtn.TextColor3 = C.t aBtn.Font = Enum.Font.GothamBlack aBtn.TextSize = 28 aBtn.Visible = false
Instance.new("UICorner", aBtn).CornerRadius = UDim.new(0,30)

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0.85,0,0.7,0) main.Position = UDim2.new(0.5,0,0.5,0) main.AnchorPoint = Vector2.new(0.5,0.5) main.BackgroundColor3 = C.bg
Instance.new("UICorner", main).CornerRadius = UDim.new(0,12) Instance.new("UIStroke", main).Color = C.a

local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,40) top.BackgroundColor3 = C.bg2 Instance.new("UICorner", top).CornerRadius = UDim.new(0,12) top.Parent = main
local title = Instance.new("TextLabel", top) title.Size = UDim2.new(1,-40,1,0) title.BackgroundTransparency = 1 title.Text = "AAR0N4IK | EXCLUSIVE" title.TextColor3 = C.a title.Font = Enum.Font.GothamBlack title.TextSize = 15 title.Parent = top
local close = Instance.new("TextButton", top) close.Size = UDim2.fromOffset(30,30) close.Position = UDim2.new(1,-35,0.5,-15) close.BackgroundColor3 = C.r close.Text = "×" close.TextColor3 = C.t close.Font = Enum.Font.GothamBold close.TextSize = 20 Instance.new("UICorner", close).CornerRadius = UDim.new(0,6) close.Parent = top

addClick(close,function() main.Visible = false aBtn.Visible = true end)
addClick(aBtn,function() main.Visible = true aBtn.Visible = false end)

local side = Instance.new("Frame", main) side.Size = UDim2.new(0.25,-5,1,-45) side.Position = UDim2.new(0,5,0,45) side.BackgroundTransparency = 1 side.Parent = main
Instance.new("UIListLayout", side).Padding = UDim.new(0,6)
local cont = Instance.new("Frame", main) cont.Size = UDim2.new(0.75,-5,1,-55) cont.Position = UDim2.new(0.25,0,0,50) cont.BackgroundTransparency = 1 cont.Parent = main

local tabs = {}
local function mTab(nm,ic)
    local b = Instance.new("TextButton", side) b.Size = UDim2.new(1,-10,0,36) b.BackgroundColor3 = C.bg2 b.Text = ic.." "..nm b.TextColor3 = C.t b.Font = Enum.Font.GothamBold b.TextSize = 13 Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    local p = Instance.new("ScrollingFrame", cont) p.Size = UDim2.new(1,0,1,0) p.BackgroundTransparency = 1 p.ScrollBarThickness = 3 p.ScrollBarImageColor3 = C.a p.CanvasSize = UDim2.new() p.AutomaticCanvasSize = Enum.AutomaticSize.Y p.Visible = false Instance.new("UIListLayout", p).Padding = UDim.new(0,4)
    table.insert(tabs, {b=b, p=p})
    addClick(b, function() for _,x in ipairs(tabs) do x.p.Visible = false x.b.BackgroundColor3 = C.bg2 end p.Visible = true b.BackgroundColor3 = C.a end)
    if #tabs == 1 then p.Visible = true b.BackgroundColor3 = C.a end return p
end

local function mTog(pr,tx,cb)
    local f = Instance.new("Frame", pr) f.Size = UDim2.new(1,-5,0,36) f.BackgroundColor3 = C.bg2 Instance.new("UICorner", f).CornerRadius = UDim.new(0,8)
    local l = Instance.new("TextLabel", f) l.Size = UDim2.new(1,-50,1,0) l.Position = UDim2.fromOffset(10,0) l.BackgroundTransparency = 1 l.Text = tx l.TextColor3 = C.t l.Font = Enum.Font.Gotham l.TextSize = 13 l.TextXAlignment = Enum.TextXAlignment.Left l.Parent = f
    local bg = Instance.new("Frame", f) bg.Size = UDim2.fromOffset(36,18) bg.Position = UDim2.new(1,-46,0.5,-9) bg.BackgroundColor3 = C.bg Instance.new("UICorner", bg).CornerRadius = UDim.new(0,9) bg.Parent = f
    local kn = Instance.new("Frame", bg) kn.Size = UDim2.fromOffset(14,14) kn.Position = UDim2.fromOffset(2,2) kn.BackgroundColor3 = C.t Instance.new("UICorner", kn).CornerRadius = UDim.new(0,7) kn.Parent = bg
    local s = false local b = Instance.new("TextButton", f) b.Size = UDim2.fromScale(1,1) b.BackgroundTransparency = 1 b.Text = "" b.Parent = f
    addClick(b, function() s = not s bg.BackgroundColor3 = s and C.a or C.bg kn.Position = s and UDim2.new(1,-16,0.5,-7) or UDim2.fromOffset(2,2) if cb then cb(s) end end)
end

local function mBtn(pr,tx,cb)
    local b = Instance.new("TextButton", pr) b.Size = UDim2.new(1,-5,0,36) b.BackgroundColor3 = C.bg2 b.Text = tx b.TextColor3 = C.a b.Font = Enum.Font.GothamBold b.TextSize = 13 Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    addClick(b,cb)
end

local function mBox(pr,ph,cb)
    local b = Instance.new("TextBox", pr) b.Size = UDim2.new(1,-5,0,36) b.BackgroundColor3 = C.bg2 b.PlaceholderText = ph b.PlaceholderColor3 = C.t b.TextColor3 = C.t b.Font = Enum.Font.Gotham b.TextSize = 13 b.Text = "" Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)
    b.FocusLost:Connect(function(e) if e and tonumber(b.Text) then cb(tonumber(b.Text)) end end)
end

local t1 = mTab("Main","🏃") local t2 = mTab("Visual","👁") local t3 = mTab("Combat","⚔️") local t4 = mTab("Players","👥") local t5 = mTab("Emote","💃") local t6 = mTab("Misc","🌐")

local fly=false, noclip=false, esp=false, hbExp=false, aura=false, silentAim=false, autoGun=false, infjump=false, antiFling=false, autoDodge=false
local flySpeed=50

local function role(p) if not p or not p.Character then return"Innocent"end local bp=p:FindFirstChild("Backpack") if bp and bp:FindFirstChild("Knife")then return"Murderer"end if bp and bp:FindFirstChild("Gun")then return"Sheriff"end return"Innocent"end
local function fm() for _,p in ipairs(P:GetPlayers()) do if p~=plr and p.Character and role(p)=="Murderer"then return p end end end

-- MAIN
mTog(t1, "Noclip", function(s) noclip=s end)
mTog(t1, "Fly (Джойстик)", function(s) fly=s end)
mBox(t1, "Скорость полета", function(n) flySpeed=n end)
mBox(t1, "Скорость ходьбы", function(n) if plr.Character then plr.Character.Humanoid.WalkSpeed=n end end)
mBox(t1, "Высота прыжка", function(n) if plr.Character then plr.Character.Humanoid.UseJumpPower=true; plr.Character.Humanoid.JumpPower=n end end)
mTog(t1, "Infinite Jump", function(s) infjump=s end)
mTog(t1, "Anti-AFK", function(s) if s then plr.Idled:Connect(function() VU:CaptureController() VU:ClickButton2(Vector2.new()) end) end end)

-- VISUAL
mTog(t2, "See Roles (ESP)", function(s) esp=s end)
mTog(t2, "Hitbox Expander", function(s) hbExp=s end)
mTog(t2, "Fullbright", function(s) L.Ambient=s and Color3.new(1,1,1) or Color3.new(0.5,0.5,0.5) L.OutdoorAmbient=s and Color3.new(1,1,1) or Color3.new(0.5,0.5,0.5) end)

-- COMBAT
mTog(t3, "Melee Aura", function(s) aura=s end)
mTog(t3, "Silent Aim (Шериф)", function(s) silentAim=s end)
mTog(t3, "Auto Dropped Gun", function(s) autoGun=s end)
mTog(t3, "Auto-Dodge", function(s) autoDodge=s end)

-- PLAYERS
local function fling(t) if t and t.Character then local h=t.Character:FindFirstChild("HumanoidRootPart") if h then local b=Instance.new("BodyAngularVelocity",h) b.AngularVelocity=Vector3.new(99999,99999,99999) b.MaxTorque=Vector3.new(math.huge,math.huge,math.huge) task.delay(1,function() b:Destroy() end) end end end
local function upd() 
    for _,c in ipairs(t4:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end 
    for _,p in ipairs(P:GetPlayers()) do if p~=plr then 
        local f=Instance.new("Frame",t4) f.Size=UDim2.new(1,-5,0,35) f.BackgroundColor3=C.bg2 Instance.new("UICorner",f).CornerRadius=UDim.new(0,6) 
        local l=Instance.new("TextLabel",f) l.Size=UDim2.new(0.5,0,1,0) l.Position=UDim2.fromOffset(5,0) l.BackgroundTransparency=1 l.Text=p.Name l.TextColor3=C.t l.Font=Enum.Font.Gotham l.TextSize=12 l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=f 
        local tp=Instance.new("TextButton",f) tp.Size=UDim2.new(0.2,0,0.7,0) tp.Position=UDim2.new(0.55,0,0.15,0) tp.BackgroundColor3=C.a tp.Text="TP" tp.TextColor3=C.t tp.Font=Enum.Font.GothamBold tp.TextSize=12 Instance.new("UICorner",tp).CornerRadius=UDim.new(0,4) tp.Parent=f 
        addClick(tp,function() if p.Character and plr.Character then plr.Character.HumanoidRootPart.CFrame=p.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,3) end end) 
        local fl=Instance.new("TextButton",f) fl.Size=UDim2.new(0.2,0,0.7,0) fl.Position=UDim2.new(0.77,0,0.15,0) fl.BackgroundColor3=C.r fl.Text="Fling" fl.TextColor3=C.t fl.Font=Enum.Font.GothamBold fl.TextSize=12 Instance.new("UICorner",fl).CornerRadius=UDim.new(0,4) fl.Parent=f 
        addClick(fl,function() fling(p) end) 
    end end 
end
upd() task.spawn(function() while task.wait(5) do upd() end end)
mBtn(t4, "Fling All", function() for _,p in ipairs(P:GetPlayers()) do if p~=plr then fling(p) end end end)

-- EMOTES
local function playAnim(id) local c=plr.Character if c and c:FindFirstChildOfClass("Humanoid") then local a=Instance.new("Animation") a.AnimationId="rbxassetid://"..tostring(id) local an=c.Humanoid:FindFirstChildOfClass("Animator") if an then local tr=an:LoadAnimation(a) tr:Play() end end end
mBtn(t5, "Floss", function() playAnim(5915694204) end) 
mBtn(t5, "Dab", function() playAnim(2482632600) end) 
mBtn(t5, "Orange Justice", function() playAnim(3264923498) end) 
mBtn(t5, "Default Dance", function() playAnim(507771019) end) 
mBtn(t5, "Gangnam Style", function() playAnim(4341064546) end) 
mBtn(t5, "Macarena", function() playAnim(1286874805) end) 
mBtn(t5, "Russian Dance", function() playAnim(7823163342) end) 
mBtn(t5, "Zombie Walk", function() playAnim(616163682) end) 
mBtn(t5, "Levitate", function() playAnim(3132104140) end) 
mBtn(t5, "Hacker Dance", function() playAnim(13121459905) end) 
mBtn(t5, "Moonwalk", function() playAnim(8299783018) end) 
mBtn(t5, "Salute", function() playAnim(3382359835) end) 
mBtn(t5, "Shuffle", function() playAnim(8036852701) end) 
mBtn(t5, "Electro Shuffle", function() playAnim(5102713912) end) 
mBtn(t5, "Best Mates", function() playAnim(6692709646) end)
mBtn(t5, "Twerk", function() playAnim(5828553173) end)
mBtn(t5, "Breakdance", function() playAnim(3412021141) end)

-- MISC
mTog(t6, "Anti-Fling", function(s) antiFling=s end)
mBtn(t6, "Server Hop", function() local ok,d=pcall(function() return HS:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?limit=100")) end) if ok and d and d.data then for _,s in ipairs(d.data) do if s.playing<s.maxPlayers and s.id~=game.JobId then TS:TeleportToPlaceInstance(game.PlaceId,s.id,plr) return end end end end)
mBtn(t6, "Rejoin", function() TS:Teleport(game.PlaceId,plr) end)
mBtn(t6, "Time Day", function() L.ClockTime=12 end)
mBtn(t6, "Time Night", function() L.ClockTime=0 end)
mBtn(t6, "Destroy UI", function() gui:Destroy() end)

-- ЕДИНЫЙ ЦИКЛ (ОПТИМИЗАЦИЯ)
local espTimer = 0
RS.Heartbeat:Connect(function(dt)
    local c = plr.Character if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart") local hum = c:FindFirstChildOfClass("Humanoid") if not hrp or not hum then return end

    if noclip then for _,v in pairs(c:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end
    
    if fly then
        hum.PlatformStand = true
        local bv = hrp:FindFirstChildOfClass("BodyVelocity")
        if not bv then bv = Instance.new("BodyVelocity", hrp) bv.MaxForce = Vector3.new(1e5,1e5,1e5) end
        if hum.MoveDirection.Magnitude > 0 then bv.Velocity = hum.MoveDirection * flySpeed else bv.Velocity = Vector3.zero end
    elseif not fly and hum.PlatformStand then
        hum.PlatformStand = false
        local bv = hrp:FindFirstChildOfClass("BodyVelocity") if bv then bv:Destroy() end
    end

    if hbExp then for _,p in ipairs(P:GetPlayers()) do if p~=plr and p.Character then for _,v in ipairs(p.Character:GetDescendants()) do if v:IsA("BasePart") then v.Size=Vector3.new(10,10,10) end end end end end
    
    if aura then local k=c:FindFirstChild("Knife") if k then for _,p in ipairs(P:GetPlayers()) do if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then if (p.Character.HumanoidRootPart.Position-hrp.Position).Magnitude<15 then k:Activate() end end end end end
    
    if silentAim then local m=fm() if m and m.Character and m.Character:FindFirstChild("HumanoidRootPart") then W.CurrentCamera.CFrame=CFrame.lookAt(W.CurrentCamera.CFrame.Position,m.Character.HumanoidRootPart.Position) end end
    
    if autoDodge then local m=fm() if m and m.Character and m.Character:FindFirstChild("HumanoidRootPart") then if (m.Character.HumanoidRootPart.Position-hrp.Position).Magnitude<20 then hum.Jump=true end end end

    if autoGun then
        local bp = plr:FindFirstChild("Backpack")
        if not c:FindFirstChild("Gun") and not (bp and bp:FindFirstChild("Gun")) then
            for _, v in ipairs(W:GetDescendants()) do if v.Name == "Gun" and (v:IsA("BasePart") or (v:IsA("Tool") and v:FindFirstChild("Handle"))) then hrp.CFrame = (v:IsA("BasePart") and v.CFrame or v.Handle.CFrame) break end end
        end
    end
    
    if antiFling then hrp.CustomPhysicalProperties = PhysicalProperties.new(0.01,0,0,0,0) if hrp.Velocity.Magnitude > 100 then hrp.Velocity = Vector3.zero end end

    espTimer = espTimer + dt
    if espTimer >= 1 then
        espTimer = 0
        for _,p in ipairs(P:GetPlayers()) do
            if p~=plr and p.Character then
                local hl = p.Character:FindFirstChild("AAR0N_ESP")
                if esp then
                    if not hl then hl = Instance.new("Highlight", p.Character) hl.Name = "AAR0N_ESP" hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop end
                    local r = role(p) if r=="Murderer" then hl.FillColor=C.r elseif r=="Sheriff" then hl.FillColor=C.b else hl.FillColor=C.g end
                elseif hl then hl:Destroy() end
            end
        end
    end
end)

pcall(function() game:GetService("StarterGui"):SetCore("SendNotification",{Title="AAR0N4IK",Text="Exclusive Hub загружен!",Duration=5}) end)
