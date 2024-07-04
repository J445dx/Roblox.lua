function IncreaseStrength()
    local player = game.Players.LocalPlayer
    -- Exemplo de como aumentar a força. A implementação real depende do jogo.
    if player:FindFirstChild("leaderstats") then
        local strength = player.leaderstats:FindFirstChild("Strength")
        if strength then
            strength.Value = strength.Value + 10
        end
    end
end