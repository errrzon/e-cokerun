local QBCore = exports['qb-core']:GetCoreObject()
local hasJob = false
local cooldown = false

CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey(Config.Ped) , Config.PedCoords, false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
end

CreateThread(function ()
    SpawnNPC()
end)
    SpawnNPC = function()
        CreateThread(function()
           
            RequestModel(GetHashKey(Config.Ped))
            while not HasModelLoaded(GetHashKey(Config.Ped)) do
                Wait(1)
            end
            CreateNPC()   
        end)
    end

    RegisterNetEvent('e-cokeruns:client:startCooldown',function ()
        local timer = Config.cooldown * 60000
        while timer > 0 do
        Wait(1000)
        timer = timer - 1000
            if timer == 0 then
            cooldown = false
            end
        end
    end)

RegisterNetEvent('e-cokeruns:client:takeJob',function ()
    if cooldown == false then
        hasJob = true
        local randomCar = Config.carModel[math.random(#Config.carModel)]
        local randomPos = Config.carSpawn[math.random(#Config.carSpawn)]
        QBCore.Functions.Notify(Config.PedGoToCoords, 'success', 5000)
            AddTextEntry('MYBLIP', 'METH')
            local blip = AddBlipForCoord(randomPos)
            SetBlipSprite(blip,161)
            BeginTextCommandSetBlipName('MYBLIP')
            EndTextCommandSetBlipName(blip)
        QBCore.Functions.SpawnVehicle(randomCar, function(veh)
            SetVehicleHandlingField(veh, 'CHandlingData', 'fSteeringLock', 360.0)
            local plate = QBCore.Functions.GetPlate(veh)
            SetEntityHeading(veh, randomPos)
            exports['LegacyFuel']:SetFuel(veh, 100.0)
            SetVehicleEngineOn(veh, true, true)
            TriggerServerEvent('e-cokeruns:server:addMeth',plate)
            SetPtfxAssetNextCall("core")
            local effect = StartParticleFxLoopedAtCoord("exp_grd_flare", randomPos.x,randomPos.y,randomPos.z+1, 0.0, 0.0, 0.0, 2.0, false, false, false, false)

            local time = Config.jobTime*60000
        while hasJob == true and time > 0 do
            Wait(1000)
            time = time - 1000
            if time == 0 then
            hasJob = false
            cooldown = true
            QBCore.Functions.Notify(Config.PedJobEnd, 'error', 5000)
            DeleteVehicle(veh)
            StopParticleFxLooped(effect, 0)
            RemoveBlip(blip)
            TriggerEvent('e-cokeruns:client:startCooldown')
            end
        end
        end, randomPos, true)
    else if cooldown == true then
        QBCore.Functions.Notify(Config.PedCooldown, 'error', 5000)
        return
    end
    end
end)

    exports['qb-target']:AddTargetModel(Config.Ped, {
        options = {
            {
                event = "e-cokeruns:client:takeJob",
                icon = "fas fa-sack-dollar",
                label = "Take a job",
                canInteract = function()
                    if hasJob == false and GetEntityCoords(created_ped).x == Config.PedCoords.x and GetEntityCoords(created_ped).y == Config.PedCoords.y then
                        return hasJob == false and GetEntityCoords(created_ped).x == Config.PedCoords.x and GetEntityCoords(created_ped).y == Config.PedCoords.y
                    end
                end,
            },
        },
        distance = 2.5,
    })