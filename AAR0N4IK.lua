-- MM2 kit — for AAR0N4IK
-- executor: any with fireproximityprompt (Synapse X / Krnl / Fluxus / SirHurt)
-- run: paste into executor console with MM2 loaded

local Players             = game:GetService("Players")
local Workspace           = game:GetService("Workspace")
local UserInputService    = game:GetService("UserInputService")
local RunService          = game:GetService("RunService")

local LP = Players.LocalPlayer
local OWNER = "AAR0N4IK"   -- sanity: warn if a different account runs this

if LP.Name ~= OWNER then
    warn(("[T-F] this is built for %s, running on %s anyway"):format(OWNER, LP.Name))
end

-- ── config ───────────────────────────────────────────────────────────
local config = {
    esp         = true,
    coins       = true,
    espRange    = 500,   -- studs; 0 = unlimited
    refresh     = 0.15,  -- esp re-scan interval
    coinPoll    = 0.25,  -- coin poll interval
    colors = {
        murderer = Color3.fromRGB(255, 40, 40),
        sheriff  = Color3.fromRGB(60, 140, 255),
        innocent = Color3.fromRGB(240, 240, 240),
    },
}

-- ── role detection ───────────────────────────────────────────────────
local function roleOf(plr)
    local char = plr.Character
    if not char then return nil end
    local bp = plr:FindFirstChildOfClass("Backpack")
    local containers = { char, bp }
    for _, c in ipairs(containers) do
        if not c then continue end
        for _, child in ipairs(c:GetChildren()) do
            if child:IsA("Tool") then
                if child.Name == "Knife" then return "murderer" end
                if child.Name == "Gun"   then return "sheriff"  end
            end
        end
    end
    return "innocent"
end

-- ── esp ──────────────────────────────────────────────────────────────
local highlights = {}

local function clearHighlight(plr)
    local h = highlights[plr]
    if h then h:Destroy(); highlights[plr] = nil end
end

local function applyESP()
    local myPos = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    myPos = myPos and myPos.Position

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr == LP then continue end
        local char = plr.Character
        local hrp  = char and char:FindFirstChild("HumanoidRootPart")
        if not char or not hrp or not char:FindFirstChildOfClass("Humanoid") then
            clearHighlight(plr)
            continue
        end
        if config.espRange > 0 and myPos and (hrp.Position - myPos).Magnitude > config.espRange then
            clearHighlight(plr)
            continue
        end

        local role  = roleOf(plr)
        local color = config.colors[role] or config.colors.innocent

        local h = highlights[plr]
        if not h or not h.Parent then
            h = Instance.new("Highlight")
            h.Name = "TF_HL"
            h.Adornee = char
            h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            h.FillTransparency = 0.55
            h.OutlineTransparency = 0
            h.Parent = char
            highlights[plr] = h
        end
        h.FillColor    = color
        h.OutlineColor = color
    end
end

-- ── coin farm ────────────────────────────────────────────────────────
local function collectCoins()
    if not config.coins then return end
    local ok, err = pcall(function()
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") then
                local at = (obj.ActionText  or ""):lower()
                local ot = (obj.ObjectText  or ""):lower()
                local par = obj.Parent and obj.Parent.Name:lower() or ""
                if at:find("collect") or ot:find("coin") or par:find("coin") then
                    pcall(fireproximityprompt, obj)
                end
            end
        end
    end)
    if not ok then warn("[T-F] coin pass failed: " .. tostring(err)) end
end

-- ── loops ────────────────────────────────────────────────────────────
task.spawn(function()
    while task.wait(config.refresh) do
        if config.esp then
            pcall(applyESP)
        else
            for plr in pairs(highlights) do clearHighlight(plr) end
        end
    end
end)

task.spawn(function()
    while task.wait(config.coinPoll) do
        if config.coins then collectCoins() end
    end
end)

Players.PlayerRemoving:Connect(clearHighlight)

-- ── hotkeys ──────────────────────────────────────────────────────────
-- RightShift = toggle ESP
-- RightCtrl  = toggle coin farm
-- RightAlt   = one-shot coin sweep (grab current spawn now)
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        config.esp = not config.esp
        print(("[T-F] ESP: %s"):format(tostring(config.esp)))
    elseif input.KeyCode == Enum.KeyCode.RightControl then
        config.coins = not config.coins
        print(("[T-F] Coins: %s"):format(tostring(config.coins)))
    elseif input.KeyCode == Enum.KeyCode.RightAlt then
        collectCoins()
        print("[T-F] coin sweep fired")
    end
end)

print(("[T-F] MM2 kit loaded for %s — RShift ESP / RCtrl coins / RAlt sweep"):format(OWNER))
