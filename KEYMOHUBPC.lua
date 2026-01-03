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
			loadstring(game:HttpGet("https://raw.githubusercontent.com/RealSakii/BestAndSpriteScript/refs/heads/main/Status"))()
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





















































