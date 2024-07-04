local aimbotEnabled = false

function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    local localPlayer = game.Players.LocalPlayer
    local localCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local localRoot = localCharacter:WaitForChild("HumanoidRootPart")
    
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= localPlayer and player.Team ~= localPlayer.Team and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (localRoot.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                closestPlayer = player
                shortestDistance = distance
            end
        end
    end
    
    return closestPlayer
end

function ToggleAimbot()
    aimbotEnabled = not aimbotEnabled
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()
    
    mouse.Button1Down:Connect(function()
        if aimbotEnabled then
            local closestPlayer = GetClosestPlayer()
            if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                mouse.TargetFilter = closestPlayer.Character
                local aimAt = closestPlayer.Character.HumanoidRootPart
                mouse.Hit = CFrame.new(aimAt.Position)
            end
        end
    end)
end