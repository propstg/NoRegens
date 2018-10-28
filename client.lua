ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

---No HP Regeneration
Citizen.CreateThread(function()
     while true do
          Citizen.Wait(0)
          SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
     end
end)

----Move tardy when taken dmg
Citizen.CreateThread(function()
    while true do
        local playerPed = GetPlayerPed(-1)
        local health = GetEntityHealth(playerPed)
        Citizen.Wait(100)

        if health == 200 then
            ResetPedMovementClipset(playerPed, 0.0)
        elseif health >= 176 then
            setClipset("move_injured_generic")
        elseif health >= 151 then
            setClipset("move_heist_lester")
        elseif health >= 126 then
            setClipset("MOVE_M@DRUNK@SLIGHTLYDRUNK")
        else
            setClipset("MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP")
        end
    end
end)

function setClipset(clipsetName)
    RequestAnimSet(clipsetName)
      
    while not HasAnimSetLoaded(clipsetName) do
      Citizen.Wait(0)
    end

    SetPedMovementClipset(playerPed, clipsetName, true)
end
