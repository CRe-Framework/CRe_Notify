RegisterNetEvent('CRe_Notify:Show')
AddEventHandler('CRe_Notify:Show', function(type, title, message, time)
    SendNUIMessage({ void = 'add_notify', type = type, title = title, span = message, time = time })
end)