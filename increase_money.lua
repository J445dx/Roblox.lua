function IncreaseMoney()
    local player = game.Players.LocalPlayer
    -- Exemplo de como aumentar dinheiro. A implementação real depende do jogo.
    if player:FindFirstChild("leaderstats") then
        local money = player.leaderstats:FindFirstChild("Money")
        if money then
            money.Value = money.Value + 1000
        end
    end
end