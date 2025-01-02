CounterController = {}
CounterController.__index = CounterController

local instance = nil 


function CounterController:GetInstance()
    if not instance then
        instance = setmetatable({}, CounterController)
        instance.value = 0
        instance.counters = {} 
    end
    return instance
end

function CounterController:Increment()
    self.value = self.value + 1
end

function CounterController:GetValue()
    return self.value
end

function CounterController:Reset()
    self.value = 0
    print("Counter reset successfully!")
end

function CounterController:AddCounter(name)
    if not self.counters[name] then
        self.counters[name] = 0
    else
        print("Counter with this name already exists.")
    end
end

function CounterController:IncrementCounter(name)
    if self.counters[name] then
        self.counters[name] = self.counters[name] + 1
    else
        print("Counter " .. name .. " does not exist.")
    end
end

function CounterController:GetCounterValue(name)
    if self.counters[name] then
        return self.counters[name]
    else
        print("Counter " .. name .. " does not exist.")
        return nil
    end
end

function CounterController:ResetCounter(name)
    if self.counters[name] then
        self.counters[name] = 0
        print("Counter " .. name .. " has been reset.")
    else
        print("Counter " .. name .. " does not exist.")
    end
end
