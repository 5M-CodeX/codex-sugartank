local COOLDOWN_TIME = 45 -- Cooldown time in seconds
local playerCooldowns = {}

-- Function to sabotage the vehicle
local function sabotageVehicle(vehicle)
    if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
        SetVehicleEngineHealth(vehicle, -4000)
        TriggerEvent("chat:addMessage", {
            args = { "^1Vehicle sabotaged!" }
        })
    else
        TriggerEvent("chat:addMessage", {
            args = { "^1No nearby vehicle found!" }
        })
    end
end

-- Function to start the cooldown for a player
local function startCooldown(playerId)
    playerCooldowns[playerId] = true

    Citizen.CreateThread(function()
        Citizen.Wait(COOLDOWN_TIME * 1000)

        playerCooldowns[playerId] = false
    end)
end

-- Function to check if the player is in a vehicle
local function isPlayerInVehicle(playerPed)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    return vehicle ~= nil and vehicle ~= 0
end

-- Event handler for key press
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerId = PlayerId()
        local playerPed = GetPlayerPed(playerId)

        if not isPlayerInVehicle(playerPed) and IsControlJustPressed(0, 311) then -- "K" key
            local vehicle = nil
            local coords = GetEntityCoords(playerPed)

            for _, nearbyVehicle in ipairs(GetGamePool('CVehicle')) do
                local vehicleCoords = GetEntityCoords(nearbyVehicle)
                local distance = #(coords - vehicleCoords)

                if distance <= 5.0 then
                    vehicle = nearbyVehicle
                    break
                end
            end

            if vehicle ~= nil then
                if not playerCooldowns[playerId] then
                    sabotageVehicle(vehicle)
                    startCooldown(playerId)
                else
                    TriggerEvent("chat:addMessage", {
                        args = { "^1You are on cooldown. Please wait." }
                    })
                end
            else
                TriggerEvent("chat:addMessage", {
                    args = { "^1No nearby vehicle found!" }
                })
            end
        end
    end
end)

-- Display help text near a vehicle (outside the vehicle)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerId = PlayerId()
        local playerPed = GetPlayerPed(playerId)
        local coords = GetEntityCoords(playerPed)

        if not isPlayerInVehicle(playerPed) then
            for _, nearbyVehicle in ipairs(GetGamePool('CVehicle')) do
                local vehicleCoords = GetEntityCoords(nearbyVehicle)
                local distance = #(coords - vehicleCoords)

                if distance <= 5.0 then
                    SetTextComponentFormat("STRING")
                    AddTextComponentString("Press ~INPUT_CONTEXT~ to put sugar in the tank")
                    DisplayHelpTextFromStringLabel(0, 0, 1, -1)

                    if IsControlJustPressed(0, 311) then -- "E" key
                        if not playerCooldowns[PlayerId()] then
                            sabotageVehicle(nearbyVehicle)
                            startCooldown(PlayerId())
                        else
                            TriggerEvent("chat:addMessage", {
                                args = { "^1You are on cooldown. Please wait." }
                            })
                        end
                    end

                    break
                end
            end
        end
    end
end)
