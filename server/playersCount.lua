AddEventHandler("onResourceStart", function()
    GlobalState.playersCount = #GetPlayers()
end)

local events <const> = {
    ["playerJoining"] = function()
        GlobalState.playersCount += 1
    end,
    ["onPlayerDropped"] = function()
        GlobalState.playersCount -= 1
    end,
}

for eventName, eventFunc in pairs(events) do
    AddEventHandler(eventName, eventFunc)
end

