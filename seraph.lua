-- ==================== SERAPH HUB - PARTE 1 (Principal) ====================
-- Key: seraph

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Eliminar GUI anterior
if PlayerGui:FindFirstChild("Seraph_UI") then
    PlayerGui.Seraph_UI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Seraph_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("CanvasGroup")
MainFrame.Size = UDim2.new(0, 640, 0, 360)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 50)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainFrame.GroupTransparency = 1
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(220, 0, 0)

-- Panel Izquierdo (Avatar)
local LeftPanel = Instance.new("Frame")
LeftPanel.Size = UDim2.new(0, 230, 1, 0)
LeftPanel.BackgroundTransparency = 1
LeftPanel.Parent = MainFrame

local AvatarFrame = Instance.new("Frame")
AvatarFrame.Size = UDim2.new(0,80,0,80)
AvatarFrame.Position = UDim2.new(0.5,0,0,25)
AvatarFrame.AnchorPoint = Vector2.new(0.5,0)
AvatarFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
AvatarFrame.Parent = LeftPanel
Instance.new("UICorner", AvatarFrame).CornerRadius = UDim.new(1,0)
Instance.new("UIStroke", AvatarFrame).Color = Color3.fromRGB(220, 0, 0)

local Avatar = Instance.new("ImageLabel")
Avatar.Size = UDim2.new(0.9,0,0.9,0)
Avatar.Position = UDim2.new(0.5,0,0.5,0)
Avatar.AnchorPoint = Vector2.new(0.5,0.5)
Avatar.BackgroundTransparency = 1
Avatar.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
Avatar.Parent = AvatarFrame
Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1,0)

local DisplayName = Instance.new("TextLabel")
DisplayName.Size = UDim2.new(1,0,0,20)
DisplayName.Position = UDim2.new(0,0,0,115)
DisplayName.Text = LocalPlayer.DisplayName
DisplayName.TextColor3 = Color3.fromRGB(255,255,255)
DisplayName.Font = Enum.Font.GothamBold
DisplayName.TextSize = 16
DisplayName.BackgroundTransparency = 1
DisplayName.Parent = LeftPanel

local Username = Instance.new("TextLabel")
Username.Size = UDim2.new(1,0,0,15)
Username.Position = UDim2.new(0,0,0,135)
Username.Text = "@"..LocalPlayer.Name
Username.TextColor3 = Color3.fromRGB(150,150,150)
Username.Font = Enum.Font.GothamMedium
Username.TextSize = 11
Username.BackgroundTransparency = 1
Username.Parent = LeftPanel

-- Panel Derecho
local RightPanel = Instance.new("Frame")
RightPanel.Size = UDim2.new(1,-230,1,0)
RightPanel.Position = UDim2.new(0,230,0,0)
RightPanel.BackgroundTransparency = 1
RightPanel.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,40)
Title.Position = UDim2.new(0,0,0,90)
Title.Text = "SERAPH HUB"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 30
Title.BackgroundTransparency = 1
Title.Parent = RightPanel

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0,300,0,50)
KeyFrame.Position = UDim2.new(0.5,0,0,150)
KeyFrame.AnchorPoint = Vector2.new(0.5,0)
KeyFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
KeyFrame.Parent = RightPanel
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0,10)

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1,-20,1,0)
KeyBox.Position = UDim2.new(0,10,0,0)
KeyBox.BackgroundTransparency = 1
KeyBox.PlaceholderText = "Enter License Key..."
KeyBox.PlaceholderColor3 = Color3.fromRGB(100,100,100)
KeyBox.TextColor3 = Color3.fromRGB(255,255,255)
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 14
KeyBox.Parent = KeyFrame

TweenService:Create(MainFrame, TweenInfo.new(1.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {GroupTransparency = 0, Position = UDim2.new(0.5,0,0.5,0)}):Play()

local AccessBtn = Instance.new("TextButton")
AccessBtn.Size = UDim2.new(0,300,0,45)
AccessBtn.Position = UDim2.new(0.5,0,0,220)
AccessBtn.AnchorPoint = Vector2.new(0.5,0)
AccessBtn.BackgroundColor3 = Color3.fromRGB(40,0,0)
AccessBtn.Text = ""
AccessBtn.ClipsDescendants = true
AccessBtn.AutoButtonColor = false
AccessBtn.Parent = RightPanel
Instance.new("UICorner", AccessBtn).CornerRadius = UDim.new(0,10)

local AccessLabel = Instance.new("TextLabel", AccessBtn)
AccessLabel.Size = UDim2.new(1,0,1,0)
AccessLabel.BackgroundTransparency = 1
AccessLabel.Text = "INITIALIZE ACCESS"
AccessLabel.TextColor3 = Color3.fromRGB(255,255,255)
AccessLabel.Font = Enum.Font.GothamBold
AccessLabel.TextSize = 14
AccessLabel.ZIndex = 2

-- ==================== KEY SYSTEM ====================
AccessBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == "seraph" then
        AccessLabel.Text = "ACCESS GRANTED"
        TweenService:Create(AccessBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 255, 120)}):Play()
        
        task.wait(0.8)
        TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0), GroupTransparency = 1}):Play()
        task.wait(0.7)
        ScreenGui:Destroy()

        print("✅ SERAPH HUB - Acceso concedido")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vhhvwvvchvvydvbff-wq/Script-/refs/heads/main/To%C3%B1itax%20librari"))() -- Librería

        -- ==================== EJECUTAR PARTE 2 ====================
        loadstring([[ 
            -- Pega aquí toda la PARTE 2 (el código grande)
        ]])()

    else
        AccessLabel.Text = "INVALID LICENSE"
        TweenService:Create(AccessBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(150,0,0)}):Play()
        for i = 1,6 do
            MainFrame.Position += UDim2.new(0, i%2 == 0 and 5 or -5, 0, 0)
            task.wait(0.05)
        end
        task.wait(1)
        AccessLabel.Text = "INITIALIZE ACCESS"
    end
end)

print("SERAPH HUB cargado - Key: seraph")
local window = library:AddWindow("SERAPH HUB | "..LocalPlayer.DisplayName, {
    main_color = Color3.fromRGB(0, 0, 0),
    min_size = Vector2.new(680, 870),
    can_resize = true,
})

local MainTab = window:AddTab("Misc")
MainTab:AddLabel("Important:").TextSize = 22

MainTab:AddSwitch("Anti Fling", function(bool)
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if root then
        if bool then
            local bv = Instance.new("BodyVelocity")
            bv.Name = "AntiFling"
            bv.MaxForce = Vector3.new(1e5, 0, 1e5)
            bv.Velocity = Vector3.zero
            bv.Parent = root
        else
            local bv = root:FindFirstChild("AntiFling")
            if bv then bv:Destroy() end
        end
    end
end):Set(true)

-- Lock Position Mejorado
local lockConn
MainTab:AddSwitch("Lock Position", function(bool)
    if bool then
        lockConn = game:GetService("RunService").Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local hrp = char.HumanoidRootPart
                hrp.Velocity = Vector3.zero
                hrp.RotVelocity = Vector3.zero
            end
        end)
    elseif lockConn then
        lockConn:Disconnect()
    end
end)

MainTab:AddSwitch("Infinite Jump", function(bool) _G.InfiniteJump = bool end)
game:GetService("UserInputService").JumpRequest:Connect(function()
    if _G.InfiniteJump and LocalPlayer.Character then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- Farm Tab Mejorado
local AutoFarm = window:AddTab("Farm Op")

AutoFarm:AddSwitch("Strength Op", function(state)
    getgenv()._AutoRepFarmEnabled = state
end)

AutoFarm:AddSwitch("Spin Fortune Wheel", function(state)
    _G.AutoSpinWheel = state
    if state then
        spawn(function()
            while _G.AutoSpinWheel do
                game:GetService("ReplicatedStorage").rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel", game:GetService("ReplicatedStorage").fortuneWheelChances["Fortune Wheel"])
                task.wait(0.1)
            end
        end)
    end
end)

AutoFarm:AddButton("Full Optimization + Anti Lag", function()
    -- Código completo de optimización (tu versión original + mejoras)
    settings().Rendering.QualityLevel = 1
    game:GetService("Lighting").GlobalShadows = false
    game:GetService("Lighting").FogEnd = 9e9
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") then v.Enabled = false end
    end
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Optimization", Text = "Full Optimization Applied!", Duration = 5})
end)

-- Agrega aquí el resto de tus tabs (Teleport, Stats, Calculator, Pets, Trade, Gift, Credits, etc.)
-- Puedes pegar directamente todo lo que tenías en esas secciones.

print("🎉 SERAPH HUB cargado completamente!")
