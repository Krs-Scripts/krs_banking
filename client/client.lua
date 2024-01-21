-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- █ ▄▄▀█▄▄ ▄▄██ ▄▀▄ ████ ▄▄ ██ ▄▄▀██ ▄▄▄ ██ ▄▄ 
-- █ ▀▀ ███ ████ █ █ ████ ▀▀ ██ ▀▀▄██ ███ ██ ▀▀ 
-- █ ██ ███ ████ ███ ████ █████ ██ ██ ▀▀▀ ██ ███
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
exports.ox_target:addModel(Config.AtmProp, {
    {
        icon = Config.IconAtm,
        label = Config.LabelAtm,
        items = Config.items,
        onSelect = function(data)

            if lib.progressCircle({
                duration = 3000,
                label = 'Usando la Carta di Credito',
                position = 'bottom',
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                    move = true,
                },
                anim = {
                    dict = 'mp_common',
                    clip = 'givetake1_a'
                },

            }) then 
                apriBanca()
            end
        end,
        canInteract = function(entity, distance, coords, name, bone)
            return not IsEntityDead(entity)
        end,
    },
})
-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ▄▄▀█ ▄▄▀██ ▀██ ██ █▀▄
-- ██ ▄▄▀█ ▀▀ ██ █ █ ██ ▄▀█
-- ██ ▀▀ █ ██ ██ ██▄ ██ ██ 
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
CreateThread(function()
    for i = 1, #Config.PosizioneBanche, 1 do
        local cfg = Config.PosizioneBanche[i]

        if cfg.blip.attiva then 

            local blip = AddBlipForCoord(cfg.posizione.x, cfg.posizione.y, cfg.posizione.z)
            SetBlipSprite(blip, cfg.blip.sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, cfg.blip.grandezza)
            SetBlipColour(blip, cfg.blip.colore)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(cfg.blip.nome)
            EndTextCommandSetBlipName(blip)
        end

        local modello = lib.requestModel(cfg.modello)

        npc = CreatePed(0, modello, cfg.posizione, false, true)

        SetModelAsNoLongerNeeded(modello)
        FreezeEntityPosition(npc, true)
        SetEntityInvincible(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)

        exports.ox_target:addLocalEntity(npc, Config.OpzioniTarget)
    end
end)
-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ▄▄▀██ █████ ▄▄▄ ██ ▄▄▄ ██ ▄▄▄██
-- ██ █████ █████ ███ ██▄▄▄▀▀██ ▄▄▄██
-- ██ ▀▀▄██ ▀▀ ██ ▀▀▀ ██ ▀▀▀ ██ ▀▀▀██
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
RegisterNUICallback('chiudiBanca', function()
	SetNuiFocus(false, false)
	SendNUIMessage({ 
        type = 'chiudiTutto' 
    })
end)
-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ▄▄▄ ██ ▄▄ ██ ▄▄▄██ ▀██ 
-- ██ ███ ██ ▀▀ ██ ▄▄▄██ █ █ 
-- ██ ▀▀▀ ██ █████ ▀▀▀██ ██▄ 
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
function apriBanca()
    lib.callback('krs_banking:infoPlayer', false, function(nome, banca)
        SetNuiFocus(true, true)
	    SendNUIMessage({
            type = 'apriBanca',
            namePlayer = nome,
            money = banca
        })
    end)
end
-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ▀██ ██ ██ █▄ ▄████ ▄▄▀█ ▄▄▀██ █████ █████ ▄▄▀█ ▄▄▀██ ▄▄▀██ █▀▄
-- ██ █ █ ██ ██ ██ █████ ████ ▀▀ ██ █████ █████ ▄▄▀█ ▀▀ ██ █████ ▄▀█
-- ██ ██▄ ██▄▀▀▄█▀ ▀████ ▀▀▄█ ██ ██ ▀▀ ██ ▀▀ ██ ▀▀ █ ██ ██ ▀▀▄██ ██ 
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
RegisterNUICallback('ritira', function(data)
    print(json.encode(data))
   TriggerServerEvent('krs_banking:ritirare', tonumber(data.importo))
end)
  
RegisterNUICallback('deposita', function(data)
    print(json.encode(data))
   	TriggerServerEvent('krs_banking:deposita', tonumber(data.importo))
end)

RegisterNUICallback('trasferire', function(data)
	print(json.encode(data))
    TriggerServerEvent('krs_banking:trasferisci', tonumber(data.importo), tonumber(data.id))
end)
