Discord = {}

Discord.RichPresence = {
    AppID = "APPID",
    largeIcon = "LOGONAME",
    largeIconText = "🏝️ FiveM RP V1",
    smallIcon = nil,
    smallIconText = nil,
    buttons = { -- You can't put more than 2 buttons (discord limit)
        {
            label = "Join Discord",
            url = "https://discord.com/invite/yourinvite"
        },
        {
            label = "Website",
            url = "https://google.fr"
        }
    }
}

-- Only available for ESX, since i couldn't find a way to get the group of the player on QbCore
Discord.roleIcons = {
    ["user"] = "👤 Player",
    ["vip"] = "⭐ VIP",
    ["admin"] = "🛡️ STAFF"
}