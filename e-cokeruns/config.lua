Config = {}
Config.qbInventory = false -- if true uses qb-inventory if false uses ox-inventory
Config.Ped = "a_m_y_business_03"    -- MODEL OF PED YOU WANT
Config.PedCoords = vector4(-587.16, -1596.29, 25.83, 2.89) -- COORDS OF PED WITH JOB 
Config.cooldown = 15                -- HOW MUCH TIME DO YOU WANT TO WAIT BEFORE YOU CAN TAKE ANOTHER JOB IN MINUTES  EXAMPLE: Config.cooldown = 1 = 1 MINUTE
Config.jobTime = 10                 -- HOW MUCH TIME UNTIL JOB ENDS IN MINUTES
Config.itemName = "water"           -- ITEM OF ITEM YOU WANT TO SPAWN IN TRUNK (ox inv only)
Config.itemAmount = 1               -- AMOUNT OF ITEM YOU WANT TO SPAWN IN TRUNK (ox inv only)

Config.qbItemName ={                -- qb inventory
    [1] = {
        name = "water",
        amount = 1,
        info = {},
        type = "item",
        slot = 1,
    },
}

Config.carSpawn = {     -- CAR SPAWN POSITIONS
    [1] = vector4(-2697.68, -288.49, -1.05, 29.35),
    [2] = vector4(-2632.2, -334.31, -0.04, 204.16),
}

Config.carModel = {     -- CAR MODELS
    [1] = "baller",
    [2] = "granger2",
    [3] = "xls",
}

--  TRANSLATION
Config.PedInteraction = "A marker has been selected on your gps, go and dive underwater to take coke"  -- TAKING JOB FROM PED
Config.PedCooldown = "You have to wait before taking another job" -- COOLDOWN BEFORE TAKING ANOTHER JOB
Config.PedJobEnd = "Your Contract has ended"  -- AFTER CERTAIN AMOUNT OF TIME JOB ENDS AND CAR DISAPEARS
Config.PedGoToCoords = "Go to location marked on your map"    -- NOTIFY AFTER TAKING JOB
