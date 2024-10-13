------------------------------------------------------------------------------------------
-----   ---------        Notification
------------------------------------------------------------------------------------------

RegisterNetEvent('CRe_Notify:Show')
AddEventHandler('CRe_Notify:Show', function(type, title, message, time)
    SendNUIMessage({ void = 'add_notify', type = type, title = title, span = message, time = time })
end)

------------------------------------------------------------------------------------------
-----   ---------        Dialog
------------------------------------------------------------------------------------------

local dialog_callback = nil

RegisterNetEvent('CRe_Notify:ShowDialog')
AddEventHandler('CRe_Notify:ShowDialog', function(message, time, callback)
    SendNUIMessage({ void = 'add_dialog', message = message, time = time })
    dialog_callback = callback
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
    if data.value then dialog_callback(data.key) end
end)

------------------------------------------------------------------------------------------
-----   ---------        Input
------------------------------------------------------------------------------------------

local input_callback = nil

RegisterNetEvent('CRe_Notify:ShowInput')
AddEventHandler('CRe_Notify:ShowInput', function(message, type, button, callback)
    input_callback = callback
    SetNuiFocus(true, true)
    SendNUIMessage({ void = 'add_input', message = message, type = type, button = button })
end)

RegisterNUICallback('ReceiveInputData', function(data)
    SetNuiFocus(false, false)
    input_callback(data.value)
end)

------------------------------------------------------------------------------------------
-----   ---------        Textarea
------------------------------------------------------------------------------------------

local textarea_callback = nil 

RegisterNetEvent('CRe_Notify:ShowTextarea')
AddEventHandler('CRe_Notify:ShowTextarea', function(message, button, callback)
    textarea_callback = callback
    SetNuiFocus(true, true)
    SendNUIMessage({ void = 'add_textarea', message = message, button = button })
end)

RegisterNUICallback('ReceiveTextareaData', function(data)
    SetNuiFocus(false, false)

    local linhas = {}
    for linha in data.value:gmatch("[^\r\n]+") do
        table.insert(linhas, linha)
    end

    textarea_callback(linhas)
end)