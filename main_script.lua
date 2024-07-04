-- Carregar funções extras
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/aimbot.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/speed.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/show_names.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/high_jump.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/increase_money.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/fire_near_players.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/grow.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/increase_health.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/increase_strength.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Teste/main/increase_attack.lua"))()

-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MenuGui"
screenGui.Parent = game.CoreGui

-- Criar Frame do Menu
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 300, 0, 600)
menuFrame.Position = UDim2.new(0.5, -150, 0.5, -300)
menuFrame.BackgroundColor3 = Color3.new(0, 0, 0)
menuFrame.Parent = screenGui

-- Título do Menu
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.new(1, 0, 0)
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Text = "MODDED BY J445dx"
titleLabel.TextSize = 20
titleLabel.Parent = menuFrame

-- Função para criar uma opção no menu
function createOption(text, position, callback)
    local optionButton = Instance.new("TextButton")
    optionButton.Size = UDim2.new(1, -20, 0, 40)
    optionButton.Position = UDim2.new(0, 10, 0, position)
    optionButton.BackgroundColor3 = Color3.new(1, 0, 0)
    optionButton.TextColor3 = Color3.new(1, 1, 1)
    optionButton.Text = text
    optionButton.Parent = menuFrame
    optionButton.MouseButton1Click:Connect(callback)
end

-- Função para criar um slider no menu
function createSlider(text, position, min, max, callback)
    local optionFrame = Instance.new("Frame")
    optionFrame.Size = UDim2.new(1, -20, 0, 60)
    optionFrame.Position = UDim2.new(0, 10, 0, position)
    optionFrame.BackgroundColor3 = Color3.new(1, 0, 0)
    optionFrame.Parent = menuFrame

    local optionLabel = Instance.new("TextLabel")
    optionLabel.Size = UDim2.new(0.6, 0, 0.5, 0)
    optionLabel.Position = UDim2.new(0, 10, 0, 0)
    optionLabel.BackgroundTransparency = 1
    optionLabel.TextColor3 = Color3.new(1, 1, 1)
    optionLabel.Text = text
    optionLabel.Parent = optionFrame

    local slider = Instance.new("TextBox")
    slider.Size = UDim2.new(0.8, 0, 0.4, 0)
    slider.Position = UDim2.new(0.1, 0, 0.5, 0)
    slider.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
    slider.Text = tostring(min)
    slider.Parent = optionFrame
    slider.FocusLost:Connect(function()
        local value = tonumber(slider.Text)
        if value then
            value = math.clamp(value, min, max)
            callback(value)
        else
            slider.Text = tostring(min)
        end
    end)
end

-- Adicionar opções ao menu
createOption("Aimbot", 60, function() ToggleAimbot() end)
createSlider("Speed", 120, 1, 100, function(value) AdjustSpeed(value) end)
createOption("Show Names", 180, function() ToggleShowNames() end)
createSlider("Jump", 240, 1, 100, function(value) AdjustJump(value) end)
createOption("Increase Money", 300, function() IncreaseMoney() end)
createOption("Fire Near Players", 360, function() ToggleFireNearPlayers() end)
createOption("Grow", 420, function() ToggleGrow() end)
createOption("Increase Health", 480, function() IncreaseHealth() end)
createOption("Increase Strength", 540, function() IncreaseStrength() end)
createOption("Increase Attack", 600, function() IncreaseAttack() end)

-- Mostrar ou esconder o menu ao clicar no botão flutuante
local floatButton = Instance.new("TextButton")
floatButton.Size = UDim2.new(0, 100, 0, 50)
floatButton.Position = UDim2.new(0, 10, 0, 10)
floatButton.BackgroundColor3 = Color3.new(1, 0, 0)
floatButton.TextColor3 = Color3.new(1, 1, 1)
floatButton.Text = "Toggle Menu"
floatButton.Parent = screenGui
floatButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = not menuFrame.Visible
end)

-- Botões de HIDE e CLOSE
local hideButton = Instance.new("TextButton")
hideButton.Size = UDim2.new(0.5, 0, 0, 50)
hideButton.Position = UDim2.new(0, 0, 1, -50)
hideButton.BackgroundColor3 = Color3.new(0, 0, 0)
hideButton.TextColor3 = Color3.new(1, 1, 1)
hideButton.Text = "HIDE"
hideButton.Parent = menuFrame
hideButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = false
end)

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.5, 0, 0, 50)
closeButton.Position = UDim2.new(0.5, 0, 1, -50)
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Text = "CLOSE"
closeButton.Parent = menuFrame
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)