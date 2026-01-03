-- 🔑 KEY ที่ถูกต้อง
local CorrectKey = "tankeymo"

-- กันรันซ้ำ
if getgenv().KeyPassed then return end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- สร้าง ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KEYMOHUB_GUI"
ScreenGui.Parent = game:GetService("CoreGui")

-- สร้าง Frame
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 350, 0, 200)
Frame.Position = UDim2.new(0.5, -175, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Frame.ZIndex = 1

-- มุมโค้ง
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1,0,0,40)
Title.Text = "KEYMOHUB"
Title.TextColor3 = Color3.new(0,170,255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
--

local TextBox = Instance.new("TextBox")
TextBox.Parent = Frame
TextBox.Size = UDim2.new(1,-40,0,35)
TextBox.Position = UDim2.new(0,20,0,60)
TextBox.PlaceholderText = "ใส่ Key ที่นี่"
TextBox.Text = ""
TextBox.Font = Enum.Font.GothamBold
TextBox.TextSize = 14
TextBox.BackgroundColor3 = Color3.fromRGB(45,45,45)
TextBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", TextBox)

local Button = Instance.new("TextButton")
Button.Parent = Frame
Button.Size = UDim2.new(1,-40,0,35)
Button.Position = UDim2.new(0,20,0,105)
Button.Text = "🔑 ยืนยัน KEY"
Button.Font = Enum.Font.GothamBold
Button.TextSize = 14
Button.BackgroundColor3 = Color3.fromRGB(0,170,255)
Button.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Button)

-- ตรวจสอบ Key
Button.MouseButton1Click:Connect(function()
	if TextBox.Text == CorrectKey then
		getgenv().KeyPassed = true
		ScreenGui:Destroy()

		--------------------------------
		-- 🔥 ใส่สคริปหลักของคุณตรงนี้
			local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local humanoid
local infiniteJump = false

local NORMAL_SPEED = 20
local RUN_SPEED = 150

local function setupCharacter(char)
    humanoid = char:WaitForChild("Humanoid")
    humanoid.WalkSpeed = NORMAL_SPEED
end

setupCharacter(player.Character or player.CharacterAdded:Wait())
player.CharacterAdded:Connect(setupCharacter)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end

    -- เปิด/ปิด กระโดดไม่จำกัด
    if input.KeyCode == Enum.KeyCode.B then
        infiniteJump = not infiniteJump
    end

    -- Infinite Jump
    if infiniteJump and input.KeyCode == Enum.KeyCode.Space then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

--Speed
-- SERVICES
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

-- VARIABLES
local Humanoid
local enabled = false
_G.WS = 20

-- CHARACTER LOAD / RESPAWN
local function SetupCharacter(char)
    Humanoid = char:WaitForChild("Humanoid")

    -- ANTI RESET SPEED
    Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if enabled and Humanoid.WalkSpeed ~= _G.WS then
            Humanoid.WalkSpeed = _G.WS
        end
    end)
end

if Player.Character then
    SetupCharacter(Player.Character)
end
Player.CharacterAdded:Connect(SetupCharacter)

-- KEY TOGGLE (X)
Mouse.KeyDown:Connect(function(key)
    if key:lower() == "x" then
        enabled = not enabled
        if enabled then
            Humanoid.WalkSpeed = _G.WS
        else
            Humanoid.WalkSpeed = 20
        end
    end
end)

-- ================= GUI =================
local gui = Instance.new("ScreenGui")
gui.Name = "SpeedGUI"
gui.Parent = game.CoreGui
gui.Enabled = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,260,0,140)
main.Position = UDim2.new(0.02,0,0.5,-70)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = false
main.BackgroundTransparency = 0

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0,12)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,35)
title.Text = "ปรับความเร็วในการวิ่ง"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16

-- DRAG BAR (ลาก GUI ได้เฉพาะตรงนี้)
local dragBar = Instance.new("Frame", main)
dragBar.Size = UDim2.new(1,0,0,35)
dragBar.BackgroundTransparency = 1
dragBar.Active = true
dragBar.Selectable = true

local valueLabel = Instance.new("TextLabel", main)
valueLabel.Position = UDim2.new(0,0,0,40)
valueLabel.Size = UDim2.new(1,0,0,25)
valueLabel.Text = "ความเร็ว : 20"
valueLabel.TextColor3 = Color3.fromRGB(200,200,200)
valueLabel.BackgroundTransparency = 1
valueLabel.Font = Enum.Font.GothamBold
valueLabel.TextSize = 14

-- SLIDER BAR
local bar = Instance.new("Frame", main)
bar.Position = UDim2.new(0,20,0,75)
bar.Size = UDim2.new(1,-40,0,8)
bar.BackgroundColor3 = Color3.fromRGB(60,60,60)
bar.BorderSizePixel = 0

local barCorner = Instance.new("UICorner", bar)
barCorner.CornerRadius = UDim.new(1,0)

local fill = Instance.new("Frame", bar)
fill.Size = UDim2.new(0,0,1,0)
fill.BackgroundColor3 = Color3.fromRGB(0,170,255)
fill.BorderSizePixel = 0

local fillCorner = Instance.new("UICorner", fill)
fillCorner.CornerRadius = UDim.new(1,0)

-- SLIDER BUTTON
local knob = Instance.new("Frame", bar)
knob.Size = UDim2.new(0,16,0,16)
knob.Position = UDim2.new(0,-8,0.5,-8)
knob.BackgroundColor3 = Color3.fromRGB(255,255,255)
knob.BorderSizePixel = 0

local knobCorner = Instance.new("UICorner", knob)
knobCorner.CornerRadius = UDim.new(1,0)

-- SLIDER LOGIC
local UserInputService = game:GetService("UserInputService")
local dragging = false
local minSpeed, maxSpeed = 10, 300

local function UpdateSlider(x)
    local size = math.clamp((x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
    fill.Size = UDim2.new(size,0,1,0)
    knob.Position = UDim2.new(size,-8,0.5,-8)

    local speed = math.floor(minSpeed + (maxSpeed - minSpeed) * size)
    _G.WS = speed
    valueLabel.Text = "ความเร็ว : "..speed

    if enabled and Humanoid then
        Humanoid.WalkSpeed = _G.WS
    end
end

knob.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        UpdateSlider(input.Position.X)
    end
end)

local UIS = game:GetService("UserInputService")

local dragging, dragStart, startPos

dragBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- TOGGLE GUI (X)
local UIS = game:GetService("UserInputService")
local guiVisible = false

UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        guiVisible = not guiVisible
        gui.Enabled = guiVisible
    end
end)



--teleport

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- ตั้งค่าความไกลสูงสุดที่วาร์ปได้ (ถ้าต้องการจำกัดระยะ)
local MAX_DISTANCE = 1000 

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	-- ตรวจสอบว่าไม่ได้กำลังพิมพ์ในช่อง Chat และกดปุ่ม 
	if not gameProcessed and input.KeyCode == Enum.KeyCode.T then
		local character = player.Character
		if character and character:FindFirstChild("HumanoidRootPart") then

			-- ตรวจสอบว่าเมาส์ชี้ไปที่ตำแหน่งใดในโลก (Vector3)
			local targetPosition = mouse.Hit.Position

			-- ย้ายตำแหน่งตัวละคร (บวกความสูงขึ้น 3 หน่วยเพื่อไม่ให้จมดิน)
			character:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, 3, 0)))
		end
	end

end)

--// Smart Smooth Aimbot (FOV = ON , No FOV = OFF)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- SETTINGS
local AIM_KEY = Enum.UserInputType.MouseButton2
local FOV_RADIUS = 500
local MAX_DISTANCE = 850
local SMOOTHNESS = 1.5
local AIM_PART = "HumanoidRootPart"

local FOV_ENABLED = false -- 🔵 เปิด = aimbot ทำงาน

-- FOV Circle
local FOV = Drawing.new("Circle")
FOV.Color = Color3.fromRGB(255, 255, 255)
FOV.Thickness = 2
FOV.NumSides = 100
FOV.Radius = FOV_RADIUS
FOV.Filled = false
FOV.Visible = FOV_ENABLED

-- Toggle FOV (ควบคุม aimbot ด้วย)
UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.UserInputType == Enum.UserInputType.MouseButton3 then
		FOV_ENABLED = not FOV_ENABLED
		FOV.Visible = FOV_ENABLED
	end
end)

-- หาเป้าในวง + ระยะ
local function GetTarget()
	local closestPart = nil
	local shortest = FOV_RADIUS

	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character then
			local part = plr.Character:FindFirstChild(AIM_PART)
			local hum = plr.Character:FindFirstChild("Humanoid")

			if part and hum and hum.Health > 0 then
				local distance3D = (Camera.CFrame.Position - part.Position).Magnitude
				if distance3D > MAX_DISTANCE then continue end

				local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
				if onScreen then
					local dist2D = (Vector2.new(pos.X, pos.Y) -
						Vector2.new(Mouse.X, Mouse.Y)).Magnitude

					if dist2D < shortest then
						shortest = dist2D
						closestPart = part
					end
				end
			end
		end
	end

	return closestPart
end

-- Update
RunService.RenderStepped:Connect(function()
	-- อัปเดตวงเฉพาะตอนเปิด
	if FOV_ENABLED then
		FOV.Position = Vector2.new(Mouse.X, Mouse.Y)
	end

	-- ❗ ถ้า FOV ปิด = aimbot ไม่ทำงาน
	if not FOV_ENABLED then return end

	if UIS:IsMouseButtonPressed(AIM_KEY) then
		local target = GetTarget()
		if target then
			local camCF = Camera.CFrame
			local aimCF = CFrame.new(camCF.Position, target.Position)
			Camera.CFrame = camCF:Lerp(aimCF, SMOOTHNESS)
		end
	end
end)

--// Sticky Attach Follow (Press Y)
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LP = Players.LocalPlayer
local attached = false
local target = nil
local conn = nil

-- รอ Character
local function getChar(plr)
    return plr.Character or plr.CharacterAdded:Wait()
end

-- หา Player ใกล้ที่สุด
local function getNearestPlayer()
    local char = getChar(LP)
    local hrp = char:WaitForChild("HumanoidRootPart")

    local nearest, dist = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local d = (p.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
            if d < dist then
                dist = d
                nearest = p
            end
        end
    end
    return nearest
end

-- เริ่มเกาะ (ซ้อนหลังเล็กน้อย)
local function attachTo(plr)
    local myChar = getChar(LP)
    local myHRP = myChar:WaitForChild("HumanoidRootPart")
    local hum = myChar:WaitForChild("Humanoid")
    hum.PlatformStand = true -- กันฟิสิกส์เด้ง

    target = plr
    attached = true

    conn = RunService.Heartbeat:Connect(function()
        if not attached then return end
        if not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

        local tHRP = target.Character.HumanoidRootPart
        -- ปรับ offset ได้ (ด้านหลัง / ด้านบน)
        local offset = CFrame.new(0, 3, 0)
        myHRP.CFrame = tHRP.CFrame * offset
        myHRP.Velocity = Vector3.zero
    end)
end

-- ปล่อยเกาะ
local function detach()
    attached = false
    target = nil
    if conn then conn:Disconnect() conn = nil end

    local char = getChar(LP)
    char:WaitForChild("Humanoid").PlatformStand = false
end

-- กด Y
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.H then
        if attached then
            detach()
        else
            local nearest = getNearestPlayer()
            if nearest then
                attachTo(nearest)
            end
        end
    end
end)

--ESP PLAYERS
--// ESP Box + Tracer + Name + Toggle (LocalScript)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local ESP = {}
local ESP_ENABLED = false

-- สร้าง ESP
local function CreateESP(player)
	if player == LocalPlayer then return end

	local box = Drawing.new("Square")
	box.Color = Color3.fromRGB(255, 0, 0)
	box.Thickness = 2
	box.Filled = false
	box.Visible = false

	local nameText = Drawing.new("Text")
	nameText.Color = Color3.fromRGB(255, 255, 255)
	nameText.Size = 14
	nameText.Center = true
	nameText.Outline = true
	nameText.Font = Enum.Font.GothamBold
	nameText.Visible = false
	nameText.Text = player.Name

	ESP[player] = {
		Box = box,
		Name = nameText
	}
end

-- ลบ ESP
local function RemoveESP(player)
	if ESP[player] then
		for _, v in pairs(ESP[player]) do
			v:Remove()
		end
		ESP[player] = nil
	end
end

-- Toggle ESP ด้วยปุ่ม P
UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.P then
		ESP_ENABLED = not ESP_ENABLED

		if not ESP_ENABLED then
			for _, esp in pairs(ESP) do
				esp.Box.Visible = false
				esp.Name.Visible = false
			end
		end
	end
end)

-- อัปเดตทุกเฟรม
RunService.RenderStepped:Connect(function()
	if not ESP_ENABLED then return end

	for player, esp in pairs(ESP) do
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		local hum = char and char:FindFirstChild("Humanoid")

		if hrp and hum and hum.Health > 0 then
			local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)

			if onScreen then
				local scale = math.clamp(3000 / pos.Z, 20, 300)
				local size = Vector2.new(scale, scale * 1.5)

				-- Box
				esp.Box.Size = size
				esp.Box.Position = Vector2.new(
					pos.X - size.X / 2,
					pos.Y - size.Y / 2
				)
				esp.Box.Visible = true

				-- Name
				esp.Name.Position = Vector2.new(
					pos.X,
					pos.Y - size.Y / 2 - 14
				)
				esp.Name.Visible = true
			else
				esp.Box.Visible = false
				esp.Name.Visible = false
			end
		else
			esp.Box.Visible = false
			esp.Name.Visible = false
		end
	end
end)

-- โหลดผู้เล่น
for _, player in ipairs(Players:GetPlayers()) do
	CreateESP(player)
end

Players.PlayerAdded:Connect(CreateESP)
Players.PlayerRemoving:Connect(RemoveESP)








-------------------------------------------------------------------------


loadstring(game:HttpGet("https://raw.githubusercontent.com/RealSakii/BestAndSpriteScript/refs/heads/main/KEYMOHUBGUI.lua"))()


		--------------------------------

	else
		Button.Text = "❌ KEY ไม่ถูกต้อง"
		wait(1)
		Button.Text = "🔑 ยืนยัน KEY"
	end
end)

local stgui = game:GetService("StarterGui")

if not getgenv().DisableNotification then
	stgui:SetCore("SendNotification", {
		Title = "KEYMOHUB",
		Icon = "rbxassetid://109159489030155",
		Text = "Get Key",
		Duration = 10,
		Button1 = "Dismiss",
		Callback = function() end
	})
end

















































