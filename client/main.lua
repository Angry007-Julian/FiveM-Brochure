local isOpen = false

local function close()
    if not isOpen then return end
    isOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'close' })
end

local function open(image)
    if isOpen then return end
    isOpen = true

    SendNUIMessage({ action = 'open', image = image })
    SetNuiFocus(true, true)

    -- SetNuiFocus fängt Tastatur/Maus bereits ab. Der Loop verhindert zusätzlich,
    -- dass ESC/P das Pausenmenü öffnet und der Spieler angreifen/zielen kann.
    CreateThread(function()
        while isOpen do
            DisableControlAction(0, 1, true)    -- LookLeftRight
            DisableControlAction(0, 2, true)    -- LookUpDown
            DisableControlAction(0, 24, true)   -- Attack
            DisableControlAction(0, 25, true)   -- Aim
            DisableControlAction(0, 142, true)  -- MeleeAttackAlternate
            DisableControlAction(0, 199, true)  -- Pause (P)
            DisableControlAction(0, 200, true)  -- Pause (ESC)
            Wait(0)
        end
    end)
end

RegisterNetEvent('brochure:open', function(image)
    if type(image) ~= 'string' then return end
    open(image)
end)

RegisterNUICallback('close', function(_, cb)
    close()
    cb('ok')
end)

-- Sicherheitsnetz: Focus nie "hängen" lassen, wenn die Resource neu gestartet wird
AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        close()
    end
end)
