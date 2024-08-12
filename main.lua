local GuiLibrary = {}

local function makeDraggable(frame)
local UIS = game:GetService("UserInputService")
local dragToggle = nil
local dragSpeed = 0
local dragStart = nil
local startPos = nil

local function updateInput(input)
local delta = input.Position - dragStart
frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragToggle = true
dragStart = input.Position
startPos = frame.Position
input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then
dragToggle = false
end
end)
end
end)

frame.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement then
if dragToggle then
updateInput(input)
end
end
end)
end

function GuiLibrary:CreateWindow(name)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")

ScreenGui.Name = name
ScreenGui.Parent = game:GetService("CoreGui")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Active = true

makeDraggable(MainFrame)

return MainFrame
end

function GuiLibrary:CreateButton(parent, text, callback)
local Button = Instance.new("TextButton")
Button.Parent = parent
Button.Size = UDim2.new(0, 280, 0, 50)
Button.Position = UDim2.new(0.5, -140, 0, 10)
Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Button.BorderSizePixel = 0
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Text = text
Button.Font = Enum.Font.SourceSans
Button.TextSize = 18
Button.MouseButton1Click:Connect(callback)
return Button
end

function GuiLibrary:CreateLabel(parent, text)
local Label = Instance.new("TextLabel")
Label.Parent = parent
Label.Size = UDim2.new(0, 280, 0, 50)
  Label.Position = UDim2.new(0.5, -140, 0, 70)
Label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Label.BorderSizePixel = 0
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.Text = text
Label.Font = Enum.Font.SourceSans
Label.TextSize = 18
Label.TextWrapped = true
return Label
end

return GuiLibrary
