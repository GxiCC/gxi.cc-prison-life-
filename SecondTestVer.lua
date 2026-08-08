--------------------------------------------------
-- SERVICES
--------------------------------------------------
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

--------------------------------------------------
-- VARIABLES & COLORS
--------------------------------------------------
local sakuraColor = Color3.fromRGB(255, 183, 197)
local whiteColor = Color3.fromRGB(230, 230, 230)
local blackColor = Color3.fromRGB(12, 12, 12)
local panelColor = Color3.fromRGB(18, 18, 18)
local darkBoxColor = Color3.fromRGB(22, 22, 22)
local strokeColor = Color3.fromRGB(38, 38, 38)
local mutedTextColor = Color3.fromRGB(140, 140, 140)

--------------------------------------------------
-- GUI INITIALIZATION
--------------------------------------------------
local GxiUI = Instance.new("ScreenGui")
GxiUI.Name = "GxiUI_Dark"
GxiUI.Parent = CoreGui

-- ================= Вотермарка ================= --
local Watermark = Instance.new("Frame")
Watermark.Name = "Watermark"
Watermark.Parent = GxiUI
Watermark.BackgroundColor3 = panelColor
Watermark.BackgroundTransparency = 0.2
Watermark.Position = UDim2.new(0, 10, 0, 10)
Watermark.Size = UDim2.new(0, 0, 0, 22)
Watermark.AutomaticSize = Enum.AutomaticSize.X

local WatermarkCorner = Instance.new("UICorner", Watermark)
WatermarkCorner.CornerRadius = UDim.new(0, 4)

local WatermarkStroke = Instance.new("UIStroke", Watermark)
WatermarkStroke.Color = strokeColor
WatermarkStroke.Thickness = 1

local WatermarkPadding = Instance.new("UIPadding", Watermark)
WatermarkPadding.PaddingLeft = UDim.new(0, 8)
WatermarkPadding.PaddingRight = UDim.new(0, 8)

local WatermarkList = Instance.new("UIListLayout", Watermark)
WatermarkList.FillDirection = Enum.FillDirection.Horizontal
WatermarkList.SortOrder = Enum.SortOrder.LayoutOrder
WatermarkList.Padding = UDim.new(0, 6)
WatermarkList.VerticalAlignment = Enum.VerticalAlignment.Center

local TitleBtn = Instance.new("TextButton", Watermark)
TitleBtn.Name = "TitleBtn"
TitleBtn.BackgroundTransparency = 1
TitleBtn.Size = UDim2.new(0, 0, 1, 0)
TitleBtn.AutomaticSize = Enum.AutomaticSize.X
TitleBtn.Text = ""
TitleBtn.AutoButtonColor = false

local TitleList = Instance.new("UIListLayout", TitleBtn)
TitleList.FillDirection = Enum.FillDirection.Horizontal
TitleList.SortOrder = Enum.SortOrder.LayoutOrder
TitleList.VerticalAlignment = Enum.VerticalAlignment.Center

local WatermarkText1 = Instance.new("TextLabel", TitleBtn)
WatermarkText1.BackgroundTransparency = 1
WatermarkText1.AutomaticSize = Enum.AutomaticSize.X
WatermarkText1.Size = UDim2.new(0, 0, 1, 0)
WatermarkText1.Font = Enum.Font.GothamBold
WatermarkText1.Text = "Gxi."
WatermarkText1.TextColor3 = sakuraColor
WatermarkText1.TextSize = 10

local WatermarkText2 = Instance.new("TextLabel", TitleBtn)
WatermarkText2.BackgroundTransparency = 1
WatermarkText2.AutomaticSize = Enum.AutomaticSize.X
WatermarkText2.Size = UDim2.new(0, 0, 1, 0)
WatermarkText2.Font = Enum.Font.GothamBold
WatermarkText2.Text = "cc"
WatermarkText2.TextColor3 = whiteColor
WatermarkText2.TextSize = 10

local FpsLabel = Instance.new("TextLabel", Watermark)
FpsLabel.BackgroundTransparency = 1
FpsLabel.AutomaticSize = Enum.AutomaticSize.X
FpsLabel.Size = UDim2.new(0, 0, 1, 0)
FpsLabel.Font = Enum.Font.Gotham
FpsLabel.Text = "60 fps"
FpsLabel.TextColor3 = mutedTextColor
FpsLabel.TextSize = 10

local PingLabel = Instance.new("TextLabel", Watermark)
PingLabel.BackgroundTransparency = 1
PingLabel.AutomaticSize = Enum.AutomaticSize.X
PingLabel.Size = UDim2.new(0, 0, 1, 0)
PingLabel.Font = Enum.Font.Gotham
PingLabel.Text = "0 ms"
PingLabel.TextColor3 = mutedTextColor
PingLabel.TextSize = 10

task.spawn(function()
    local lastTime = os.clock()
    local frameCount = 0
    RunService.RenderStepped:Connect(function()
        frameCount = frameCount + 1
        local currentTime = os.clock()
        if currentTime - lastTime >= 1 then
            local fps = math.floor(frameCount / (currentTime - lastTime))
            FpsLabel.Text = tostring(fps) .. " fps"
            frameCount = 0
            lastTime = currentTime
            
            local ping = 0
            pcall(function()
                ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
            end)
            PingLabel.Text = tostring(ping) .. " ms"
        end
    end)
end)

-- ================= Главное окно ================= --
local MainFrame = Instance.new("CanvasGroup")
MainFrame.Name = "MainFrame"
MainFrame.Parent = GxiUI
MainFrame.BackgroundColor3 = blackColor
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
MainFrame.Size = UDim2.new(0, 450, 0, 300)
MainFrame.ClipsDescendants = true
MainFrame.Visible = false
MainFrame.GroupTransparency = 1

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 4)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = strokeColor
MainStroke.Thickness = 1.5

local ContentArea = Instance.new("Frame", MainFrame)
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -16, 1, -52)
ContentArea.Position = UDim2.new(0, 8, 0, 8)
ContentArea.BackgroundTransparency = 1

local BottomBar = Instance.new("Frame", MainFrame)
BottomBar.Name = "BottomBar"
BottomBar.Size = UDim2.new(1, -16, 0, 28)
BottomBar.Position = UDim2.new(0, 8, 1, -36)
BottomBar.BackgroundColor3 = panelColor

local BottomBarCorner = Instance.new("UICorner", BottomBar)
BottomBarCorner.CornerRadius = UDim.new(0, 3)

local BottomBarStroke = Instance.new("UIStroke", BottomBar)
BottomBarStroke.Color = strokeColor
BottomBarStroke.Thickness = 1

local BottomBarList = Instance.new("UIListLayout", BottomBar)
BottomBarList.FillDirection = Enum.FillDirection.Horizontal
BottomBarList.HorizontalAlignment = Enum.HorizontalAlignment.Center
BottomBarList.VerticalAlignment = Enum.VerticalAlignment.Center
BottomBarList.Padding = UDim.new(0, 10)

local tabs = {}

local function CreateTab(name)
    local tabBtn = Instance.new("TextButton", BottomBar)
    tabBtn.Size = UDim2.new(0, 80, 1, -6)
    tabBtn.BackgroundTransparency = 1
    tabBtn.Text = name:lower()
    tabBtn.Font = Enum.Font.Gotham
    tabBtn.TextColor3 = mutedTextColor
    tabBtn.TextSize = 11
    tabBtn.AutoButtonColor = false
    
    local tabFrame = Instance.new("Frame", ContentArea)
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.Visible = false
    
    local leftCol = Instance.new("ScrollingFrame", tabFrame)
    leftCol.Size = UDim2.new(0.49, -4, 1, 0)
    leftCol.Position = UDim2.new(0, 0, 0, 0)
    leftCol.BackgroundColor3 = panelColor
    leftCol.BorderSizePixel = 0
    leftCol.ScrollBarThickness = 2
    leftCol.ScrollBarImageColor3 = sakuraColor
    Instance.new("UICorner", leftCol).CornerRadius = UDim.new(0, 3)
    Instance.new("UIStroke", leftCol).Color = strokeColor
    
    local leftList = Instance.new("UIListLayout", leftCol)
    leftList.SortOrder = Enum.SortOrder.LayoutOrder
    leftList.Padding = UDim.new(0, 6)
    
    local leftPad = Instance.new("UIPadding", leftCol)
    leftPad.PaddingTop = UDim.new(0, 8)
    leftPad.PaddingLeft = UDim.new(0, 8)
    leftPad.PaddingRight = UDim.new(0, 8)
    
    local rightCol = Instance.new("ScrollingFrame", tabFrame)
    rightCol.Size = UDim2.new(0.49, -4, 1, 0)
    rightCol.Position = UDim2.new(0.51, 4, 0, 0)
    rightCol.BackgroundColor3 = panelColor
    rightCol.BorderSizePixel = 0
    rightCol.ScrollBarThickness = 2
    rightCol.ScrollBarImageColor3 = sakuraColor
    Instance.new("UICorner", rightCol).CornerRadius = UDim.new(0, 3)
    Instance.new("UIStroke", rightCol).Color = strokeColor
    
    local rightList = Instance.new("UIListLayout", rightCol)
    rightList.SortOrder = Enum.SortOrder.LayoutOrder
    rightList.Padding = UDim.new(0, 6)
    
    local rightPad = Instance.new("UIPadding", rightCol)
    rightPad.PaddingTop = UDim.new(0, 8)
    rightPad.PaddingLeft = UDim.new(0, 8)
    rightPad.PaddingRight = UDim.new(0, 8)

    table.insert(tabs, {
        Button = tabBtn, 
        Frame = tabFrame, 
        Left = leftCol, 
        Right = rightCol
    })
    
    tabBtn.MouseButton1Click:Connect(function()
        for _, tab in ipairs(tabs) do
            if tab.Button == tabBtn then
                tab.Button.TextColor3 = whiteColor
                tab.Frame.Visible = true
            else
                tab.Button.TextColor3 = mutedTextColor
                tab.Frame.Visible = false
            end
        end
    end)
    
    return leftCol, rightCol
end

-- ================= Конструкторы элементов UI ================= --

local function CreateSectionHeader(parent, text)
    local label = Instance.new("TextLabel", parent)
    label.Size = UDim2.new(1, 0, 0, 16)
    label.BackgroundTransparency = 1
    label.Text = text:lower()
    label.Font = Enum.Font.GothamBold
    label.TextColor3 = whiteColor
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
end

local function CreateSquareToggle(parent, text, default, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 16)
    frame.BackgroundTransparency = 1
    
    local box = Instance.new("TextButton", frame)
    box.Size = UDim2.new(0, 12, 0, 12)
    box.Position = UDim2.new(0, 0, 0.5, -6)
    box.BackgroundColor3 = darkBoxColor
    box.BorderColor3 = strokeColor
    box.BorderSizePixel = 1
    box.Text = ""
    box.AutoButtonColor = false
    
    local innerFill = Instance.new("Frame", box)
    innerFill.Size = UDim2.new(1, -4, 1, -4)
    innerFill.Position = UDim2.new(0, 2, 0, 2)
    innerFill.BackgroundColor3 = sakuraColor
    innerFill.BorderSizePixel = 0
    innerFill.Visible = default or false
    
    local label = Instance.new("TextButton", frame)
    label.Size = UDim2.new(1, -18, 1, 0)
    label.Position = UDim2.new(0, 18, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text:lower()
    label.Font = Enum.Font.Gotham
    label.TextColor3 = default and whiteColor or mutedTextColor
    label.TextSize = 10
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local state = default or false
    
    local function toggle()
        state = not state
        innerFill.Visible = state
        label.TextColor3 = state and whiteColor or mutedTextColor
        if callback then
            callback(state)
        end
    end
    
    box.MouseButton1Click:Connect(toggle)
    label.MouseButton1Click:Connect(toggle)
end

local function CreateSlider(parent, text, min, max, defaultVal, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 26)
    frame.BackgroundTransparency = 1
    
    local val = defaultVal or min
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 0, 12)
    label.BackgroundTransparency = 1
    label.Text = text:lower() .. ": " .. tostring(val)
    label.Font = Enum.Font.Gotham
    label.TextColor3 = mutedTextColor
    label.TextSize = 10
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local sliderBg = Instance.new("TextButton", frame)
    sliderBg.Size = UDim2.new(1, 0, 0, 4)
    sliderBg.Position = UDim2.new(0, 0, 0, 16)
    sliderBg.BackgroundColor3 = darkBoxColor
    sliderBg.BorderColor3 = strokeColor
    sliderBg.BorderSizePixel = 1
    sliderBg.Text = ""
    sliderBg.AutoButtonColor = false
    
    local fill = Instance.new("Frame", sliderBg)
    local startPercent = math.clamp((val - min) / (max - min), 0, 1)
    fill.Size = UDim2.new(startPercent, 0, 1, 0)
    fill.BackgroundColor3 = sakuraColor
    fill.BorderSizePixel = 0
    
    local dragging = false
    
    local function update(input)
        local pos = input.Position.X
        local bgPos = sliderBg.AbsolutePosition.X
        local bgWidth = sliderBg.AbsoluteSize.X
        local percent = math.clamp((pos - bgPos) / bgWidth, 0, 1)
        local currentVal = math.floor(min + (max - min) * percent)
        
        fill.Size = UDim2.new(percent, 0, 1, 0)
        label.Text = text:lower() .. ": " .. tostring(currentVal)
        if callback then
            callback(currentVal)
        end
    end
    
    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            update(input)
        end
    end)
    
    sliderBg.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)
end

local function CreateDropdown(parent, text, options, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1, 0, 0, 30)
    frame.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 0, 12)
    label.BackgroundTransparency = 1
    label.Text = text:lower()
    label.Font = Enum.Font.Gotham
    label.TextColor3 = mutedTextColor
    label.TextSize = 10
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local btnContainer = Instance.new("Frame", frame)
    btnContainer.Size = UDim2.new(1, 0, 0, 14)
    btnContainer.Position = UDim2.new(0, 0, 0, 14)
    btnContainer.BackgroundTransparency = 1
    
    local layout = Instance.new("UIListLayout", btnContainer)
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.Padding = UDim.new(0, 4)
    
    for i, opt in ipairs(options) do
        local btn = Instance.new("TextButton", btnContainer)
        btn.Size = UDim2.new(0, 48, 1, 0)
        btn.BackgroundColor3 = darkBoxColor
        btn.BorderColor3 = strokeColor
        btn.BorderSizePixel = 1
        btn.Text = opt:lower()
        btn.Font = Enum.Font.Gotham
        btn.TextColor3 = (i == 1) and sakuraColor or mutedTextColor
        btn.TextSize = 9
        
        btn.MouseButton1Click:Connect(function()
            for _, child in ipairs(btnContainer:GetChildren()) do
                if child:IsA("TextButton") then
                    child.TextColor3 = mutedTextColor
                end
            end
            btn.TextColor3 = sakuraColor
            if callback then
                callback(opt)
            end
        end)
    end
end

-- ================= Наполнение вкладок ================= --

-- 1. Вкладка RAGE
local rageLeft, rageRight = CreateTab("rage")

CreateSectionHeader(rageLeft, "silent aim")
CreateSquareToggle(rageLeft, "enabled", false, function(s) _G.SilentAimEnabled = s end)
CreateDropdown(rageLeft, "target part", {"Head", "Torso", "HRP"}, function(p) 
    _G.SilentAimTargetPart = (p == "HRP") and "HumanoidRootPart" or p 
end)
CreateSquareToggle(rageLeft, "team check", true, function(s) _G.TeamCheckEnabled = s end)
CreateSquareToggle(rageLeft, "wall check", true, function(s) _G.WallCheckEnabled = s end)

CreateSectionHeader(rageRight, "aimbot & fov")
CreateSquareToggle(rageRight, "aimbot", false, function(s) _G.AimBotEnabled = s end)
CreateDropdown(rageRight, "aimbot part", {"Head", "Torso"}, function(p) _G.AimBotTargetPart = p end)
CreateSquareToggle(rageRight, "draw fov", false, function(s) _G.FovEnabled = s end)
CreateDropdown(rageRight, "fov mode", {"Move", "Static"}, function(m) _G.FovMode = m end)
CreateSlider(rageRight, "fov radius", 10, 600, 150, function(v) _G.FovRadius = v end)

-- 2. Вкладка VISUALS
local visLeft, visRight = CreateTab("visuals")

CreateSectionHeader(visLeft, "chams")
CreateSquareToggle(visLeft, "enabled", false, function(s)
    if _G.ToggleChams then _G.ToggleChams(s) end
end)
CreateSquareToggle(visLeft, "team check", true, function(s) _G.ChamsTeamCheck = s end)
CreateSlider(visLeft, "chams transparency", 0, 100, 40, function(v)
    _G.ChamsTransparency = v / 100
end)

CreateSectionHeader(visRight, "other visuals")
CreateSquareToggle(visRight, "custom cursor", false, function(s)
    if _G.ToggleCustomCursor then _G.ToggleCustomCursor(s) end
end)

-- 3. Вкладка MISC
local miscLeft, miscRight = CreateTab("misc")

CreateSectionHeader(miscLeft, "character")
CreateSquareToggle(miscLeft, "fake headless", false, function(s)
    if _G.ToggleFakeHeadless then _G.ToggleFakeHeadless(s) end
end)

-- 4. Вкладка ANTI-AIM
local aaLeft, aaRight = CreateTab("anti-aim")

CreateSectionHeader(aaLeft, "spin / jitter")
CreateSquareToggle(aaLeft, "enabled", false, function(s)
    if _G.ToggleAntiAim then _G.ToggleAntiAim(s) end
end)
CreateSlider(aaLeft, "speed", 1, 10, 3, function(v)
    if _G.SetAntiAimSpeed then _G.SetAntiAimSpeed(v) end
end)

tabs[1].Button.TextColor3 = whiteColor
tabs[1].Frame.Visible = true

TitleBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if MainFrame.GroupTransparency >= 0.9 or not MainFrame.Visible then
            MainFrame.Visible = true
            TweenService:Create(MainFrame, TweenInfo.new(0.3), {GroupTransparency = 0}):Play()
        else
            local tw = TweenService:Create(MainFrame, TweenInfo.new(0.3), {GroupTransparency = 1})
            tw:Play()
            tw.Completed:Connect(function()
                if MainFrame.GroupTransparency == 1 then MainFrame.Visible = false end
            end)
        end
    end
end)

task.spawn(function()
    MainFrame.Visible = true
    TweenService:Create(MainFrame, TweenInfo.new(0.5), {GroupTransparency = 0}):Play()
end)

--------------------------------------------------
-- HELPER FUNCTIONS (Team & Wall Check)
--------------------------------------------------
local function GetTeamColor(player)
    if player and player.Team then
        return player.Team.TeamColor.Color
    end
    return Color3.fromRGB(255, 255, 255)
end

local function IsEnemy(player)
    if not player or player == Players.LocalPlayer then return false end
    local localPlayer = Players.LocalPlayer
    if not localPlayer.Team or not player.Team then return true end
    if localPlayer.Team == player.Team then return false end
    return true
end

local function IsVisible(targetPart)
    local camera = workspace.CurrentCamera
    if not camera or not targetPart then return false end

    local origin = camera.CFrame.Position
    local destination = targetPart.Position
    local direction = destination - origin

    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    
    local ignoreList = {camera}
    if Players.LocalPlayer.Character then
        table.insert(ignoreList, Players.LocalPlayer.Character)
    end
    if targetPart.Parent then
        table.insert(ignoreList, targetPart.Parent)
    end

    raycastParams.FilterDescendantsInstances = ignoreList

    local result = workspace:Raycast(origin, direction, raycastParams)
    return result == nil
end

--------------------------------------------------
-- RAGE MODULE (FIXED RECURSION CRASH & STATIC FOV)
--------------------------------------------------
_G.SilentAimEnabled = false
_G.AimBotEnabled = false
_G.SilentAimTargetPart = "Head"
_G.AimBotTargetPart = "Head"
_G.FovEnabled = false
_G.FovMode = "Move" -- "Move" или "Static"
_G.FovRadius = 150
_G.TeamCheckEnabled = true
_G.WallCheckEnabled = true

local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 1
fovCircle.NumSides = 60
fovCircle.Radius = _G.FovRadius
fovCircle.Filled = false
fovCircle.Visible = false
fovCircle.Color = sakuraColor

-- Получение центра FOV в зависимости от выбранного режима
local function GetFovCenter()
    local camera = workspace.CurrentCamera
    if _G.FovMode == "Static" and camera then
        return Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    else
        return UserInputService:GetMouseLocation()
    end
end

RunService.RenderStepped:Connect(function()
    if _G.FovEnabled then
        fovCircle.Position = GetFovCenter()
        fovCircle.Radius = _G.FovRadius
        fovCircle.Visible = true
    else
        fovCircle.Visible = false
    end
end)

-- Безопасный поиск лучшей цели (вычисляется отдельно от хуков)
local cachedTargetPart = nil

local function GetClosestPlayerInFOV(preferredPart)
    local closestPlayer = nil
    local shortestDistance = _G.FovEnabled and _G.FovRadius or math.huge
    local camera = workspace.CurrentCamera
    local centerPos = GetFovCenter()

    if not camera then return nil end

    for _, player in ipairs(Players:GetPlayers()) do
        if not _G.TeamCheckEnabled or IsEnemy(player) then
            if player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.Health > 0 then
                    local targetPart = player.Character:FindFirstChild(preferredPart) or player.Character:FindFirstChild("Head")
                    if targetPart then
                        if not _G.WallCheckEnabled or IsVisible(targetPart) then
                            local screenPos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
                            if onScreen then
                                local distance = (Vector2.new(screenPos.X, screenPos.Y) - centerPos).Magnitude
                                if distance < shortestDistance then
                                    shortestDistance = distance
                                    closestPlayer = player
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return closestPlayer
end

-- Цикл кэширования цели для устранения зависаний
RunService.RenderStepped:Connect(function()
    if _G.SilentAimEnabled or _G.AimBotEnabled then
        local targetPlayer = GetClosestPlayerInFOV(_G.SilentAimEnabled and _G.SilentAimTargetPart or _G.AimBotTargetPart)
        if targetPlayer and targetPlayer.Character then
            cachedTargetPart = targetPlayer.Character:FindFirstChild(_G.SilentAimEnabled and _G.SilentAimTargetPart or _G.AimBotTargetPart) or targetPlayer.Character:FindFirstChild("Head")
        else
            cachedTargetPart = nil
        end
    else
        cachedTargetPart = nil
    end

    -- Логика AimBot
    if _G.AimBotEnabled and cachedTargetPart then
        local camera = workspace.CurrentCamera
        if camera then
            camera.CFrame = CFrame.new(camera.CFrame.Position, cachedTargetPart.Position)
        end
    end
end)

-- Оптимизированные и безопасные хуки Silent Aim (без рекурсии)
if hookmetamethod then
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = {...}

        if _G.SilentAimEnabled and not checkcaller() and cachedTargetPart then
            if method == "Raycast" or method == "FindPartOnRayWithIgnoreList" or method == "FindPartOnRay" then
                local origin = args[1]
                if typeof(origin) == "Vector3" then
                    args[2] = (cachedTargetPart.Position - origin).Unit * 10000
                    return oldNamecall(self, unpack(args))
                end
            end
        end

        return oldNamecall(self, ...)
    end)

    local oldIndex
    oldIndex = hookmetamethod(game, "__index", function(self, key)
        if _G.SilentAimEnabled and not checkcaller() and cachedTargetPart then
            if self == Players.LocalPlayer:GetMouse() and tostring(key) == "Hit" then
                return cachedTargetPart.CFrame
            end
        end
        return oldIndex(self, key)
    end)
end

--------------------------------------------------
-- VISUALS MODULE
--------------------------------------------------
_G.ChamsEnabled = false
_G.ChamsTeamCheck = true
_G.ChamsTransparency = 0.4

local function applyChamsToCharacter(player)
    if not player or player == Players.LocalPlayer then return end
    local char = player.Character
    if not char then return end

    local existingHighlight = char:FindFirstChild("GxiChamsHighlight")

    if _G.ChamsEnabled and (not _G.ChamsTeamCheck or IsEnemy(player)) then
        local teamColor = GetTeamColor(player)
        local trans = _G.ChamsTransparency or 0.4
        
        if not existingHighlight then
            local highlight = Instance.new("Highlight")
            highlight.Name = "GxiChamsHighlight"
            highlight.Parent = char
            highlight.Adornee = char
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = teamColor
            highlight.FillTransparency = trans
            highlight.OutlineColor = teamColor
            highlight.OutlineTransparency = 0
        else
            existingHighlight.FillColor = teamColor
            existingHighlight.OutlineColor = teamColor
            existingHighlight.FillTransparency = trans
        end
    else
        if existingHighlight then
            existingHighlight:Destroy()
        end
    end
end

RunService.Heartbeat:Connect(function()
    if _G.ChamsEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer then
                applyChamsToCharacter(player)
            end
        end
    end
end)

function _G.ToggleChams(state)
    _G.ChamsEnabled = state
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character then
            applyChamsToCharacter(player)
        end
    end
end

--------------------------------------------------
-- MISC MODULES
--------------------------------------------------

-- CUSTOM CURSOR
_G.CustomCursorEnabled = false
local customCursorConn = nil

local CrosshairGui = Instance.new("ScreenGui")
CrosshairGui.Name = "GxiCrosshairGui"
CrosshairGui.Parent = CoreGui
CrosshairGui.Enabled = false
CrosshairGui.DisplayOrder = 9999

local CursorContainer = Instance.new("Frame", CrosshairGui)
CursorContainer.Name = "CursorContainer"
CursorContainer.Size = UDim2.new(0, 12, 0, 12)
CursorContainer.AnchorPoint = Vector2.new(0.5, 0.5)
CursorContainer.BackgroundTransparency = 1

local function createCrossBar(size, position)
    local bar = Instance.new("Frame", CursorContainer)
    bar.Size = size
    bar.Position = position
    bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    bar.BorderSizePixel = 0
    local corner = Instance.new("UICorner", bar)
    corner.CornerRadius = UDim.new(1, 0)
    return bar
end

createCrossBar(UDim2.new(0, 2, 0, 4), UDim2.new(0.5, -1, 0, 0))
createCrossBar(UDim2.new(0, 2, 0, 4), UDim2.new(0.5, -1, 1, -4))
createCrossBar(UDim2.new(0, 4, 0, 2), UDim2.new(0, 0, 0.5, -1))
createCrossBar(UDim2.new(0, 4, 0, 2), UDim2.new(1, -4, 0.5, -1))

function _G.ToggleCustomCursor(state)
    _G.CustomCursorEnabled = state
    CrosshairGui.Enabled = state

    if customCursorConn then
        customCursorConn:Disconnect()
        customCursorConn = nil
    end

    if not state then return end

    customCursorConn = RunService.RenderStepped:Connect(function()
        if not _G.CustomCursorEnabled then return end
        local mouseLoc = UserInputService:GetMouseLocation()
        CursorContainer.Position = UDim2.new(0, mouseLoc.X, 0, mouseLoc.Y)
    end)
end

-- FAKE HEADLESS
local fakeHeadlessConnection = nil

local function applyHeadless(character)
    if not character then return end
    local head = character:FindFirstChild("Head")
    if head then
        head.LocalTransparencyModifier = 1
        for _, child in ipairs(head:GetChildren()) do
            if child:IsA("Decal") then child.Transparency = 1 end
        end
    end
end

local function restoreHeadless(character)
    if not character then return end
    local head = character:FindFirstChild("Head")
    if head then
        head.LocalTransparencyModifier = 0
        for _, child in ipairs(head:GetChildren()) do
            if child:IsA("Decal") then child.Transparency = 0 end
        end
    end
end

function _G.ToggleFakeHeadless(state)
    if fakeHeadlessConnection then
        fakeHeadlessConnection:Disconnect()
        fakeHeadlessConnection = nil
    end

    local char = Players.LocalPlayer and Players.LocalPlayer.Character
    if not state then
        restoreHeadless(char)
        return
    end

    fakeHeadlessConnection = RunService.RenderStepped:Connect(function()
        local character = Players.LocalPlayer and Players.LocalPlayer.Character
        if character then applyHeadless(character) end
    end)
end

--------------------------------------------------
-- ANTI AIM MODULE
--------------------------------------------------
local antiAimConnection = nil
_G.AntiAimEnabled = false
_G.AntiAimSpeed = 3

local spinAngle = 0
local jitterState = false

function _G.ToggleAntiAim(state)
    _G.AntiAimEnabled = state
    if antiAimConnection then
        antiAimConnection:Disconnect()
        antiAimConnection = nil
    end

    if not state then return end

    antiAimConnection = RunService.RenderStepped:Connect(function()
        local char = Players.LocalPlayer and Players.LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not humanoid or humanoid.Health <= 0 then return end

        local speedMultiplier = _G.AntiAimSpeed or 3
        local isMoving = humanoid.MoveDirection.Magnitude > 0.1

        if not isMoving then
            spinAngle = (spinAngle + (speedMultiplier * 3)) % 360
            hrp.CFrame = CFrame.new(hrp.Position) * CFrame.Angles(0, math.rad(spinAngle), 0)
        else
            jitterState = not jitterState
            local camera = workspace.CurrentCamera
            local camYaw = 0
            if camera then
                local _, yaw, _ = camera.CFrame:ToOrientation()
                camYaw = yaw
            else
                local _, yaw, _ = hrp.CFrame:ToOrientation()
                camYaw = yaw
            end

            local jitterAngle = (jitterState and 1 or -1) * math.rad(8 + (speedMultiplier * 2))
            local finalYaw = camYaw + math.pi + jitterAngle
            hrp.CFrame = CFrame.new(hrp.Position) * CFrame.Angles(0, finalYaw, 0)
        end
    end)
end

function _G.SetAntiAimSpeed(val)
    _G.AntiAimSpeed = val
end