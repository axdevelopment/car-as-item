ESX.RegisterUsableItem('patriot', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local calc1 = string.char(math.random(65, 65 + 25))..string.char(math.random(65, 65 + 25))..string.char(math.random(65, 65 + 25))
	local calc2 = math.random(100, 999)
	local plate = calc1.." "..calc2
	local vehicleprops = '{"modSteeringWheel":-1,"tyreSmokeColor":[255,255,255],"modHorns":-1,"modArchCover":-1,"neonColor":[255,255,255],"wheels":3,"modEngine":-1,"modDashboard":-1,"fuelLevel":65.0,"modStruts":-1,"xenonColor":255,"modDial":-1,"modArmor":-1,"modHood":-1,"modAerials":-1,"modFrame":-1,"modLivery":-1,"modSeats":-1,"neonEnabled":[false,false,false,false],"modAirFilter":-1,"modRoof":-1,"modGrille":-1,"modWindows":-1,"tankHealth":1000.0,"modFrontBumper":-1,"windowTint":-1,"modTurbo":false,"modFender":-1,"modTrimA":-1,"pearlescentColor":5,"modSpeakers":-1,"modExhaust":-1,"modSmokeEnabled":false,"modTrimB":-1,"modAPlate":-1,"modOrnaments":-1,"modHydrolic":-1,"color1":2,"modShifterLeavers":-1,"modRearBumper":-1,"modRightFender":-1,"wheelColor":156,"modXenon":false,"modTrunk":-1,"model":-808457413,"modSideSkirt":-1,"modEngineBlock":-1,"modDoorSpeaker":-1,"color2":0,"modBackWheels":-1,"modSuspension":-1,"modTransmission":-1,"bodyHealth":1000.0,"plate":"'..plate..'","plateIndex":0,"modSpoilers":-1,"engineHealth":1000.0,"modBrakes":-1,"modVanityPlate":-1,"modFrontWheels":-1,"modPlateHolder":-1,"extras":{"11":false,"6":false,"1":false,"12":true,"5":true},"modTank":-1,"dirtLevel":4.0}'
	
	MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, type, stored, favourite, sharedwith) VALUES (@owner, @plate, @vehicle, @type, @stored, @favourite, @sharedwith)',
	{
		['@owner']   = xPlayer.identifier,
		['@plate']   = plate,
		['@vehicle'] = vehicleprops,
		['@type']	 = "car",
		['@stored']  = 1,
		['@favourite']  = 0,
		['@sharedwith']  = "[]"
	})
	xPlayer.removeInventoryItem('patriot', 1)
	TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, 'Dead Island System', 'Crafting', "Das Fahrzeug Patriot mit dem Kennzeichen ~b~"..plate.." ~w~wurde erfolgreich in deine Garage gestellt", 'CHAR_CARSITE', 3)
	print("Das Fahrzeug Patriot mit dem Kennzeichen ^5"..plate.." ^0wurde erfolgreich in die Garage von ^5"..GetPlayerName(source).." ^0gestellt")
end)
