ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('treifa:illegal')
AddEventHandler('treifa:illegal', function(blood)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()

    xPlayer.addWeapon(blood, 1000)
    TriggerClientEvent('esx:showNotification', source, "Votre achat a était effectué !")
    

end)