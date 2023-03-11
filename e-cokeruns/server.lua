local QBCore = exports['qb-core']:GetCoreObject()
local ox_inventory = exports.ox_inventory

RegisterNetEvent('e-cokeruns:server:addMeth',function (plate)
    if Config.qbinv then
    TriggerEvent("inventory:server:addTrunkItems", plate, Config.qbitemName)
else
        exports.ox_inventory:AddItem("trunk"..plate, Config.itemName, Config.itemAmount)  
        print("debug") 
    end
end)
