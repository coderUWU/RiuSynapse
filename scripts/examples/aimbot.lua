-- Universal Aimbot
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

local aimbotEnabled = false
local fov = 100
local smoothing = 5

Mouse.KeyDown:Connect(function(key)
    if key == "e" then
        aimbotEnabled = not aimbotEnabled
        print("Aimbot:", aimbotEnabled)
    end
end)

function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = fov
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local pos = Camera:WorldToViewportPoint(player.Character.Head.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
            
            if magnitude < shortestDistance then
                closestPlayer = player
                shortestDistance = magnitude
            end
        end
    end
    
    return closestPlayer
end

game:GetService("RunService").RenderStepped:Connect(function()
    if aimbotEnabled then
        local target = getClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            Camera.CFrame = Camera.CFrame:Lerp(
                CFrame.new(Camera.CFrame.Position, target.Character.Head.Position),
                1 / smoothing
            )
        end
    end
end)