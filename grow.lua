local growEnabled = false

function ToggleGrow()
    growEnabled = not growEnabled
    local player = game.Players.LocalPlayer
    local character = player.Character
    
    if growEnabled then
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Size = part.Size * 2
            end
        end
    else
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Size = part.Size / 2
            end
        end
    end
end