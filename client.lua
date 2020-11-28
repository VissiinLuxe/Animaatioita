function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 1 )
    end
end 

RegisterNetEvent('Antaudu')
AddEventHandler('Antaudu', function()
    local player = GetPlayerPed( -1 )
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
        loadAnimDict( "random@arrests" )
		loadAnimDict( "random@arrests@busted" )
		if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
			TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (3000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        else
            TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (4000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (500)
			TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (1000)
			TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
        end     
    end
end )

RegisterNetEvent('Kamera')
AddEventHandler('Kamera', function()
	ped = GetPlayerPed(-1);
	
	if ped then
		TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PAPARAZZI", 0, true);
		playing_emote = true;
	end
end)

RegisterNetEvent('Cop')
AddEventHandler('Cop', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "WORLD_HUMAN_COP_IDLES", 0, true);
		playing_emote = true;
	end
end )

local vihko = false

RegisterNetEvent('Vihko')
AddEventHandler('Vihko', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "CODE_HUMAN_MEDIC_TIME_OF_DEATH", 0, true);
		playing_emote = true;
	end
end )

RegisterNetEvent('Notepad')
AddEventHandler('Notepad', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "WORLD_HUMAN_CLIPBOARD", 0, true);
		playing_emote = true;
	end
end )

RegisterNetEvent('Istu')
AddEventHandler('Istu', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "WORLD_HUMAN_PICNIC", 0, true);
		playing_emote = true;
	end
end )

RegisterNetEvent('Nojaa')
AddEventHandler('Nojaa', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "world_human_leaning", 0, true);
		playing_emote = true;
	end
end )


RegisterNetEvent('R')
AddEventHandler('R', function()
	local ped = GetPlayerPed( -1 )
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
        loadAnimDict("random@arrests")
        if (IsEntityPlayingAnim(ped, "random@arrests", "generic_radio_chatter", 3 )) then
			ClearPedSecondaryTask(ped)
			SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        else
			TaskPlayAnim(ped, "random@arrests", "generic_radio_chatter", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
			SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        end    
    end
end )

RegisterNetEvent('Paskanna')
AddEventHandler('Paskanna', function()
    local player = GetPlayerPed(-1)
	if (DoesEntityExist(player) and not IsEntityDead(player)) then 
        loadAnimDict("missfbi3ig_0")
		
		if (IsEntityPlayingAnim(player, "missfbi3ig_0", "shit_loop_trev", 3)) then 
			Wait (3000)
            TaskPlayAnim( player, "missfbi3ig_0", "shit_react_trev", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        else
            TaskPlayAnim( player, "missfbi3ig_0", "shit_loop_trev", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (12000)
			TaskPlayAnim( player, "missfbi3ig_0", "shit_react_trev", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        end     
    end
end )
--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(0,21,true)
		end
	end
end)--]]

Citizen.CreateThread(function()
local ragdolli = false
	while true do
		Citizen.Wait(5)
		if IsControlJustPressed(1, 83) then
			ragdolli = not ragdolli
		end
		if ragdolli then
			SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
		end
	end
end)

RegisterNetEvent('Tutki')
AddEventHandler('Tutki', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "CODE_HUMAN_POLICE_INVESTIGATE", 0, true);
		playing_emote = true;
	end
end )

RegisterNetEvent('Napraa')
AddEventHandler('Napraa', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "PROP_HUMAN_PARKING_METER", 0, true);
		playing_emote = true;
	end
end )

RegisterNetEvent('Automaatti')
AddEventHandler('Automaatti', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "PROP_HUMAN_ATM", 0, true);
		playing_emote = true;
	end
end )

RegisterNetEvent('Kahvi2')
AddEventHandler('Kahvi2', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "WORLD_HUMAN_AA_COFFEE", 0, true);
		playing_emote = true;
	end
end )

IsAnimated = false

RegisterNetEvent('Kahvi')
AddEventHandler('Kahvi', function()
	if not IsAnimated then
		local prop_name = 'P_ING_COFFEECUP_02'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.11, 0.02, -0.03, 90.0, 150.0, 200.0, true, true, false, true, 1, true)
			RequestAnimDict("amb@world_human_drinking@coffee@female@idle_a")
			while not HasAnimDictLoaded("amb@world_human_drinking@coffee@female@idle_a") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_drinking@coffee@female@idle_a", "idle_a", 8.0, -8, -1, 55, 0, 0, 0, 0)
			Citizen.Wait(2000)
			while not IsControlPressed(0, 73) do
				if not IsEntityPlayingAnim(GetPlayerPed(-1), "amb@world_human_drinking@coffee@female@idle_a", "idle_a", 3) then
					break
				end
				Wait(5)
			end
			IsAnimated = false
			StopAnimPlayback(GetPlayerPed(-1), 0, true)
			DeleteObject(prop)
		end)
	end	
end )

RegisterNetEvent('animaatiot:metfiini')
AddEventHandler('animaatiot:metfiini', function()
	if not IsAnimated then
		local prop_name = 'prop_cs_meth_pipe'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.15, 0.04, -0.04, 120.0, 190.0, 20.0, true, true, false, true, 1, true)
			RequestAnimDict("timetable@ron@ig_4_smoking_meth")
			while not HasAnimDictLoaded("timetable@ron@ig_4_smoking_meth") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "timetable@ron@ig_4_smoking_meth", "chefiscookingup", 8.0, -8, -1, 16, 0, 0, 0, 0)
			Citizen.Wait(2000)
			if not HasNamedPtfxAssetLoaded("cut_prologue") then
				RequestNamedPtfxAsset("cut_prologue")
				while not HasNamedPtfxAssetLoaded("cut_prologue") do
					Wait(0)
				end
			end
			SetPtfxAssetNextCall("cut_prologue")
			StartNetworkedParticleFxLoopedOnEntity("cs_cig_smoke", prop, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, false, false, false)
			while not IsControlPressed(0, 73) do
				if not IsEntityPlayingAnim(GetPlayerPed(-1), "timetable@ron@ig_4_smoking_meth", "chefiscookingup", 3) then
					break
				end
				Wait(5)
			end
			IsAnimated = false
			StopAnimPlayback(GetPlayerPed(-1), 0, true)
			DeleteObject(prop)
		end)
	end	
end)

RegisterCommand('herkku', function(source, args, rawCommand)
	if not IsAnimated then
		local prop_name = 'prop_big_shit_01'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.15, 0.04, -0.04, 120.0, 190.0, 20.0, true, true, false, true, 1, true)
			RequestAnimDict("friends@frt@ig_1")
			while not HasAnimDictLoaded("friends@frt@ig_1") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "friends@frt@ig_1", "trevor_impatient_wait_3", 8.0, -8, -1, 16, 0, 0, 0, 0)
			Citizen.Wait(1000)
			if not HasNamedPtfxAssetLoaded("core") then
				RequestNamedPtfxAsset("core")
				while not HasNamedPtfxAssetLoaded("core") do
					Wait(0)
				end
			end
			SetPtfxAssetNextCall("core")
			StartNetworkedParticleFxLoopedOnEntity("ent_amb_fly_swarm", prop, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, false, false, false)
			Citizen.Wait(8000)
			RequestAnimDict("amb@code_human_wander_eating_donut@male@idle_a")
			while not HasAnimDictLoaded("amb@code_human_wander_eating_donut@male@idle_a") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "amb@code_human_wander_eating_donut@male@idle_a", "idle_a", 8.0, -8, -1, 55, 0, 0, 0, 0)
			Citizen.Wait(1000)
			if not HasNamedPtfxAssetLoaded("core") then
				RequestNamedPtfxAsset("core")
				while not HasNamedPtfxAssetLoaded("core") do
					Wait(0)
				end
			end
			SetPtfxAssetNextCall("core")
			StartNetworkedParticleFxLoopedOnEntity("ent_amb_fly_swarm", prop, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, false, false, false)
			while not IsControlPressed(0, 73) do
				if not IsEntityPlayingAnim(GetPlayerPed(-1), "amb@code_human_wander_eating_donut@male@idle_a", "idle_a", 3) then
					break
				end
				Wait(5)
			end
			SetPedToRagdoll(GetPlayerPed(-1), 60000, 60000, 0, false, false, false)
			IsAnimated = false
			StopAnimPlayback(GetPlayerPed(-1), 0, true)
			DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('donitsi')
AddEventHandler('donitsi', function()
	if not IsAnimated then
		local prop_name = 'prop_donut_01'
		local dict = 'amb@code_human_wander_eating_donut_fat@male@idle_a'
		local animation = 'idle_c'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.15, 0.03, -0.07, 0.0, 44.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 55, 0, 0, 0, 0)
			Citizen.Wait(1000)
			while not IsControlPressed(0, 73) do
				if not IsEntityPlayingAnim(GetPlayerPed(-1), dict, animation, 3) then
					break
				end
				Wait(5)
			end
			IsAnimated = false
			StopAnimPlayback(GetPlayerPed(-1), 0, true)
			DeleteObject(prop)
		end)
	end	
end)

RegisterNetEvent('Helppoojakivaa')
AddEventHandler('Helppoojakivaa', function()
	if not IsAnimated then
		local prop_name = 'ex_prop_exec_award_silver'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, -0.07, -0.1, 120.0, 190.0, 180.0, true, true, false, true, 1, true)
			RequestAnimDict("amb@world_human_seat_steps@male@hands_in_lap@idle_a")
			while not HasAnimDictLoaded("amb@world_human_seat_steps@male@hands_in_lap@idle_a") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_seat_steps@male@hands_in_lap@idle_a", "idle_a", 8.0, -8, -1, 55, 0, 0, 0, 0)
			Citizen.Wait(1000)
			while not IsControlPressed(0, 73) do
				if not IsEntityPlayingAnim(GetPlayerPed(-1), "amb@world_human_seat_steps@male@hands_in_lap@idle_a", "idle_a", 3) then
					break
				end
				Wait(5)
			end
			IsAnimated = false
			StopAnimPlayback(GetPlayerPed(-1), 0, true)
			DeleteObject(prop)
		end)
	end	
end)

RegisterNetEvent('bursa')
AddEventHandler('bursa', function()
	if not IsAnimated then
		local prop_name = 'prop_cs_burger_01'
		local dict = 'amb@code_human_wander_eating_donut_fat@male@idle_a'
		local animation = 'idle_c'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.15, 0.03, -0.07, 0.0, 44.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 55, 0, 0, 0, 0)
			Citizen.Wait(1000)
			while not IsControlPressed(0, 73) do
				if not IsEntityPlayingAnim(GetPlayerPed(-1), dict, animation, 3) then
					break
				end
				Wait(5)
			end
			IsAnimated = false
			StopAnimPlayback(GetPlayerPed(-1), 0, true)
			DeleteObject(prop)
		end)
	end	
end)

RegisterNetEvent('animaatiot:rooki')
AddEventHandler('animaatiot:rooki', function()
	if not IsAnimated then
		local prop_name = 'p_cs_ciggy_01b_s'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.16, 0.02, -0.01, 200.0, 90.0, 10.0, true, true, false, true, 1, true)
			RequestAnimDict("missmic2@enemy")
			while not HasAnimDictLoaded("missmic2@enemy") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "missmic2@enemy", "smoking_loop", 8.0, -8, -1, 55, 0, 0, 0, 0)
			Citizen.Wait(2000)
			if not HasNamedPtfxAssetLoaded("cut_prologue") then
				RequestNamedPtfxAsset("cut_prologue")
				while not HasNamedPtfxAssetLoaded("cut_prologue") do
					Wait(0)
				end
			end
			SetPtfxAssetNextCall("cut_prologue")
			StartNetworkedParticleFxLoopedOnEntity("cs_cig_smoke", prop, -0.07, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, false, false, false)
			while not IsControlPressed(0, 73) do
				if not IsEntityPlayingAnim(GetPlayerPed(-1), "missmic2@enemy", "smoking_loop", 3) then
					break
				end
				Wait(5)
			end
			IsAnimated = false
			StopAnimPlayback(GetPlayerPed(-1), 0, true)
			DeleteObject(prop)
		end)
	end	
end)

RegisterNetEvent('animaatiot:joopeli')
AddEventHandler('animaatiot:joopeli', function()
	if not IsAnimated then
		local prop_name = 'p_amb_joint_01'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.13, 0.05, -0.05, 10.0, 300.0, 50.0, true, true, false, true, 1, true)
			RequestAnimDict("timetable@gardener@smoking_joint")
			while not HasAnimDictLoaded("timetable@gardener@smoking_joint") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "timetable@gardener@smoking_joint", "smoke_idle", 8.0, -8, -1, 55, 0, 0, 0, 0)
			Citizen.Wait(2000)
			if not HasNamedPtfxAssetLoaded("cut_prologue") then
				RequestNamedPtfxAsset("cut_prologue")
				while not HasNamedPtfxAssetLoaded("cut_prologue") do
					Wait(0)
				end
			end
			SetPtfxAssetNextCall("cut_prologue")
			StartNetworkedParticleFxLoopedOnEntity("cs_cig_smoke_prologue", prop, -0.105, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, false, false, false)
			while not IsControlPressed(0, 73) do
				if not IsEntityPlayingAnim(GetPlayerPed(-1), "timetable@gardener@smoking_joint", "smoke_idle", 3) then
					break
				end
				Wait(5)
			end
			IsAnimated = false
			StopAnimPlayback(GetPlayerPed(-1), 0, true)
			DeleteObject(prop)
		end)
	end	
end)

RegisterNetEvent('Kartta')
AddEventHandler('Kartta', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "WORLD_HUMAN_TOURIST_MAP", 0, true);
		playing_emote = true;
	end
end )

RegisterNetEvent('Istu2')
AddEventHandler('Istu2', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "WORLD_HUMAN_STUPOR", 0, true);
		playing_emote = true;
	end
end )

RegisterNetEvent('Jammaile')
AddEventHandler('Jammaile', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "WORLD_HUMAN_STRIP_WATCH_STAND", 0, true);
		playing_emote = true;
	end
end )


RegisterNetEvent('Lammittele')
AddEventHandler('Lammittele', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "WORLD_HUMAN_STAND_FIRE", 0, true);
		playing_emote = true;
	end
end )

RegisterNetEvent('Kovis')
AddEventHandler('Kovis', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "WORLD_HUMAN_GUARD_STAND", 0, true);
		playing_emote = true;
	end
end )


RegisterNetEvent('Salakuva')
AddEventHandler('Salakuva', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true);
		playing_emote = true;
	end
end )

RegisterNetEvent('Makaa')
AddEventHandler('Makaa', function()
	player = GetPlayerPed(-1);
	
	if player then
		TaskStartScenarioInPlace(player, "WORLD_HUMAN_BUM_SLUMPED", 0, true);
		playing_emote = true;
	end
end )

RegisterNetEvent('Odota')
AddEventHandler('Odota', function()
local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
	RequestAnimDict(dict)
while not HasAnimDictLoaded(dict) do
	Citizen.Wait(100)
end
	TaskPlayAnim(GetPlayerPed(-1), dict, "base", 1.0,-1.0, 60000, 1, 1, 0, 0, 0)
end)

RegisterCommand('a1', function(source, args, rawCommand)
	local dict = "missheist_jewelleadinout"
	local animation = "jh_int_outro_loop_a"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 55, 0, 0, 0, 0)
end)

RegisterCommand('a2', function(source, args, rawCommand)
	local dict = "missheist_agency3aig_13"
	local animation = "wait_loops_crew2"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 55, 0, 0, 0, 0)
end)

RegisterCommand('a3', function(source, args, rawCommand)
	local dict = "missheistpaletoscoresetup_setup2"
	local animation = "cops_response_waitloop_bank_clerk3"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 55, 0, 0, 0, 0)
end)


RegisterCommand('a4', function(source, args, rawCommand)
	local dict = "switch@michael@rejected_entry"
	local animation = "001396_01_mics3_6_rejected_entry_idle_bouncer"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 55, 0, 0, 0, 0)
end)

RegisterCommand('a5', function(source, args, rawCommand)
	local dict = "random@shop_gunstore"
	local animation = "_idle_a"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 55, 0, 0, 0, 0)
end)

RegisterCommand('a6', function(source, args, rawCommand)
	local dict = "amb@world_human_muscle_flex@arms_in_front@idle_a"
	local animation = "idle_c"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 55, 0, 0, 0, 0)
end)

RegisterCommand('a7', function(source, args, rawCommand)
	local dict = "amb@world_human_hiker_standing@male@idle_a"
	local animation = "idle_a"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 55, 0, 0, 0, 0)
end)

RegisterCommand('a8', function(source, args, rawCommand)
	local dict = "amb@world_human_hang_out_street@female_arms_crossed@idle_a"
	local animation = "idle_a"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 55, 0, 0, 0, 0)
end)

RegisterCommand('a9', function(source, args, rawCommand)
	local dict = "amb@world_human_cop_idles@male@idle_a"
	local animation = "idle_c"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 55, 0, 0, 0, 0)
end)

RegisterCommand('a10', function(source, args, rawCommand)
	local dict = "amb@world_human_cop_idles@female@idle_a"
	local animation = "idle_a"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 55, 0, 0, 0, 0)
end)

RegisterNetEvent('vihko69')
AddEventHandler('vihko69', function()
	if not IsAnimated then
		local prop_name = 'P_AMB_CLIPBOARD_01'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 60309), 0.01, -0.005, 0.04, 180.0, 140.0, 180.0, true, true, false, true, 1, true)
			RequestAnimDict("amb@world_human_clipboard@male@idle_b")
			while not HasAnimDictLoaded("amb@world_human_clipboard@male@idle_b") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_clipboard@male@idle_b", "idle_d", 8.0, -8, -1, 55, 0, 0, 0, 0)
			Citizen.Wait(2000)
            while not IsControlPressed(0, 73) do
                if not IsEntityPlayingAnim(GetPlayerPed(-1), "amb@world_human_clipboard@male@idle_b", "idle_d", 3) then
                    break
                end
                Wait(5)
            end
            IsAnimated = false
            StopAnimPlayback(GetPlayerPed(-1), 0, true)
            DeleteObject(prop)
        end)
    end
end )

RegisterNetEvent('pyyhk')
AddEventHandler('pyyhk', function()
	if not IsAnimated then
		local prop_name = 'PROP_SPONGE_01'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.11, -0.02, -0.03, 120.0, 180.0, 200.0, true, true, false, true, 1, true)
			RequestAnimDict("timetable@floyd@clean_kitchen@base")
			while not HasAnimDictLoaded("timetable@floyd@clean_kitchen@base") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "timetable@floyd@clean_kitchen@base", "base", 8.0, -8, -1, 55, 0, 0, 0, 0)
			Citizen.Wait(2000)
            while not IsControlPressed(0, 73) do
                if not IsEntityPlayingAnim(GetPlayerPed(-1), "timetable@floyd@clean_kitchen@base", "base", 3) then
                    break
                end
                Wait(5)
            end
            IsAnimated = false
            StopAnimPlayback(GetPlayerPed(-1), 0, true)
            DeleteObject(prop)
        end)
    end
end )

RegisterCommand('ilmaan', function(source, args, rawCommand)
	local dict = "anim@mp_rollarcoaster"
	local animation = "hands_up_idle_a_player_one"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 55, 0, 0, 0, 0)
end)

RegisterCommand('isokipu', function(source, args, rawCommand)
	local dict = "combat@damage@writheidle_a"
	local animation = "writhe_idle_a"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 1, 0, 0, 0, 0)
end)

RegisterCommand('puuska', function(source, args, rawCommand)
	local dict = "oddjobs@assassinate@guard"
	local animation = "unarmed_fold_arms"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 55, 0, 0, 0, 0)
end)

RegisterNetEvent('vihko1')
AddEventHandler('vihko1', function()
    if not IsAnimated then
        local prop_name = 'PROP_PENCIL_01'
        local prop_name2 = 'PROP_NOTEPAD_02'
        IsAnimated = true
        local playerPed = GetPlayerPed(-1)
        Citizen.CreateThread(function()
            local x,y,z = table.unpack(GetEntityCoords(playerPed))
            prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
            prop2 = CreateObject(GetHashKey(prop_name2), x, y, z+0.2, true, true, true)
            AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.09, 0.01, -0.05, 90.0, 150.0, 200.0, true, true, false, true, 1, true)
            AttachEntityToEntity(prop2, playerPed, GetPedBoneIndex(playerPed, 60309), -0.00, 0.00, 0.03, 193.0, 150.0, 200.0, true, true, false, true, 1, true)
            RequestAnimDict("amb@medic@standing@timeofdeath@base")
            while not HasAnimDictLoaded("amb@medic@standing@timeofdeath@base") do
                Citizen.Wait(0)
            end
            TaskPlayAnim(GetPlayerPed(-1), "amb@medic@standing@timeofdeath@base", "base", 8.0, -8, -1, 55, 0, 0, 0, 0)
            Citizen.Wait(2000)
            while not IsControlPressed(0, 73) do
                if not IsEntityPlayingAnim(GetPlayerPed(-1), "amb@medic@standing@timeofdeath@base", "base", 3) then
                    break
                end
                Wait(5)
            end
            IsAnimated = false
            StopAnimPlayback(GetPlayerPed(-1), 0, true)
            DeleteObject(prop)
            DeleteObject(prop2)
        end)
    end
end )

RegisterCommand('nuku', function(source, args, rawCommand)
	local dict = "timetable@tracy@sleep@"
	local animation = "base"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 1, 0, 0, 0, 0)
end)


RegisterNetEvent('kanna')
AddEventHandler('kanna', function()
	if not IsAnimated then
		local prop_name = 'prop_paper_box_02'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 11816), -0.2, 0.38, 0.001, 10.0, 285.0, 270.0, true, true, false, true, 1, true)
			RequestAnimDict("anim@heists@box_carry@")
			while not HasAnimDictLoaded("anim@heists@box_carry@") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "idle", 8.0, -8, -1, 55, 0, 0, 0, 0)
			Citizen.Wait(2000)
            while not IsControlPressed(0, 73) do
                if not IsEntityPlayingAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "idle", 3) then
                    break
                end
                Wait(5)
            end
            IsAnimated = false
            StopAnimPlayback(GetPlayerPed(-1), 0, true)
            DeleteObject(prop)
        end)
    end
end )

RegisterCommand('istu3', function(source, args, rawCommand)
	local dict = "anim@heists@fleeca_bank@ig_7_jetski_owner"
	local animation = "owner_idle"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 1, 0, 0, 0, 0)
end)

RegisterNetEvent('Viini')
AddEventHandler('Viini', function()
	if not IsAnimated then
		local prop_name = 'prop_drink_redwine'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.11, -0.06, -0.03, 90.0, 150.0, 200.0, true, true, false, true, 1, true)
			RequestAnimDict("amb@world_human_drinking@coffee@female@idle_a")
			while not HasAnimDictLoaded("amb@world_human_drinking@coffee@female@idle_a") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_drinking@coffee@female@idle_a", "idle_a", 8.0, -8, -1, 55, 0, 0, 0, 0)
			Citizen.Wait(2000)
			while not IsControlPressed(0, 73) do
				if not IsEntityPlayingAnim(GetPlayerPed(-1), "amb@world_human_drinking@coffee@female@idle_a", "idle_a", 3) then
					break
				end
				Wait(5)
			end
			IsAnimated = false
			StopAnimPlayback(GetPlayerPed(-1), 0, true)
			DeleteObject(prop)
		end)
	end	
end )

RegisterNetEvent('Viski')
AddEventHandler('Viski', function()
	if not IsAnimated then
		local prop_name = 'prop_drink_whisky'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.11, -0.03, -0.04, 90.0, 150.0, 200.0, true, true, false, true, 1, true)
			RequestAnimDict("amb@world_human_drinking@coffee@female@idle_a")
			while not HasAnimDictLoaded("amb@world_human_drinking@coffee@female@idle_a") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_drinking@coffee@female@idle_a", "idle_a", 8.0, -8, -1, 55, 0, 0, 0, 0)
			Citizen.Wait(2000)
			while not IsControlPressed(0, 73) do
				if not IsEntityPlayingAnim(GetPlayerPed(-1), "amb@world_human_drinking@coffee@female@idle_a", "idle_a", 3) then
					break
				end
				Wait(5)
			end
			IsAnimated = false
			StopAnimPlayback(GetPlayerPed(-1), 0, true)
			DeleteObject(prop)
		end)
	end	
end )

RegisterNetEvent('Mojito')
AddEventHandler('Mojito', function()
	if not IsAnimated then
		local prop_name = 'prop_mojito'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.11, -0.13, -0.08, 90.0, 150.0, 200.0, true, true, false, true, 1, true)
			RequestAnimDict("amb@world_human_drinking@coffee@female@idle_a")
			while not HasAnimDictLoaded("amb@world_human_drinking@coffee@female@idle_a") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_drinking@coffee@female@idle_a", "idle_a", 8.0, -8, -1, 55, 0, 0, 0, 0)
			Citizen.Wait(2000)
			while not IsControlPressed(0, 73) do
				if not IsEntityPlayingAnim(GetPlayerPed(-1), "amb@world_human_drinking@coffee@female@idle_a", "idle_a", 3) then
					break
				end
				Wait(5)
			end
			IsAnimated = false
			StopAnimPlayback(GetPlayerPed(-1), 0, true)
			DeleteObject(prop)
		end)
	end	
end )

RegisterCommand('Mojito', function(source, args, rawCommand)
	TriggerEvent('Mojito')
end)

RegisterCommand('Viski', function(source, args, rawCommand)
	TriggerEvent('Viski')
end)

RegisterCommand('Viini', function(source, args, rawCommand)
	TriggerEvent('Viini')
end)

--------------Tanssit---------------------
RegisterCommand('tanssi1', function(source, args, rawCommand)
	local dict = "special_ped@mountain_dancer@monologue_1@monologue_1a"
	local animation = "mtn_dnc_if_you_want_to_get_to_heaven"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 1, 0, 0, 0, 0)
end)

RegisterCommand('tanssi2', function(source, args, rawCommand)
	local dict = "special_ped@mountain_dancer@monologue_2@monologue_2a"
	local animation = "mnt_dnc_angel"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 1, 0, 0, 0, 0)
end)
 
RegisterCommand('tanssi3', function(source, args, rawCommand)
	local dict = "special_ped@mountain_dancer@monologue_3@monologue_3a"
	local animation = "mnt_dnc_buttwag"
			RequestAnimDict(dict)
			while not HasAnimDictLoaded(dict) do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), dict, animation, 8.0, -8, -1, 1, 0, 0, 0, 0)
end)
----------

RegisterCommand('kanna', function(source, args, rawCommand)
	TriggerEvent('kanna')
end)

RegisterCommand('vihko1', function(source, args, rawCommand)
	TriggerEvent('vihko1')
end)

RegisterCommand('cop', function(source, args, rawCommand)
	TriggerEvent('Cop')
end)

RegisterCommand('pyyhk', function(source, args, rawCommand)
	TriggerEvent('pyyhk')
end)

RegisterCommand('muistio1', function(source, args, rawCommand)
	TriggerEvent('vittusaatana')
end)