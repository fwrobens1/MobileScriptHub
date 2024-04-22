local Window = OrionLib:MakeWindow({Name = "Base Battles | MobileScriptHub", HidePremium = false, SaveConfig = true, ConfigFolder = "Base Battles | MobileScriptHub"})

local Tab = Window:MakeTab({
	Name = "Home",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})




local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
Name = "Inf Ammo",
Callback = function()
    local Player = game:GetService("Players").LocalPlayer
local Global = require(game:GetService("ReplicatedStorage").Libraries.Global)

for i,v in pairs (game:GetService("ReplicatedStorage").Weapons.Guns:GetChildren()) do
    for g,x in pairs (v:GetChildren()) do
        if x:FindFirstChild("Configuration") then
            local Config = require(x.Configuration)
            Config.firemode = "automatic"
            Config.automatic = true
            Config.maxAmmo = math.huge
        end
    end
end

while task.wait() do
    for i,v in pairs (game:GetService("Players"):GetChildren()) do
        if v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            if Global.Teams[v] ~= Global.Teams[Player] then
                v.Character.HumanoidRootPart.Size = Vector3.new(50,50,50)
                v.Character.HumanoidRootPart.CanCollide = false
                v.Character.HumanoidRootPart.Transparency = 0.5
                if Global.Teams[v] == "Blue" then
                    v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Royal blue")
                elseif Global.Teams[v] == "Red" then
                    v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
                end
            elseif Global.Teams[v] == Global.Teams[Player] then
                v.Character.HumanoidRootPart.Size = Vector3.new(1,1,1)
                v.Character.HumanoidRootPart.Transparency = 1
            end
        end
    end
end 
})