CounterView = {}
CounterView.__index = CounterView


function CounterView:OnPlayerLogin(event, player)
    local CounterController = CounterController:GetInstance()

    -- increment global counter
    CounterController:Increment()

    -- increment player-specific counter
    local playerName = player:GetName()
    CounterController:AddCounter(playerName)
    CounterController:IncrementCounter(playerName)

    -- display values in Chat   
    local totalCount = CounterController:GetValue()
    local playerCount = CounterController:GetCounterValue(playerName)
    player:SendBroadcastMessage("Welcome back, " .. playerName .. "!")
    player:SendBroadcastMessage("Total players logged in: " .. totalCount)
    player:SendBroadcastMessage("Your login count: " .. playerCount)
end 

-- register the event for player login   
RegisterPlayerEvent(3, function(event, player)
    CounterView:OnPlayerLogin(event, player)
end)