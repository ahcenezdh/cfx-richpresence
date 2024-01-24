function Discord:updateStatus(key, value)

    if self[key] ~= value then
        self[key] = value
    end

    local playerID <const> = PlayerId()
    local discordAction = string.format(
        "Players: %s/%s\n %s [%s] - %s",
        self.count or GlobalState.playersCount,
        tostring(GetConvarInt("sv_maxclients", 32)),
        self.identity or GetPlayerName(playerID),
        GetPlayerServerId(playerID),
        self.role
    )
    SetRichPresence(discordAction)
end

function Discord:initRichPresence(firstName, lastName, group)
    local presenceSettings <const> = Discord.RichPresence

    SetDiscordAppId(presenceSettings.AppID)
    SetDiscordRichPresenceAsset(presenceSettings.largeIcon)
    SetDiscordRichPresenceAssetText(presenceSettings.largeIconText)

    if presenceSettings.smallIcon and presenceSettings.smallIconText then
        SetDiscordRichPresenceAssetSmall(presenceSettings.smallIcon)
        SetDiscordRichPresenceAssetSmallText(presenceSettings.smallIconText)
    end

    SetDiscordRichPresenceAction(0, presenceSettings.buttons[1].label, presenceSettings.buttons[1].url)
    SetDiscordRichPresenceAction(1, presenceSettings.buttons[2].label, presenceSettings.buttons[2].url)

    local fullName <const> = string.format("%s %s", firstName, lastName)
    local formattedRole <const> = Discord.roleIcons[group] or "👤 Player"
    Discord:updateStatus("identity", fullName)
    Discord:updateStatus("role", formattedRole)
end

AddStateBagChangeHandler("playersCount", "global", function(_, _, newValue)
    local firstTimer = GetGameTimer()
    local delay = 90000
    repeat
        Wait(1000)
    until (firstTimer + delay) < GetGameTimer()
    Discord:updateStatus("count", GlobalState.playersCount == newValue and newValue or GlobalState.playersCount)
end)