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
    if input.KeyCode == Enum.KeyCode.Y then
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
	[5] = "Attach Follow"
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

	elseif input.KeyCode == Enum.KeyCode.Y then
		states[5] = not states[5]
		update(5)
	end
end)
















