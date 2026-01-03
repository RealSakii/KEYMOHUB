----
--Guiเเสดงสถานะ
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ตั้งชื่อปุ่มแต่ละอัน
local keyNames = {
	[1] = "วิ่งไว(X/RightControl)",
	[2] = "กระโดดสูง(B)",
	[3] = "วาร์ป(T)",
	[4] = "Lock On(M3)",
	[5] = "Attach Follow(H)"
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
frame.Position = UDim2.new(0.5, -150, 0.5, -85)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Visible = true
frame.Draggable = true
frame.Parent = gui

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

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

-- 🔵 โลโก้ KEYMOHUB (ImageLabel)
local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1,0,0,40)
Title.Text = "KEYMO HUB"
Title.TextColor3 = Color3.new(0,170,255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
-- labels
local labels = {}

for i = 1, 5 do
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.9, 0, 0, 30)
	label.Position = UDim2.new(0.05, 0, 0, 40 + (i * 35))
	label.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
	label.Text = keyNames[i] .. ": ปิด"
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
		labels[i].Text = keyNames[i] .. ": เปิด"
		labels[i].BackgroundColor3 = Color3.fromRGB(50, 170, 80)
	else
		labels[i].Text = keyNames[i] .. ": ปิด"
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
	if input.KeyCode == Enum.KeyCode.LeftControl then
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
		labels[3].Text = keyNames[3] .. ": เปิด"
		labels[3].BackgroundColor3 = Color3.fromRGB(50, 170, 80)
		Wait(0.1)
		labels[3].Text = keyNames[3] .. ": ปิด"
		labels[3].BackgroundColor3 = Color3.fromRGB(170, 50, 50)

	elseif input.UserInputType == Enum.UserInputType.MouseButton3 then
		states[4] = not states[4]
		update(4)

	elseif input.KeyCode == Enum.KeyCode.H then
		states[5] = not states[5]
		update(5)
	end
end)

----

local stgui = game:GetService("StarterGui")

if not getgenv().DisableNotification then
	stgui:SetCore("SendNotification", {
		Title = "KEYMOHUB",
		Icon = "rbxassetid://109159489030155",
		Text = "KEYMOHUB",
		Duration = 10,
		Button1 = "Dismiss",
		Callback = function() end
	})
end










