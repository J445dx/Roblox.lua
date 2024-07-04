function IncreaseAttack()
    local player = game.Players.LocalPlayer
    -- Exemplo de como aumentar o ataque. A implementação real depende do jogo.
    if player:FindFirstChild("leaderstats") then
        local attack = player.leaderstats:FindFirstChild("Attack")
        if attack then
            attack.Value = attack.Value + 10
        end
    end
end