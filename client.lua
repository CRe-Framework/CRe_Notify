------------------------------------------------------------------------------------------
-----   ---------        Notify
------------------------------------------------------------------------------------------

RegisterNetEvent('CRe_Notify:Show')
AddEventHandler('CRe_Notify:Show', function(type, title, message, time)
    SendNUIMessage({ void = 'add_notify', type = type, title = title, span = message, time = time })
end)

------------------------------------------------------------------------------------------
-----   ---------        Dialog
------------------------------------------------------------------------------------------

local _callback = nil

RegisterNetEvent('CRe_Notify:ShowDialog')
AddEventHandler('CRe_Notify:ShowDialog', function(message, time, callback)
    SendNUIMessage({ void = 'add_dialog', message = message, time = time })
    _callback = callback
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsControlJustPressed(0, 246) then 
            SendNUIMessage({ void = 'verifDialogExists', key = true }) 
        elseif IsControlJustPressed(0, 303) then 
            SendNUIMessage({ void = 'verifDialogExists', key = false })
        end   
    end
end)

RegisterNUICallback('ReceiveDialogExists', function(data)
    if data.value then _callback(data.key) end
end)



RegisterCommand('dialogg', function()
    TriggerEvent('CRe_Notify:ShowDialog', 'Você é o melhor dev de todos?', 30000, function(result)
        
    end)
end)