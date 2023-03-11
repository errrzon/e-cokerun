local QBCore = exports['qb-core']:GetCoreObject()
local ox_inventory = exports.ox_inventory

RegisterNetEvent('e-cokeruns:server:addMeth',function (plate)
    if Config.qbInventory then
        TriggerEvent("inventory:server:addTrunkItems", plate, Config.qbItemName)
    else
        exports.ox_inventory:AddItem("trunk"..plate, Config.itemName, Config.itemAmount)
    end
end)
