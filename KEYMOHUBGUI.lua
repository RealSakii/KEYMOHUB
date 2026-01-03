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

local TitleImage = Instance.new("ImageLabel")
TitleImage.Parent = Frame
TitleImage.Name = "TitleImage"
TitleImage.Size = UDim2.new(1, 0, 0, 40)
TitleImage.Position = UDim2.new(0, 0, 0, 0)

TitleImage.BackgroundTransparency = 1
TitleImage.ImageTransparency = 0
TitleImage.ImageColor3 = Color3.fromRGB(255,255,255)
TitleImage.ScaleType = Enum.ScaleType.Fit

-- ⚠️ ใส่ Image ID แบบนี้เท่านั้น
TitleImage.Image = "rbxassetid://85807223632250"

TitleImage.ZIndex = 10

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




