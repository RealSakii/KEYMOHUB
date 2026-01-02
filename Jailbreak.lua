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
local MAX_DISTANCE = 250
local SMOOTHNESS = 1
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







