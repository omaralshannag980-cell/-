local player = game:GetService("Players").LocalPlayer
local VIM = game:GetService("VirtualInputManager")
local mouse = player:GetMouse()

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AutoClickerGUI"
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 240, 0, 180)
MainFrame.Position = UDim2.new(0.5, -120, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderColor3 = Color3.fromRGB(0, 140, 255)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "اوتو كليكر"
Title.TextColor3 = Color3.fromRGB(0, 150, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.Parent = MainFrame

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(1, 0, 0, 25)
SpeedLabel.Position = UDim2.new(0, 0, 0.3, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "السرعة: 0.1 ثانية"
SpeedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.TextSize = 15
SpeedLabel.Parent = MainFrame

local StartButton = Instance.new("TextButton")
StartButton.Size = UDim2.new(0, 100, 0, 45)
StartButton.Position = UDim2.new(0.08, 0, 0.65, 0)
StartButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
StartButton.BorderColor3 = Color3.fromRGB(0, 80, 180)
StartButton.BorderSizePixel = 2
StartButton.Text = "تشغيل"
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.Font = Enum.Font.GothamBold
StartButton.TextSize = 16
StartButton.Parent = MainFrame

local StopButton = Instance.new("TextButton")
StopButton.Size = UDim2.new(0, 100, 0, 45)
StopButton.Position = UDim2.new(0.52, 0, 0.65, 0)
StopButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
StopButton.BorderColor3 = Color3.fromRGB(0, 140, 255)
StopButton.BorderSizePixel = 2
StopButton.Text = "إيقاف"
StopButton.TextColor3 = Color3.fromRGB(0, 150, 255)
StopButton.Font = Enum.Font.GothamBold
StopButton.TextSize = 16
StopButton.Parent = MainFrame

local SideButton = Instance.new("TextButton")
SideButton.Name = "SideButton"
SideButton.Size = UDim2.new(0, 45, 0, 130)
SideButton.Position = UDim2.new(0.5, 120, 0.5, -65)
SideButton.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
SideButton.BorderColor3 = Color3.fromRGB(0, 80, 180)
SideButton.BorderSizePixel = 2
SideButton.Text = "ترفكسا🏴‍☠️"
SideButton.TextColor3 = Color3.fromRGB(0, 0, 0)
SideButton.Font = Enum.Font.GothamBold
SideButton.TextSize = 16
SideButton.Rotation = 90
SideButton.Active = true
SideButton.Draggable = true
SideButton.Parent = ScreenGui

local isClicking = false
local clickThread = nil

local function startClicking()
    if isClicking then return end
    isClicking = true
    clickThread = task.spawn(function()
        while isClicking do
            local x, y = mouse.X, mouse.Y
            VIM:SendMouseButtonEvent(x, y, 0, true, game, 1)
            task.wait(0.01)
            VIM:SendMouseButtonEvent(x, y, 0, false, game, 1)
            task.wait(0.1)
        end
    end)
end

local function stopClicking()
    isClicking = false
    if clickThread then
        task.cancel(clickThread)
        clickThread = nil
    end
end

StartButton.MouseButton1Click:Connect(startClicking)
StopButton.MouseButton1Click:Connect(stopClicking)
