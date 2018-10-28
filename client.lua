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
		local health = GetEntityHealth(GetPlayerPed(-1))
		Citizen.Wait(100)
		if health <= 199 and health >= 176 then
			RequestAnimSet("move_injured_generic")
      
      		while not HasAnimSetLoaded("move_injured_generic") do
        		Citizen.Wait(0)
      		end

      		SetPedMovementClipset(playerPed, "move_injured_generic", true)
			elseif health <= 175 and health >= 151 then
			RequestAnimSet("move_heist_lester")
      
      		while not HasAnimSetLoaded("move_heist_lester") do
        		Citizen.Wait(0)
      		end

      		SetPedMovementClipset(playerPed, "move_heist_lester", true)
			elseif health <= 150 and health >= 126 then
			RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
      
      		while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
        		Citizen.Wait(0)
      		end

      		SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
			elseif health <= 125 and health >= 101 then
			RequestAnimSet("MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP")
      
      		while not HasAnimSetLoaded("MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP") do
        		Citizen.Wait(0)
      		end

      		SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP", true)
			elseif health == 200 then
			ResetPedMovementClipset(playerPed, 0.0)
			end
	end
end)
