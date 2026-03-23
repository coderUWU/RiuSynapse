-- {self.executor_name} Script Hub
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ui-library.lua"))()

local Window = Library:CreateWindow("{self.executor_name} Hub")

local Tab1 = Window:CreateTab("Admin")
Tab1:CreateButton("Infinite Yield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

Tab1:CreateButton("CMD-X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()
end)

local Tab2 = Window:CreateTab("Hubs")
Tab2:CreateButton("Owl Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
end)

local Tab3 = Window:CreateTab("Game Scripts")
Tab3:CreateButton("Blox Fruits", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/bloxfruits.lua"))()
end)

Tab3:CreateButton("Pet Simulator X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/psx.lua"))()
end)

print("Script Hub Loaded!")