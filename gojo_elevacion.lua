-- Asegúrate de que el ID de la risa esté correcto
local sonidoGojo = "rbxassetid://6842473007"  -- Risa malévola (puedes cambiarlo si encuentras otra)

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Accede al personaje del jugador
local personaje = game.Players.LocalPlayer.Character
local humanoide = personaje:WaitForChild("Humanoid")
local humanoidRootPart = personaje:WaitForChild("HumanoidRootPart")

-- Reproducir la risa de Gojo
local risa = Instance.new("Sound")
risa.SoundId = sonidoGojo
risa.Parent = personaje.Head
risa:Play()

-- Función para simular el estilo de Gojo al elevarse
local function elevarPersonaje()
    -- Detener el movimiento del personaje mientras se eleva
    humanoide.WalkSpeed = 0
    humanoide.JumpHeight = 0  -- Evitar que el personaje salte

    -- Definir la altura deseada (100 unidades por ejemplo)
    local alturaObjetivo = 100
    local destino = Vector3.new(humanoidRootPart.Position.X, humanoidRootPart.Position.Y + alturaObjetivo, humanoidRootPart.Position.Z)
    
    -- Tween para mover al personaje de manera fluida
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0)  -- Movimiento suave de 5 segundos
    local goal = {CFrame = CFrame.new(destino)}  -- Define la posición objetivo para el movimiento
    
    -- Realizar la animación de movimiento
    local tween = tweenService:Create(humanoidRootPart, tweenInfo, goal)
    tween:Play()
    
    -- Espera hasta que el movimiento se complete
    tween.Completed:Wait()

    -- Después de llegar, reiniciar el personaje
    wait(0.5)  -- Un pequeño retraso antes de reiniciar
    game.Players.LocalPlayer:LoadCharacter()  -- Esto reinicia al personaje
end

-- Llamar a la función para elevar al personaje
elevarPersonaje()
