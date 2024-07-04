local fireEnabled = false

function ToggleFireNearPlayers()
    fireEnabled = not fireEnabled
    local player = game.Players.LocalPlayer
    
    while fireEnabled do
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and (player.Character.PrimaryPart.Position - otherPlayer.Character.PrimaryPart.Position).Magnitude < 10 then
                local fire = Instance.new("Fire", otherPlayer.Character.PrimaryPart)
                fire.Size = 10
                fire.Heat = 10
                otherPlayer.Character.Humanoid.Health = 0
            end
        end
        wait(1)
    end
end