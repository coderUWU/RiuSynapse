-- Universal ESP Script
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local espEnabled = true
local teamCheck = true
local boxes = {}

local function createBox(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = Color3.new(1, 0, 0)
    box.Thickness = 2
    box.Transparency = 1
    box.Filled = false
    
    boxes[player] = box
end

local function updateESP()
    for player, box in pairs(boxes) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local pos, onScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            
            if onScreen then
                box.Size = Vector2.new(2000 / pos.Z, 2500 / pos.Z)
                box.Position = Vector2.new(pos.X - box.Size.X / 2, pos.Y - box.Size.Y / 2)
                box.Visible = espEnabled
            else
                box.Visible = false
            end
        else
            box.Visible = false
        end
    end
end

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createBox(player)
    end
end

Players.PlayerAdded:Connect(createBox)
Players.PlayerRemoving:Connect(function(player)
    if boxes[player] then
        boxes[player]:Remove()
        boxes[player] = nil
    end
end)

RunService.RenderStepped:Connect(updateESP)

print("ESP Loaded!")