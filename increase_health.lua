function IncreaseHealth()
    local player = game.Players.LocalPlayer
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.MaxHealth = humanoid.MaxHealth + 100
        humanoid.Health = humanoid.MaxHealth
    end
end