local stgui = game:GetService("StarterGui")
if not getgenv().DisableNotification then
	stgui:SetCore("SendNotification", {
		Title = "Sprite&Best",
		Icon = "rbxassetid://122816576385645",
		Text = "Jailbreak",
		Duration = 10,
		Button1 = "Dismiss",
		Callback = function() end
	})
end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local humanoid
local infiniteJump = false

local NORMAL_SPEED = 16
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

  local walkspeedplayer = game:GetService("Players").LocalPlayer
    local walkspeedmouse = walkspeedplayer:GetMouse()
 
    local walkspeedenabled = false
 
    function x_walkspeed(key)
        if (key == "x") then
            if walkspeedenabled == false then
                _G.WS = 150;
                local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid;
                Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                Humanoid.WalkSpeed = _G.WS;
                end)
                Humanoid.WalkSpeed = _G.WS;
 
                walkspeedenabled = true
            elseif walkspeedenabled == true then
                _G.WS = 20;
                local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid;
                Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                Humanoid.WalkSpeed = _G.WS;
                end)
                Humanoid.WalkSpeed = _G.WS;
 
                walkspeedenabled = false
            end
        end
    end
 
    walkspeedmouse.KeyDown:connect(x_walkspeed)


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
local MAX_DISTANCE = 350
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

--ESP Players
-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local ESP_ENABLED = false -- เปิด ESP ตั้งแต่เริ่ม
local ESPs = {}

-- Toggle ESP ด้วยปุ่ม P
UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.P then
		ESP_ENABLED = not ESP_ENABLED
		for _, gui in pairs(ESPs) do
			if gui then
				gui.Enabled = ESP_ENABLED
			end
		end
	end
end)

-- ฟังก์ชันเพิ่ม ESP ให้ผู้เล่น
local function addESP(player)
	if player == LocalPlayer then return end

	local function onCharacter(char)
		local hrp = char:WaitForChild("HumanoidRootPart", 5)
		if not hrp then return end

		-- ลบ ESP เก่า
		if ESPs[player] then
			if ESPs[player].Connection then
				ESPs[player].Connection:Disconnect()
			end
			ESPs[player]:Destroy()
		end

		local gui = Instance.new("BillboardGui")
		gui.Name = "ESP"
		gui.Adornee = hrp
		gui.Size = UDim2.fromOffset(200, 50)
		gui.StudsOffset = Vector3.new(0, 3, 0)
		gui.AlwaysOnTop = true -- เห็นผ่านวัตถุ
		gui.Enabled = ESP_ENABLED
		gui.Parent = hrp

		local label = Instance.new("TextLabel")
		label.Size = UDim2.fromScale(1, 1)
		label.BackgroundTransparency = 1
		label.TextStrokeTransparency = 0
		label.Font = Enum.Font.SourceSansBold
		label.TextScaled = true
		label.Parent = gui

		-- อัปเดต ESP ทุกเฟรม
		local conn
		conn = RunService.RenderStepped:Connect(function()
			if not gui or not gui.Parent then
				conn:Disconnect()
				return
			end
			if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end

			local dist = (LocalPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude

			-- สี ESP ตามทีม (ถ้ามี Teams)
			local color = Color3.fromRGB(255, 50, 50) -- Default แดง
			if player.Team == LocalPlayer.Team then
				color = Color3.fromRGB(50, 255, 50) -- เขียวเพื่อนร่วมทีม
			end

			label.TextColor3 = color
			label.Text = player.Name .. " | " .. math.floor(dist) .. "m"
		end)

		ESPs[player] = gui
		ESPs[player].Connection = conn
	end

	if player.Character then
		onCharacter(player.Character)
	end
	player.CharacterAdded:Connect(onCharacter)
end

-- เพิ่ม ESP ให้ผู้เล่นทุกคน
for _, plr in pairs(Players:GetPlayers()) do
	addESP(plr)
end

Players.PlayerAdded:Connect(addESP)
Players.PlayerRemoving:Connect(function(plr)
	if ESPs[plr] then
		if ESPs[plr].Connection then
			ESPs[plr].Connection:Disconnect()
		end
		ESPs[plr]:Destroy()
		ESPs[plr] = nil
	end
end)






-------------------------------------------------------------------------



--Guiเเสดงสถานะ
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ตั้งชื่อปุ่มแต่ละอัน
local keyNames = {
	[1] = "วิ่งไว",
	[2] = "กระโดดสูง",
	[3] = "วาร์ป",
	[4] = "Lock On",
	[5] = "ESP Players"
}

-- สถานะ
local states = {false, false, false, false, false}

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "CustomKeyGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 250)
frame.Position = UDim2.new(0.4, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Visible = false
frame.Draggable = true
frame.Parent = gui

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "สถานะฟังชั่น"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.Parent = frame

-- labels
local labels = {}

for i = 1, 5 do
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.9, 0, 0, 30)
	label.Position = UDim2.new(0.05, 0, 0, 40 + (i * 35))
	label.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
	label.Text = keyNames[i] .. " [ปิด]"
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.Font = Enum.Font.GothamBold
	label.TextScaled = true
	label.Parent = frame

	local c = Instance.new("UICorner", label)
	c.CornerRadius = UDim.new(0, 8)

	labels[i] = label
end

-- อัปเดต UI
local function update(i)
	if states[i] then
		labels[i].Text = keyNames[i] .. " [เปิด]"
		labels[i].BackgroundColor3 = Color3.fromRGB(50, 170, 80)
	else
		labels[i].Text = keyNames[i] .. " [ปิด]"
		labels[i].BackgroundColor3 = Color3.fromRGB(170, 50, 50)
	end
end

-- เปิด/ปิด GUI
local function toggleGUI()
	guiVisible = not guiVisible
	frame.Visible = guiVisible
end

-- ตรวจจับคีย์บอร์ด
UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end

-- Toggle GUI
	if input.KeyCode == Enum.KeyCode.RightControl then
		toggleGUI()
	end

	-- ฟังก์ชัน 1–4
	if input.KeyCode == Enum.KeyCode.X then
		states[1] = not states[1]
		update(1)

	elseif input.KeyCode == Enum.KeyCode.B then
		states[2] = not states[2]
		update(2)

	elseif input.KeyCode == Enum.KeyCode.T then
		labels[3].Text = keyNames[3] .. " [เปิด]"
		labels[3].BackgroundColor3 = Color3.fromRGB(50, 170, 80)
		Wait(0.1)
		labels[3].Text = keyNames[3] .. " [ปิด]"
		labels[3].BackgroundColor3 = Color3.fromRGB(170, 50, 50)

	elseif input.UserInputType == Enum.UserInputType.MouseButton3 then
		states[4] = not states[4]
		update(4)

	elseif input.KeyCode == Enum.KeyCode.P then
		states[5] = not states[5]
		update(5)
	end
end)















