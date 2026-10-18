local P=game:GetService("Players")local U=game:GetService("UserInputService")local L=game:GetService("Lighting")local W=game:GetService("Workspace")local RS=game:GetService("RunService")local plr=P.LocalPlayer

pcall(function()local o=plr.PlayerGui:FindFirstChild("AAR0N4IK_Simple")if o then o:Destroy()end end)

-- Создаем простой интерфейс без градиентов
local gui=Instance.new("ScreenGui")
gui.Name="AAR0N4IK_Simple"
gui.ResetOnSpawn=false
gui.DisplayOrder=10
gui.Parent=plr:WaitForChild("PlayerGui")

local main=Instance.new("Frame",gui)
main.Size=UDim2.fromOffset(220,300)
main.Position=UDim2.new(0.5,-110,0.5,-150)
main.BackgroundColor3=Color3.fromRGB(25,15,40)
main.BorderSizePixel=0
Instance.new("UICorner",main).CornerRadius=UDim.new(0,10)

local title=Instance.new("TextLabel",main)
title.Size=UDim2.new(1,0,0,40)
title.BackgroundColor3=Color3.fromRGB(40,20,60)
title.Text="AAR0N4IK SIMPLE"
title.TextColor3=Color3.fromRGB(200,150,255)
title.Font=Enum.Font.GothamBold
title.TextSize=16
title.Parent=main
Instance.new("UICorner",title).CornerRadius=UDim.new(0,10)

-- Текстовое поле для команд
local txtBox=Instance.new("TextBox",main)
txtBox.Size=UDim2.new(0.9,0,0,40)
txtBox.Position=UDim2.new(0.05,0,0,50)
txtBox.BackgroundColor3=Color3.fromRGB(50,30,80)
txtBox.TextColor3=Color3.fromRGB(255,255,255)
txtBox.PlaceholderText="Введи команду (help)"
txtBox.PlaceholderColor3=Color3.fromRGB(150,150,150)
txtBox.Font=Enum.Font.Gotham
txtBox.TextSize=14
txtBox.Text=""
txtBox.ClearTextOnFocus=false
txtBox.Parent=main
Instance.new("UICorner",txtBox).CornerRadius=UDim.new(0,6)

local info=Instance.new("TextLabel",main)
info.Size=UDim2.new(1,0,0,180)
info.Position=UDim2.new(0,0,0,100)
info.BackgroundTransparency=1
info.Text="Команды:\nhelp - список\nspeed 100\njump 200\nesp - подсветка\nnoclip\nauto - стрельба\nbright"
info.TextColor3=Color3.fromRGB(200,200,200)
info.Font=Enum.Font.Gotham
info.TextSize=12
info.TextYAlignment=Enum.TextYAlignment.Top
info.Parent=main

-- ЛОГИКА
local function role(p)if not p or not p.Character then return"Innocent"end local bp=p:FindFirstChild("Backpack")if bp then if bp:FindFirstChild("Knife")then return"Murderer"end if bp:FindFirstChild("Gun")then return"Sheriff"end end local c=p.Character if c:FindFirstChild("Knife")then return"Murderer"end if c:FindFirstChild("Gun")then return"Sheriff"end return"Innocent"end
local function fm()for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character and role(p)=="Murderer"then return p end end end

local esp=false 
local function aE()for _,p in ipairs(P:GetPlayers())do if p.Character then local o=p.Character:FindFirstChild("AAR0N4IK_ESP")if o then o:Destroy()end end end if not esp then return end for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character then local h=Instance.new("Highlight")h.Name="AAR0N4IK_ESP"h.Adornee=p.Character h.FillTransparency=0.5 h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop local r=role(p)if r=="Murderer"then h.FillColor=Color3.new(1,0,0) elseif r=="Sheriff"then h.FillColor=Color3.new(0,0.5,1) else h.FillColor=Color3.new(0,1,0) end h.Parent=p.Character end end end 
task.spawn(function()while task.wait(1)do if esp then aE()end end end)

local noclip=false RS.Stepped:Connect(function() if noclip and plr.Character then for _,v in pairs(plr.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end)

local fbA,fbO=false,{}local function sf(on)if on and not fbA then fbA=true fbO.a=L.Ambient fbO.o=L.OutdoorAmbient fbO.f=L.FogEnd fbO.b=L.Brightness L.Ambient=Color3.new(1,1,1)L.OutdoorAmbient=Color3.new(1,1,1)L.FogEnd=1e6 L.Brightness=2 elseif not on and fbA then fbA=false L.Ambient=fbO.a L.OutdoorAmbient=fbO.o L.FogEnd=fbO.f L.Brightness=fbO.b end end

local ka=false task.spawn(function()while task.wait(0.1)do if ka then local c=plr.Character local k=c and c:FindFirstChild("Knife")if k then for _,p in ipairs(P:GetPlayers())do if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then if(p.Character.HumanoidRootPart.Position-c.HumanoidRootPart.Position).Magnitude<15 then pcall(function()k:Activate()end)end end end end end end end)

local as=false task.spawn(function()while task.wait(0.2)do if as then local c=plr.Character if c then local g=c:FindFirstChild("Gun")if g and g:IsA("Tool")then local m=fm()if m and m.Character then local h=m.Character:FindFirstChild("HumanoidRootPart")if h then pcall(function()local cm=W.CurrentCamera cm.CFrame=CFrame.new(cm.CFrame.Position,h.Position)g:Activate()end)end end end end end end end)

-- Обработка команд из TextBox
txtBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local cmd = txtBox.Text:lower()
        local args = string.split(cmd, " ")
        local c1 = args[1]

        if c1 == "help" then
            txtBox.Text = "speed, jump, esp, noclip, aura, auto, bright"
        elseif c1 == "speed" and args[2] then
            if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then plr.Character.Humanoid.WalkSpeed = tonumber(args[2]) end
            txtBox.Text = "Speed: " .. args[2]
        elseif c1 == "jump" and args[2] then
            if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then plr.Character.Humanoid.UseJumpPower=true; plr.Character.Humanoid.JumpPower = tonumber(args[2]) end
            txtBox.Text = "Jump: " .. args[2]
        elseif c1 == "esp" then
            esp = not esp; aE(); txtBox.Text = esp and "ESP ON" or "ESP OFF"
        elseif c1 == "noclip" then
            noclip = not noclip; txtBox.Text = noclip and "Noclip ON" or "Noclip OFF"
        elseif c1 == "bright" then
            local state = not fbA; sf(state); txtBox.Text = state and "Bright ON" or "Bright OFF"
        elseif c1 == "aura" then
            ka = not ka; txtBox.Text = ka and "Aura ON" or "Aura OFF"
        elseif c1 == "auto" then
            as = not as; txtBox.Text = as and "Auto-Shoot ON" or "Auto-Shoot OFF"
        else
            txtBox.Text = "Неизвестная команда"
        end
    end
end)

-- Перетаскивание окна (за заголовок)
local drag=false local startPos, startWinPos
title.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then drag=true startPos=i.Position startWinPos=main.Position end end)
U.InputChanged:Connect(function(i) if drag and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then local d=i.Position-startPos main.Position=UDim2.new(startWinPos.X.Scale,startWinPos.X.Offset+d.X,startWinPos.Y.Scale,startWinPos.Y.Offset+d.Y) end end)
U.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end end)

pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title="AAR0N4IK",Text="Простое меню загружено!",Duration=5})end)
