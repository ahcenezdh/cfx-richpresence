local frameworks <const> = {
    {
        name = "es_extended",
        event = "esx:playerLoaded",
        callback = function(xPlayer)
            Discord:initRichPresence(xPlayer.firstName, xPlayer.lastName, LocalPlayer.state.group)
        end
    },
    {
        name = "qb_core",
        event = "QBCore:Client:OnPlayerLoaded",
        callback = function()
            local Player = exports['qb-core']:GetCoreObject().Functions.GetPlayerData()
            Discord:initRichPresence(Player.charinfo.firstname, Player.charinfo.lastname) -- couldn't find a way to get the group of a player on qbCore??
        end
    }
}

local function registerFrameworkEvents()
    for _, framework in ipairs(frameworks) do
        if GetResourceState(framework.name) == "started" then
            RegisterNetEvent(framework.event, framework.callback)
            return true
        end
    end
    return false
end

-- Enregistrer les événements ou configurer le mode autonome si aucun framework n'est détecté
if not registerFrameworkEvents() and GetResourceState("spawnmanager") == "started" then
    RegisterNetEvent("playerSpawned", function()
        Discord:initRichPresence()
    end)
end
