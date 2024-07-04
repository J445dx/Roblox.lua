local showNamesEnabled = false

function ToggleShowNames()
    showNamesEnabled = not showNamesEnabled
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Head") then
            local nameTag = player.Character.Head:FindFirstChild("NameTag")
            if showNamesEnabled then
                if not nameTag then
                    nameTag = Instance.new("BillboardGui", player.Character.Head)
                    nameTag.Name = "NameTag"
                    nameTag.Size = UDim2.new(0, 100, 0, 50)
                    nameTag.Adornee = player.Character.Head
                    nameTag.AlwaysOnTop = true

                    local nameLabel = Instance.new("TextLabel", nameTag)
                    nameLabel.Size = UDim2.new(1, 0, 1, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = player.Name
                    nameLabel.TextColor3 = Color3.new(1, 1, 1)
                    nameLabel.TextStrokeTransparency = 0
                end
            else
                if nameTag then
                    nameTag:Destroy()
                end
            end
        end
    end
end