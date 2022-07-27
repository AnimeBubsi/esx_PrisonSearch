ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

function Teksi(x, y, z, text, scale)
    SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	SetDrawOrigin(x,y,z, 0)
	DrawText(0.0, 0.0)
	local factor = (string.len(text)) / 370
	DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
	ClearDrawOrigin()
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
            local Pelaaja = PlayerPedId()
            local Paikka = GetEntityCoords(Pelaaja, true)

            for i,v in pairs(Config.Roskis) do 
		if(GetDistanceBetweenCoords(Paikka, v.x, v.y, v.z, true) < 1.0) and v.roskis == false then
                    Teksi(v.x, v.y, v.z, '~w~[~g~E~w~] Tutkiaksesi roskiksen', 0.6)
                      if IsControlJustPressed(1, 38) then
                          FreezeEntityPosition(Pelaaja, true)
                            TaskStartScenarioInPlace(Pelaaja, 'PROP_HUMAN_BUM_BIN', 0, true)
                              exports['progressBars']:startUI(20000, 'Tutkit roskista')
                               Citizen.Wait(20000)
                                 ClearPedTasksImmediately(Pelaaja)
                                  FreezeEntityPosition(Pelaaja, false)
                                   TriggerServerEvent('BubsiRoskis', source)
				      v.roskis = true
                        end
                 end
          end
      end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
            local Pelaaja = PlayerPedId()
            local Paikka = GetEntityCoords(Pelaaja, true)

            for i,v in pairs(Config.Kaappi) do 
		if(GetDistanceBetweenCoords(Paikka, v.x, v.y, v.z, true) < 1.0) and v.kaappi == false then
                    Teksi(v.x, v.y, v.z, '~w~[~g~E~w~] Tutkiaksesi hyllyn', 0.6)
                      if IsControlJustPressed(1, 38) then
                          FreezeEntityPosition(Pelaaja, true)
                            TaskStartScenarioInPlace(Pelaaja, 'PROP_HUMAN_BUM_BIN', 0, true)
                              exports['progressBars']:startUI(20000, 'Tutkit hyllyä')
                               Citizen.Wait(20000)
                                 ClearPedTasksImmediately(Pelaaja)
                                  FreezeEntityPosition(Pelaaja, false)
                                   TriggerServerEvent('BubsiKaappi', source)
                        	     v.kaappi = true
                        end
                 end
          end
      end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(10)
	 for i,v in pairs(Config.Roskis) do
            if v.roskis == true then
                Citizen.Wait(Config.aika)
		  v.roskis = false
       end
     end
   end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(10)
	 for i,v in pairs(Config.Kaappi) do
            if v.kaappi == true then
                Citizen.Wait(Config.aika)
		  v.kaappi = false
       end
     end
   end
end)
