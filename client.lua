-------------------------
--- Badger-Priorities ---
-------------------------

function Draw2DText(x, y, text, scale)
    -- Draw text on screen
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    SetTextJustification(0)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end
drawText = Config.Options.CooldownDisplay:gsub("{MINS}", "0");
RegisterNetEvent('Badger-Priorities:DrawText')
AddEventHandler('Badger-Priorities:DrawText', function(text)
	drawText = text;
end)
drawFast = false;
RegisterNetEvent('Badger-Priorities:TriggerTrue')
AddEventHandler('Badger-Priorities:TriggerTrue', function()
	drawFast = true 
end)
hideDisplays = false;
RegisterNetEvent('Badger-Priorities:HideDisplay')
AddEventHandler('Badger-Priorities:HideDisplay', function()
	hideDisplays = not hideDisplays;
end)
displayCooldown = 0;
Citizen.CreateThread(function()
	while true do 
		Wait(0);
		local x = Config.DisplayLocation.x;
		local y = Config.DisplayLocation.y;
		if not hideDisplays then 
			if #drawText > 1 then 
				Draw2DText(x, y, drawText, 0.5);
			end 
		end 
		if drawFast then 
			Draw2DText(.5, .5, Config.Options.TooFastDisplay, 1.0)
		end
		if Config.Options.EnableSpeedMessage then 
			local ped = GetPlayerPed(-1);
			local veh = GetVehiclePedIsIn(ped, 0);
			if veh ~= nil then 
				-- They are in a vehicle 
				if GetVehicleClass(veh) ~= 14 and GetVehicleClass(veh) ~= 15 and GetVehicleClass(veh) ~= 16 then 
					-- It's a car 
					local speed = GetEntitySpeed(veh) * 2.236936;
					if speed >= 80 then 
						-- Too fast if we are on cooldown
						if displayCooldown <= 2000 then 
							TriggerServerEvent('Badger-Priorities:TriggerCheck')
						else 
							drawFast = false;
						end
						displayCooldown = displayCooldown + 1;
						if displayCooldown == (1000 * 60) then 
							displayCooldown = 0;
						end
					else 
						drawFast = false;
						displayCooldown = 0;
					end
				end
			end
		end
	end
end)