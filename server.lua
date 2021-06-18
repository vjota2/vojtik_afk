local afkPlayers = {}

RegisterNetEvent('vojtik_afk:pleaseDontBlameMe')
AddEventHandler('vojtik_afk:pleaseDontBlameMe', function()
    TriggerClientEvent('vojtik_afk:butSomeoneIsActuallySellingThis', source, afkPlayers)
end)

RegisterCommand('afk', function(src, args)
    local argument = table.concat(args, " ", 1, #args) 
    if argument == '' then
        if afkPlayers[src] then
            afkPlayers[src] = nil
            TriggerClientEvent('vojtik_afk:whyTwoEvents', src, false)
            TriggerClientEvent('vojtik_afk:cringe', -1, 'remove', {sId = src})
        end
        return 
    end

    if args[1] ~= '' then
        if argument then
            afkPlayers[src] = argument

            local time = os.date("*t")
            TriggerClientEvent('vojtik_afk:whyTwoEvents', src, true)
            TriggerClientEvent('vojtik_afk:cringe', -1, 'add', {sId = src, text = '~b~- AFK -~w~\n~b~Since:~w~ '..time.hour..':'..time.min..'\n~b~Reason:~w~ '..argument})
        end
    end
end)