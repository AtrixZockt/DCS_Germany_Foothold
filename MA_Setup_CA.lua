env.info("Mission Setup : is loading.")

function merge(tbls)
	local res = {}
	for i,v in ipairs(tbls) do
		for i2,v2 in ipairs(v) do
			table.insert(res,v2)
		end
	end
	
	return res
end

function allExcept(tbls, except)
	local tomerge = {}
	for i,v in pairs(tbls) do
		if i~=except then
			table.insert(tomerge, v)
		end
	end
	return merge(tomerge)
end

upgrades = {
	redships = {
		blue = {'blueShip Fixed'},
		red = {'Molniya', 'Molniya', 'Rwzky', 'Rwzky', 'Neustrashimy', 'Moskva'}
	},
	blueships = {
		blue = {'blueShip'},
		red = {'Moskva'}
	},
	airfield1 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry1', 'Red SAM AAA', 'Red SAM AAA group 2', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 group 2', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 group 2'}
	},
	Soganlug = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'Red SAM AAA Fixed', 'Red SAM SHORAD SA-15 Fixed Soganlug', 'Red SAM SHORAD SA-8 Fixed'}
	},
	Mineralnye = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry1', 'Red SAM AAA', 'Red SAM AAA group 2', 'Mineralnye HQ', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 group 2', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 group 2'}
	},
	Novorossiysk = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry1', 'Red SAM AAA', 'Red SAM AAA group 2', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-19 group 2','Communication Tower', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-15'}
	},
	airfield2 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry1', 'Red SAM AAA', 'Red SAM AAA group 2', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 group 2', 'Red SAM SHORAD SA-8'}
	},
	Kobuleti = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry1', 'Red SAM AAA', 'Red SAM AAA group 2', 'Red armoured group 2', 'Red armoured group 3','Kobuleti Fuel Tank 2', 'Red SAM SHORAD SA-15','Kobuleti Fuel Tank', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-15 group 2'}
	},
	airfield3 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD2'},
		red = {'redInfantry2', 'Red Tanks', 'Red armoured group 1', 'Red SAM AAA', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 group 2'}
	},
	Pashkovsky = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD2'},
		red = {'redInfantry2', 'Red Tanks', 'Red armoured group 1','Pashkovsky HQ', 'Red SAM AAA','Pashkovsky HQ 2', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 group 2', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 group 2'}
	},
	Sochi = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD2'},
		red = {'Red Tanks', 'Red armoured group 1','Sochi Communication Tower','Sochi Fuel Tank 3','Red SAM AAA','Red SAM SHORAD SA-19 group 2', 'Sochi Fuel Tank 2', 'Red SAM SHORAD SA-19','Sochi Fuel Tank', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 group 2'}
	},
	airfield3Maykop = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD2'},
		red = {'redInfantry2', 'Red Tanks', 'Red armoured group 1','Maykop fuel storage', 'Red SAM SHORAD SA-19','Maykop HQ bulding', 'Red SAM SHORAD SA-15'}
	},
	
	airfield4 = {
		blue = {'blueInfantry','blueArmor', 'bluePD2'},
		red = {'redInfantry2', 'Red SAM AAA', 'Red SAM AAA group 2', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 group 2'}
	},
	Anapa = {
		blue = {'blueInfantry','blueArmor', 'bluePD2'},
		red = {'Red SAM AAA group 2', 'Red armoured group 2', 'Red armoured group 3', 'Anapa Command Center','Red SAM AAA', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 group 2', 'Red SAM SHORAD SA-8'}
	},
	airfield4Kutaisi = {
		blue = {'blueInfantry','blueArmor', 'bluePD2'},
		red = {'Red SAM AAA', 'Red SAM AAA group 2', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-15 Fixed','Kutaisi Fuel tank', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 group 2', 'Kutaisi Fuel tank 2', 'Red SAM SA-6 Fixed Kutaisi', 'Kutaisi Fuel tank 3', 'Kutaisi Fuel tank 4'}
	},
	
	samalphaFixed = {
		blue = {'blueArmor', 'bluePD1'},
		red = {'Red SAM SHORAD SA-15 Fixed alpha', 'Red SAM SA-2 Fixed Alpha', 'Red SAM SA-3 Fixed Alpha'}
	},
	samFoxtrotFixed = {
		blue = {},
		red = {'Red SAM SHORAD SA-19', 'Red SAM SHORAD Fixed', 'Red SAM Fixed SA-2 Foxtrot'}
	},
	sambravoFixed = {
		blue = {'blueHAWK'},
		red = {'Red SAM AAA','Red SAM SHORAD SA-15 Fixed Bravo','Red SAM SA-2 Fixed bravo'}
	},
	
	samgolf = {
		blue = {'blueArmor', 'bluePD1'},
		red = {'Red SAM SA-6 Fixed Golf', 'Red SAM SHORAD SA-19 Fixed Golf-1', 'Red SAM SHORAD SA-19 Fixed Golf-2', 'Red SAM SHORAD SA-19 Fixed Golf-3', 'Red SAM SHORAD SA-19 Fixed Golf-4', 'Red SAM SHORAD SA-15 Fixed Golf-5', 
		'Red SAM SHORAD SA-15 Fixed Golf-6', 'Red SAM SA-10 Fixed Golf'}
	},
	
	sam3 = {
		blue = {'blueArmor', 'bluePD2'},
		red = {'Red SAM AAA','Red SAM SHORAD SA-15', 'Red SAm SHORAD SA-15 group 2', 'Red SAM SA-6', 'Red SAM SHORAD SA-8'}
	},
	samcharliefixed = {
		blue = {'blueHAWK'},
		red = {'Red SAM AAA', 'Red SAM AAA group 2', 'Red SAM SHORAD SA-15 Fixed Charlie', 'Red SAM SHORAD SA-19 Fixed Charlie-2', 'Red SAM SA-6 Fixed Charlie'}
	},
	sam4indiafixed = {
		blue = {'blueArmor', 'bluePD2'},
		red = {'Red SAM AAA','Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-8','Red SAM SHORAD SA-15','Red SAM SA-10 India Fixed', 'Red SAM SHORAD SA-15 group 2'}
	},
	sam4kilofixed = {
		blue = {'blueArmor', 'bluePD2'},
		red = {'Red SAM AAA','Red SAM SHORAD SA-15','Red SAM SA-10 kilo Fixed', 'Red SAM SHORAD SA-15 group 2', 'Red SAM AAA group 2'}
	},
	
	samdeltaFixed = {
		blue = {'blueHAWK'},
		red = {'Red SAM AAA','Red SAM SHORAD SA-19 Fixed Delta','Red SAM Fixed SA-10 Delta'}
	},
	sam5 = {
		blue = {'blueArmor', 'blueHAWK'},
		red = {'Red SAM SHORAD SA-15','Red SAM AAA','Red SAM SHORAD SA-8', 'Red SAM AAA group 2', 'Red SAM SA-11', 'Red SAM SHORAD SA-15 group 2'}
	},
	
	SamLimaFixedSA11 = {
		blue = {},
		red = {'Red SAM SHORAD SA-15 Fixed SAM-Lima', 'Red SAM SA-6 Fixed SAM-Lima', 'Red SAM SA-11 Fixed SAM-Lima'}
	},
	
	sam6 = {
		blue = {},
		red = {'Red SAM SHORAD Fixed SAM-Mike-1', 'Red SAM SHORAD Fixed SAM-Mike-2', 'Red SAM SA-5 Fixed SAM-Mike'}
	},
	farp1 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry1','Red Tanks', 'Red armoured group 1','Red SAM AAA','Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-8', 'Red SAM AAA group 2'}
	},
	Echo = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry1','Echo Troops Tent 2','Red Tanks', 'Red armoured group 1','Red SAM AAA','Echo Troops Tent','Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-8'}
	},
	Alpha = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry1','Red Tanks', 'Red armoured group 1','Alpha Troops Tent','Red SAM AAA','Alpha Troops Tent 2','Red SAM AAA group 2', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 group 2'}
	},
	farp2 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry1', 'Red Tanks', 'Red armoured group 1', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 group 2', 'Red SAM SHORAD SA-15'}
	},
	farp3 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD2'},
		red = {'Red Tanks', 'Red armoured group 1', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 group 2'}
	},
	Golf = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD2'},
		red = {'Red armoured group 2', 'Red armoured group 3','Golf Troops Tent 2','Red SAM SHORAD SA-15 group 2', 'Red SAM SHORAD SA-8','Golf Troops Tent', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-8 group 2'}
	},
	farp4 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD2'},
		red = {'redInfantry2', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 group 2'}
	},
	mission1 = {
		blue = {'blueInfantry', 'blueArmor'},
		red = {'redInfantry1', 'Red Tanks', 'Red armoured group 1', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-15'}
	},
	MiningFacilityFixed = {
		blue = {},
		red = {'MiningFacility Fixed Group 1','MiningFacility Cargo', 'MiningFacility Facotry', 'MiningFacility Fixed Group 2', 'MiningFacility HQ', 'MiningFacility Fixed Group 3', 'MiningFacility Fixed Group 4'}
	},
	TankFactory = {
		blue = {'blueInfantry', 'blueArmor'},
		red = {'redInfantry2', 'Red armoured group 2', 'Red armoured group 3','Tank Factory', 'Red SAM SHORAD SA-19','Tank Factory 2', 'Red SAM SHORAD SA-15'}
	},
	insurgentcamp = {
		blue = {'blueInfantry', 'blueArmor'},
		red = {'redInfantry2', 'Red armoured group 2', 'Red armoured group 3', 'InsurgentCamp', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 group 2', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 group 2'}
	}, 
	ChemSite = {
		blue = {'blueInfantry', 'blueArmor'},
		red = {'redInfantry2', 'Red SAM AAA','Chemical tank 3','Chemsite Factory','Chemical tank 2', 'Red armoured group 2', 'Red armoured group 3','Chemsite Factory 2','Chemical tank', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 group 2'}
	},
	SecretTechFacility = {
		blue = {'blueInfantry', 'blueArmor'},
		red = {'redInfantry2', 'Red SAM AAA','SecretTechFacility Factory', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-8','SecretTechFacility Factory 2', 'Red SAM SHORAD SA-15', 'SecretTechFacility HQ'}
	}, 
	ArtilleryFactory = {
		blue = {'blueInfantry', 'blueArmor'},
		red = {'redInfantry2', 'Red SAM AAA','Artillery Factory','Artillery Storage', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-8','Artillery Storage 2', 'Red SAM SHORAD SA-15', 'Artillery Storage 3'}
	},
	fueldepo = {
		blue = {'blueInfantry', 'blueArmor'},
		red = {'redInfantry2','FuelDepo Refinery', 'Fuel Depo tank','Red SAM SHORAD SA-8 group 2', 'Red SAM AAA', 'Fuel Depo tank 2', 'Red armoured group 2', 'Red armoured group 3','Fuel Depo tank 3', 'Red SAM SHORAD SA-8', 'Fuel Depo tank 4'}
	},
	SAMEcho = {
		blue = {'blueHAWK'},
		red = {'SAM -Echo-tripple-AA Fixed', 'Red SAM SHORAD Fixed Echo', 'Red SAM Fixed SA-11 Echo'}
	},
	ammunitiondepounits = {
		blue = {},
		red = {'Red SAM SHORAD SA-15 Fixed ammunitiondepo','Ammunition Storage','Ammunition Storage 2', 'ManPad Fixed AmmonitionDepo','Ammunition Storage 3', 'Fixed Ammunitiondepo Armor', 'Ammunition Storage 4'}
	},
	Hidden1Group = {
		blue = {},
		red = {'HQ Fixed', 'Red EWR Fixed 1', 'Red EWR Fixed 3', 'Red EWR Fixed 2', 'Red EWR 4 Fixed'}
	}
}

flavor = {
	redcarrier = 'Enemy carrier zone',
	bluecarrier = 'WPT \nStart zone',
	
	batumi = 'WPT 2\n',
	kobuleti = 'WPT 3\n',
	senaki = 'WPT 4\n',
	kutaisi = 'WPT 5\n',
	alpha = 'WPT 6\n',
	sukhumi = 'WPT 7\n',
	gudauta = 'WPT 8\n',
	sochi = 'WPT 9\n',
	bravo = 'WPT 10\n',
	charlie = 'WPT 11\n',
	delta = 'WPT 12\n',
	gelendzhik = 'WPT 13\n',
	novorossiysk = 'WPT 14\n',
	anapa = 'WPT 15\n',
	krymsk = 'WPT 16\n',
	echo = 'WPT 17\n',
	krasnodarc = 'WPT 18\n',
	krasnodarp = 'WPT 19\n',
	foxtrot = 'WPT 20\n',
	maykop = 'WPT 21\n',
	golf = 'WPT 22\n',
	hotel = 'WPT 23\n',
	india = 'WPT 24\n',
	mineralnye = 'WPT 25\n',
	nalchik = 'WPT 26\n',
	moxdok = 'WPT 27\n',
	beslan = 'WPT 28\n',
	juliett = 'WPT 29\n',
	kilo = 'WPT 30\n', 
	lima = 'WPT 31\n', 
	soganlug= 'WPT 32\n', 
	tbilisi = 'WPT 33\n',
	vaziani = 'WPT 34\n',
	
	miningfacility = 'WPT \n',
	insurgentcamp = 'WPT \n',
	secrettechfacility = 'WPT \n',
	fueldepo = 'WPT \n',
	ammonitiondepo = 'WPT \n',
	tankfactory = 'WPT \n',
	samsite = 'WPT \n',
	chemsite = 'WPT \n',
	artilleryfactory = 'WPT \n',
	
	samalpha = 'WPT \n',
	sambravo = 'WPT \n',
	samcharlie = 'WPT \n',
	samdelta = 'WPT \n',
	samecho = 'WPT \n',
	samfoxtrot = 'WPT \n',
	samgolf = 'WPT \n',
	samhotel = 'WPT \n',
	samindia = 'WPT \n',
	samjuliett = 'WPT \n',
	samkilo = 'WPT \n',
	samlima = 'WPT \n',
	sammike = 'WPT \n'
}
WaypointList = {
    Batumi = ' (2)',
    Kobuleti = ' (3)',
    Senaki = ' (4)',
    Kutaisi = ' (5)',
    Alpha = ' (6)',
    Sukhumi = ' (7)',
    Gudauta = ' (8)',
    Sochi = ' (9)',
    Bravo = ' (10)',
    Charlie = ' (11)',
    Delta = ' (12)',
    Gelendzhik = ' (13)',
    Novorossiysk = ' (14)',
    Anapa = ' (15)',
    Krymsk = ' (16)',
    Echo = ' (17)',
    ["Krasnodar-Center"] = ' (18)',
    ["Krasnodar-Pashkovsky"] = ' (19)',
    Foxtrot = ' (20)',
    Maykop = ' (21)',
    Golf = ' (22)',
    Hotel = ' (23)',
    India = ' (24)',
    Mineralnye = ' (25)',
    Nalchik = ' (26)',
    Mozdok = ' (27)',
    Beslan = ' (28)',
    Juliett = ' (29)',
    Kilo = ' (30)',
    Lima = ' (31)',
    Soganlug = ' (32)',
    Tbilisi = ' (33)',
    Vaziani = ' (34)'
}
local filepath = 'FootHold_CA_v0.2.lua'
if lfs then 
	local dir = lfs.writedir()..'Missions/Saves/'
	lfs.mkdir(dir)
	filepath = dir..filepath
	env.info('Foothold - Save file path: '..filepath)
end
bc = BattleCommander:new(filepath, 10, 60)
zones = {
	redcarrier = ZoneCommander:new({zone='Red Carrier', side=1, level=6, upgrades=upgrades.redships, crates={}, flavorText=flavor.redcarrier}),
	bluecarrier = ZoneCommander:new({zone='Blue Carrier', side=2, level=1, upgrades=upgrades.blueships, crates={}, flavorText=flavor.bluecarrier}),
	
	batumi = ZoneCommander:new({zone='Batumi', side=2, level=7, upgrades=upgrades.airfield1, crates={}, flavorText=flavor.batumi}),
	kobuleti = ZoneCommander:new({zone='Kobuleti', side=1, level=20, upgrades=upgrades.Kobuleti, crates={}, flavorText=flavor.kobuleti}),
	senaki = ZoneCommander:new({zone='Senaki', side=1, level=20, upgrades=upgrades.airfield3, crates={}, flavorText=flavor.senaki}),
	kutaisi = ZoneCommander:new({zone='Kutaisi', side=1, level=20, upgrades=upgrades.airfield4Kutaisi, crates={}, flavorText=flavor.kutaisi}),
	sukhumi = ZoneCommander:new({zone='Sukhumi', side=1, level=10, upgrades=upgrades.airfield1, crates={}, flavorText=flavor.sukhumi}),
	gudauta = ZoneCommander:new({zone='Gudauta', side=1, level=20, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.gudauta}),
	sochi = ZoneCommander:new({zone='Sochi', side=0, level=7, upgrades=upgrades.Sochi, crates={}, flavorText=flavor.sochi, NeutralAtStart=true}),
	gelendzhik = ZoneCommander:new({zone='Gelendzhik', side=0, level=7, upgrades=upgrades.airfield4, crates={}, flavorText=flavor.gelendzhik, NeutralAtStart=true}),
	novorossiysk = ZoneCommander:new({zone='Novorossiysk', side=0, level=7, upgrades=upgrades.Novorossiysk, crates={}, flavorText=flavor.novorossiysk, NeutralAtStart=true}),
	anapa = ZoneCommander:new({zone='Anapa', side=1, level=20, upgrades=upgrades.Anapa, crates={}, flavorText=flavor.anapa}),
	krymsk = ZoneCommander:new({zone='Krymsk', side=0, level=7, upgrades=upgrades.airfield3, crates={}, flavorText=flavor.krymsk, NeutralAtStart=true}),
	krasnodarc = ZoneCommander:new({zone='Krasnodar-Center', side=0, level=5, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.krasnodarc, NeutralAtStart=true}),
	krasnodarp = ZoneCommander:new({zone='Krasnodar-Pashkovsky', side=0, level=5, upgrades=upgrades.Pashkovsky, crates={}, flavorText=flavor.krasnodarp, NeutralAtStart=true}),
	maykop = ZoneCommander:new({zone='Maykop', side=0, level=5, upgrades=upgrades.airfield3Maykop, crates={}, flavorText=flavor.maykop, NeutralAtStart=true}),
	mineralnye = ZoneCommander:new({zone='Mineralnye', side=0, level=5, upgrades=upgrades.Mineralnye, crates={}, flavorText=flavor.mineralnye, NeutralAtStart=true}),
	nalchik = ZoneCommander:new({zone='Nalchik', side=1, level=20, upgrades=upgrades.airfield3, crates={}, flavorText=flavor.nalchik}),
	mozdok = ZoneCommander:new({zone='Mozdok', side=0, level=5, upgrades=upgrades.airfield4, crates={}, flavorText=flavor.mozdok, NeutralAtStart=true}),
	beslan = ZoneCommander:new({zone='Beslan', side=1, level=20, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.beslan}),
	soganlug = ZoneCommander:new({zone='Soganlug', side=0, level=7, upgrades=upgrades.Soganlug, crates={}, flavorText=flavor.soganlug, NeutralAtStart=true}),
	tbilisi = ZoneCommander:new({zone='Tbilisi', side=0, level=7, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.tbilisi, NeutralAtStart=true}),
	vaziani = ZoneCommander:new({zone='Vaziani', side=1, level=20, upgrades=upgrades.airfield4, crates={}, flavorText=flavor.vaziani, NeutralAtStart=true}),
	
	alpha = ZoneCommander:new({zone='Alpha', side=1, level=20, upgrades=upgrades.Alpha, crates={}, flavorText=flavor.alpha}),
	bravo = ZoneCommander:new({zone='Bravo', side=0, level=7, upgrades=upgrades.farp2, crates={}, flavorText=flavor.bravo, NeutralAtStart=true}),
	charlie = ZoneCommander:new({zone='Charlie', side=0, level=7, upgrades=upgrades.farp3, crates={}, flavorText=flavor.charlie, NeutralAtStart=true}),
	delta = ZoneCommander:new({zone='Delta', side=0, level=7, upgrades=upgrades.farp4, crates={}, flavorText=flavor.delta, NeutralAtStart=true}),
	echo = ZoneCommander:new({zone='Echo', side=0, level=7, upgrades=upgrades.Echo, crates={}, flavorText=flavor.echo, NeutralAtStart=true}),
	foxtrot = ZoneCommander:new({zone='Foxtrot', side=0, level=7, upgrades=upgrades.farp2, crates={}, flavorText=flavor.foxtrot, NeutralAtStart=true}),
	golf = ZoneCommander:new({zone='Golf', side=0, level=7, upgrades=upgrades.Golf, crates={}, flavorText=flavor.golf, NeutralAtStart=true}),
	hotel = ZoneCommander:new({zone='Hotel', side=0, level=7, upgrades=upgrades.farp4, crates={}, flavorText=flavor.hotel, NeutralAtStart=true}),
	india = ZoneCommander:new({zone='India', side=0, level=7, upgrades=upgrades.farp1, crates={}, flavorText=flavor.india, NeutralAtStart=true}),
	juliett = ZoneCommander:new({zone='Juliett', side=0, level=7, upgrades=upgrades.farp2, crates={}, flavorText=flavor.juliett, NeutralAtStart=true}),
	kilo = ZoneCommander:new({zone='Kilo', side=0, level=7, upgrades=upgrades.farp3, crates={}, flavorText=flavor.kilo, NeutralAtStart=true}),
	lima = ZoneCommander:new({zone='Lima', side=0, level=7, upgrades=upgrades.farp4, crates={}, flavorText=flavor.lima, NeutralAtStart=true}),
	
	miningfacility = ZoneCommander:new({zone='MiningFacility', side=1, level=12, upgrades=upgrades.MiningFacilityFixed, crates={}, flavorText=flavor.miningfacility}),
	insurgentcamp = ZoneCommander:new({zone='InsurgentCamp', side=0, level=20, upgrades=upgrades.insurgentcamp, crates={}, flavorText=flavor.insurgentcamp, NeutralAtStart=true}),
	secrettechfacility = ZoneCommander:new({zone='SecretTechFacility', side=0, level=4, upgrades=upgrades.SecretTechFacility, crates={}, flavorText=flavor.secrettechfacility, NeutralAtStart=true}),
	fueldepo = ZoneCommander:new({zone='FuelDepo', side=1, level=20, upgrades=upgrades.fueldepo, crates={}, flavorText=flavor.fueldepo}),
	ammonitiondepo = ZoneCommander:new({zone='AmmonitionDepo', side=0, level=4, upgrades=upgrades.ammunitiondepounits, crates={}, flavorText=flavor.ammonitiondepo, NeutralAtStart=true}),
	tankfactory = ZoneCommander:new({zone='TankFactory', side=0, level=4, upgrades=upgrades.TankFactory, crates={}, flavorText=flavor.tankfactory, NeutralAtStart=true}),
	chemsite = ZoneCommander:new({zone='ChemSite', side=0, level=4, upgrades=upgrades.ChemSite, crates={}, flavorText=flavor.chemsite, NeutralAtStart=true}),
	artilleryfactory = ZoneCommander:new({zone='ArtilleryFactory', side=0, level=4, upgrades=upgrades.ArtilleryFactory, crates={}, flavorText=flavor.artilleryfactory, NeutralAtStart=true}),
	samsite = ZoneCommander:new({zone='SAMSite', side=0, level=4, upgrades=upgrades.sam5, crates={}, flavorText=flavor.samsite, NeutralAtStart=true}),
	
	samalpha = ZoneCommander:new({zone='SAM-Alpha', side=1, level=20, upgrades=upgrades.samalphaFixed, crates={}, flavorText=flavor.samalpha}),
	sambravo = ZoneCommander:new({zone='SAM-Bravo', side=1, level=20, upgrades=upgrades.sambravoFixed, crates={}, flavorText=flavor.sambravo}),
	samcharlie = ZoneCommander:new({zone='SAM-Charlie', side=1, level=20, upgrades=upgrades.samcharliefixed, crates={}, flavorText=flavor.samcharlie}),
	samdelta = ZoneCommander:new({zone='SAM-Delta', side=1, level=20, upgrades=upgrades.samdeltaFixed, crates={}, flavorText=flavor.samdelta}),
	samecho = ZoneCommander:new({zone='SAM-Echo', side=1, level=20, upgrades=upgrades.SAMEcho, crates={}, flavorText=flavor.samecho}),
	samfoxtrot = ZoneCommander:new({zone='SAM-Foxtrot', side=1, level=20, upgrades=upgrades.samFoxtrotFixed, crates={}, flavorText=flavor.samfoxtrot}),
	samgolf = ZoneCommander:new({zone='SAM-Golf', side=1, level=20, upgrades=upgrades.samgolf, crates={}, flavorText=flavor.samgolf}),
	samhotel = ZoneCommander:new({zone='SAM-Hotel', side=1, level=20, upgrades=upgrades.sam3, crates={}, flavorText=flavor.samhotel}),
	samindia = ZoneCommander:new({zone='SAM-India', side=1, level=20, upgrades=upgrades.sam4indiafixed, crates={}, flavorText=flavor.samindia}),
	samjuliett = ZoneCommander:new({zone='SAM-Juliett', side=1, level=20, upgrades=upgrades.sam5, crates={}, flavorText=flavor.samjuliett}),
	samkilo = ZoneCommander:new({zone='SAM-Kilo', side=1, level=20, upgrades=upgrades.sam4kilofixed, crates={}, flavorText=flavor.samkilo}),
	samlima = ZoneCommander:new({zone='SAM-Lima', side=1, level=20, upgrades=upgrades.SamLimaFixedSA11, crates={}, flavorText=flavor.samlima}),
	sammike = ZoneCommander:new({zone='SAM-Mike', side=1, level=20, upgrades=upgrades.sam6, crates={}, flavorText=flavor.sammike}),
	hidden1 = ZoneCommander:new({zone='Hidden1', side=1, level=20, upgrades=upgrades.Hidden1Group, crates={}, flavorText=flavor.hidden1})

}
-- Spawn bases
zones.batumi.isHeloSpawn = true
zones.kobuleti.isHeloSpawn = true
zones.senaki.isHeloSpawn = true
zones.kutaisi.isHeloSpawn = true
zones.alpha.isHeloSpawn = true
zones.sukhumi.isHeloSpawn = true
zones.gudauta.isHeloSpawn = true
zones.sochi.isHeloSpawn = true
zones.bravo.isHeloSpawn = true
zones.charlie.isHeloSpawn = true
zones.delta.isHeloSpawn = true
zones.gelendzhik.isHeloSpawn = true
zones.novorossiysk.isHeloSpawn = true
zones.anapa.isHeloSpawn = true
zones.krymsk.isHeloSpawn = true
zones.echo.isHeloSpawn = true
zones.krasnodarc.isHeloSpawn = true
zones.krasnodarp.isHeloSpawn = true
zones.foxtrot.isHeloSpawn = true
zones.maykop.isHeloSpawn = true
zones.golf.isHeloSpawn = true
zones.hotel.isHeloSpawn = true
zones.india.isHeloSpawn = true
zones.mineralnye.isHeloSpawn = true
zones.nalchik.isHeloSpawn = true
zones.mozdok.isHeloSpawn = true
zones.beslan.isHeloSpawn = true
zones.juliett.isHeloSpawn = true
zones.kilo.isHeloSpawn = true
zones.lima.isHeloSpawn = true
zones.soganlug.isHeloSpawn = true
zones.tbilisi.isHeloSpawn = true
zones.vaziani.isHeloSpawn = true
zones.redcarrier.isHeloSpawn = true
zones.bluecarrier.isHeloSpawn = true

-- AirBase names
zones.batumi.airbaseName = 'Batumi'
zones.kobuleti.airbaseName = 'Kobuleti'
zones.kutaisi.airbaseName = 'Kutaisi'
zones.maykop.airbaseName = 'Maykop-Khanskaya'
zones.anapa.airbaseName = 'Anapa-Vityazevo'
zones.senaki.airbaseName = 'Senaki-Kolkhi'
zones.sukhumi.airbaseName = 'Sukhumi-Babushara'
zones.gudauta.airbaseName = 'Gudauta'
zones.sochi.airbaseName = 'Sochi-Adler'
zones.mineralnye.airbaseName = 'Mineralnye Vody'
zones.nalchik.airbaseName = 'Nalchik'
zones.mozdok.airbaseName = 'Modzdok'
zones.beslan.airbaseName = 'Beslan'
zones.krasnodarp.airbaseName = 'Krasnodar-Pashkovsky'
zones.krasnodarc.airbaseName = 'Krasnodar-Center'
zones.krymsk.airbaseName = 'Krymsk'
zones.gelendzhik.airbaseName = 'Gelendzhik'
zones.novorossiysk.airbaseName = 'Novorossiysk'
zones.tbilisi.airbaseName = 'Tbilisi-Lochini'
zones.vaziani.airbaseName = 'Vaziani'
zones.soganlug.airbaseName = 'Soganlug'

-- FARP Zones
zones.lima.airbaseName = 'Lima'
zones.kilo.airbaseName = 'Kilo'
zones.juliett.airbaseName = 'Juliett'
zones.india.airbaseName = 'India'
zones.hotel.airbaseName = 'Hotel'
zones.golf.airbaseName = 'Golf'
zones.foxtrot.airbaseName = 'Foxtrot'
zones.echo.airbaseName = 'Echo'
zones.delta.airbaseName = 'Delta'
zones.charlie.airbaseName = 'Charlie'
zones.bravo.airbaseName = 'Bravo'
zones.alpha.airbaseName = 'Alpha'

zones.bluecarrier:addGroups({
	GroupCommander:new({name='carrier1', mission='attack', targetzone='Kutaisi'}),  -- blue F18 CAP
	GroupCommander:new({name='carrier2', mission='patrol', targetzone='Gudauta'}),  -- blue F18 CAP
	GroupCommander:new({name='Blue-carrier-capture-Red-carrier-blue', mission='supply', targetzone='Red Carrier', urgent = function() return zones.redcarrier.side == 0 and not zones.gudauta.active end, ForceUrgent = true})
})

zones.redcarrier:addGroups({
	GroupCommander:new({name='Red-carrier-capture-Blue-carrier-blue', mission='supply', targetzone='Blue Carrier', urgent = function() return zones.bluecarrier.side == 0 end, ForceUrgent = true})
})
zones.kobuleti:addGroups({	
	GroupCommander:new({name='Support-SAM-Alpha', mission='supply', targetzone='SAM-Alpha', type='surface', spawnDelayFactor = 1.5}),
	GroupCommander:new({name='Kobuleti-supply-Senaki-blue', mission='supply', targetzone='Senaki'})
})
zones.batumi:addGroups({
	GroupCommander:new({name='Batumi-supply-carrier-blue', mission='supply', targetzone='Blue Carrier', type='surface', urgent = function() return zones.bluecarrier.side == 0 end, ForceUrgent = true}),
	GroupCommander:new({name='Batumi-supply-Kobuleti-Blue', mission='supply', targetzone='Kobuleti'})
})
zones.senaki:addGroups({
	GroupCommander:new({name='Support-SAM-Bravo', mission='supply', targetzone='SAM-Bravo', type='surface'}),
	GroupCommander:new({name='senaki-supply-kutaisi', mission='supply', targetzone='Kutaisi'}),
	GroupCommander:new({name='senaki-supply-alpha', mission='supply', targetzone='Alpha'}),
	GroupCommander:new({name='senaki-supply-alpha-blue', mission='supply', targetzone='Alpha'}),
	GroupCommander:new({name='senaki-supply-Kutaisi-blue', mission='supply', targetzone='Kutaisi'})
})
zones.kutaisi:addGroups({
	GroupCommander:new({name='kutaisi-supply-senaki', mission='supply', targetzone='Senaki'}),
	GroupCommander:new({name='kutaisi-supply-kobuleti', mission='supply', targetzone='Kobuleti'}),
	GroupCommander:new({name='Support-SAM-Charlie', mission='supply', targetzone='SAM-Charlie', type='surface', spawnDelayFactor = 1.4}),
	GroupCommander:new({name='kutaisi-attack-kobuleti', mission='attack', targetzone='Kobuleti'}),
	GroupCommander:new({name='kutaisi-attack-senaki', mission='attack', targetzone='Senaki'}),
	GroupCommander:new({name='Kutaisi-patrol-Senaki', mission='patrol', MissionType='CAP', targetzone='Senaki'}),
	GroupCommander:new({name='Kutaisi-patrol-Kubuleti', mission='patrol', MissionType='CAP', targetzone='Kobuleti'}),
	GroupCommander:new({name='Kutaisi-Patrol-Kutaisi-blue', mission='attack', targetzone='Nalchik'})
})
zones.sukhumi:addGroups({
	GroupCommander:new({name='Support-SAM-Delta', mission='supply', targetzone='SAM-Delta', type='surface', spawnDelayFactor = 1.4}),
	GroupCommander:new({name='sukhumi-patrol-Sam-Delta', mission='attack', targetzone='Sochi', condition = function() return not zones.samdelta.active end}), -- M2000 cap
	GroupCommander:new({name='Sukhumi-supply-gudauta', mission='supply', targetzone='Gudauta', condition = function() return zones.kutaisi.wasBlue end, urgent = zones.gudauta.side == 0}),
	GroupCommander:new({name='Sukhumi-supply-alpha', mission='supply', targetzone='Alpha'}),
	GroupCommander:new({name='Sukhumi-supply-Gudauta-blue', mission='supply', targetzone='Gudauta'})
})
zones.gudauta:addGroups({
	GroupCommander:new({name='gudauta-supply-sochi', mission='supply', targetzone='Sochi', condition = function() return zones.kutaisi.wasBlue end, urgent = zones.sochi.side == 0}),
	GroupCommander:new({name='gudauta-supply-sukhumi', mission='supply', targetzone='Sukhumi'}),
	GroupCommander:new({name='gudauta-supply-Red-carrier-Blue', mission='supply', targetzone='Red Carrier', type='surface', urgent = function() return zones.redcarrier.side == 0 end, ForceUrgent = true})
})
zones.sochi:addGroups({
	GroupCommander:new({name='sochi-supply-gudauta', mission='supply', targetzone='Gudauta'}),
	GroupCommander:new({name='Support-SAM-Echo', mission='supply', targetzone='SAM-Echo', type='surface', spawnDelayFactor = 1.5}),
	GroupCommander:new({name='sochi-attack-gudauta', mission='attack', targetzone='Gudauta'}),
	GroupCommander:new({name='sochi-attack-sukhumi', mission='attack', targetzone='Sukhumi'}),
	GroupCommander:new({name='sochi-attack-Kutasi', mission='attack', MissionType='CAP', targetzone='Kutasi'}),
	GroupCommander:new({name='sochi-patrol-Sukhumi', mission='patrol', MissionType='CAP', targetzone='Sukhumi'}),
	GroupCommander:new({name='Sochi-supply-Bravo-blue', mission='supply', targetzone='Bravo'}),
	GroupCommander:new({name='Sochi-patorl-coast-blue', mission='patrol', targetzone='Red Carrier'}),
	GroupCommander:new({name='Sochi-attack-kutaisi', mission='patrol', MissionType='CAP', targetzone='Sukhumi'}),
	GroupCommander:new({name='sochi-supply-bravo', mission='supply', targetzone='Bravo', urgent = zones.bravo.side == 0}),
	GroupCommander:new({name='Sochi-supply-an apa-by-air', mission='supply', targetzone='Anapa', urgent = zones.anapa.side == 0}),
	GroupCommander:new({name='Sochi-supply-mykop-by-air', mission='supply', targetzone='Maykop', urgent = zones.maykop.side == 0})
})
zones.bravo:addGroups({
	GroupCommander:new({name='Bravo-supply-Charlie-blue', mission='supply', targetzone='Charlie'}),
	GroupCommander:new({name='Bravo-supply-Sochi', mission='supply', targetzone='Sochi'}),
	GroupCommander:new({name='Bravo-supply-Charlie', mission='supply', targetzone='Charlie', urgent = zones.charlie.side == 0}),
	GroupCommander:new({name='Bravo-attack-Sochi-Sa-8', mission='attack', targetzone='Sochi', type='surface'})
})
zones.alpha:addGroups({
	GroupCommander:new({name='alpha-supply-sukhumi', mission='supply', targetzone='Sukhumi'}),
	GroupCommander:new({name='Alpha-supply-Sukhimi-Blue', mission='supply', targetzone='Sukhumi'})
	
})
zones.charlie:addGroups({
	GroupCommander:new({name='Charlie-supply-Delta-blue', mission='supply', targetzone='Delta'}),
	GroupCommander:new({name='Charlie-attack-bravo', mission='attack', targetzone='Charlie'}),
	GroupCommander:new({name='Charlie-supply-bravo', mission='supply', targetzone='Charlie'})
})
zones.delta:addGroups({
	GroupCommander:new({name='Delta-supply-Gelendzhik', mission='supply', targetzone='Gelendzhik'})
})
zones.novorossiysk:addGroups({
	GroupCommander:new({name='Support-SAM-Foxtrot', mission='supply', targetzone='SAM-Foxtrot', type='surface'}),
	GroupCommander:new({name='novorossiysk-supply-Anapa-blue', mission='supply', targetzone='Anapa'}),
	GroupCommander:new({name='novorossiysk-supply-Krymsk', mission='supply', targetzone='Novorossiysk'})
})
zones.gelendzhik:addGroups({
	GroupCommander:new({name='Gelendzhik-supply-delta', mission='supply', targetzone='Delta'}),
	GroupCommander:new({name='Gelendzhik-supply-Novorossiysk-Blue', mission='supply', targetzone='Novorossiysk'})
})
zones.anapa:addGroups({
	GroupCommander:new({name='anapa-supply-Krymsk', mission='supply', targetzone='Krymsk', condition = function() return zones.sochi.wasBlue end, urgent = zones.krymsk.side == 0}),
	GroupCommander:new({name='Anapa-supply-Krymsk-Blue', mission='supply', targetzone='Krymsk'}),
	GroupCommander:new({name='anapa-supply-Novorossiysk', mission='supply', targetzone='Novorossiysk', condition = function() return zones.sochi.wasBlue end, urgent = zones.novorossiysk.side == 0}),
	GroupCommander:new({name='anapa-supply-Gelendzhik', mission='supply', targetzone='Gelendzhik', condition = function() return zones.sochi.wasBlue end, urgent = zones.gelendzhik.side == 0}),
	GroupCommander:new({name='Support-SAM-Golf', mission='supply', targetzone='SAM-Golf', type='surface'}),
	GroupCommander:new({name='anapa-attack-Krymsk', mission='attack', targetzone='Krymsk'}),
	GroupCommander:new({name='Sochi-patrol-Novorossiysk', mission='patrol', MissionType='CAP', targetzone='Novorossiysk'}),
	GroupCommander:new({name='Sochi-patrol-Red-carrier', mission='patrol', MissionType='CAP', targetzone='Red Carrier', spawnDelayFactor = 1.5}),
	GroupCommander:new({name='anapa-attack-Novorossiysk', mission='attack', targetzone='Novorossiysk'}),
	GroupCommander:new({name='anapa-attack-Gelendzhik', mission='attack', targetzone='Gelendzhik'}),
	GroupCommander:new({name='anapa-attack-Sochi', mission='patrol', MissionType='CAP', targetzone='Sochi'}),
	GroupCommander:new({name='Airspawn-Patrol-Anapa', mission='patrol', MissionType='CAP', targetzone='Krymsk', diceChance = 40}),
	GroupCommander:new({name='Anapa-supply-Sochi-by-air', mission='supply', targetzone='Sochi', condition = function() return zones.kutaisi.wasBlue end, urgent = zones.sochi.side == 0})
})
zones.krymsk:addGroups({
	GroupCommander:new({name='krymsk-supply-Anapa', mission='supply', targetzone='Anapa'}),
	GroupCommander:new({name='Krymsk-supply-Echo-Blue', mission='supply', targetzone='Echo'}),
	GroupCommander:new({name='Krymsk-supply-Echo', mission='supply', targetzone='Echo', urgent = zones.echo.side == 0}),
	GroupCommander:new({name='Krymsk-Patrol-Anapa', mission='patrol', MissionType='CAP', targetzone='Anapa'}),
	GroupCommander:new({name='Anapa-patrol-Krymsk', mission='attack', targetzone='Maykop'})
})
zones.echo:addGroups({
	GroupCommander:new({name='Echo-supply-Krasnodar-Center-blue', mission='supply', targetzone='Krasnodar-Center'}),
	GroupCommander:new({name='Krasnodar-Pashkovsky-attack-Anapa', mission='attack', MissionType='CAP', targetzone='Anapa'}), -- taking off from KrasnodarP
	GroupCommander:new({name='Echo-supply-krymsk', mission='supply', targetzone='Krymsk'}),
	GroupCommander:new({name='Echo-supply-krasnodar-center', mission='supply', targetzone='Krasnodar-Center', urgent = zones.krasnodarc.side == 0})
})
zones.krasnodarc:addGroups({
	GroupCommander:new({name='Airspawn-Patrol-Krasnodar-Center', mission='patrol', MissionType='CAP', targetzone='Krasnodar-Center', diceChance = 30}),
	GroupCommander:new({name='Krasnodar-Center-supply-Echo', mission='supply', targetzone='Echo'}),
	GroupCommander:new({name='Krasnodar-center-supply-krasnodarp-blue', mission='supply', targetzone='Krasnodar-Pashkovsky', type='surface'})
})
zones.krasnodarp:addGroups({
	GroupCommander:new({name='Krasnodar-Pashkovsky-supply-Maykop-blue', mission='supply', targetzone='Maykop'}),
	GroupCommander:new({name='Krasnodar-Pashkovsky-supply-Maykop', mission='supply', targetzone='Maykop'}),
	GroupCommander:new({name='Support-SAM-Hotel', mission='supply', targetzone='SAM-Hotel', type='surface'}),
	GroupCommander:new({name='Krasnodar-Pashkovsky-supply-Foxtrot-blue', mission='supply', targetzone='Foxtrot'}),
	GroupCommander:new({name='Mykop-attack-sochi', mission='attack', MissionType='CAP', targetzone='Sochi'}),
	GroupCommander:new({name='Krasnodar-Pashkovsky-supply-Foxtrot', mission='supply', targetzone='Foxtrot', urgent = zones.foxtrot.side == 0})
})
zones.foxtrot:addGroups({
	GroupCommander:new({name='Foxtrot-supply-Maykop', mission='supply', targetzone='Maykop'})
	
})
zones.maykop:addGroups({
	GroupCommander:new({name='maykop-supply-Krasnodar-Pashkovsky', mission='supply', targetzone='Krasnodar-Pashkovsky', condition = function() return zones.sochi.wasBlue end, urgent = zones.krasnodarp.side == 0}),
	GroupCommander:new({name='maykop-supply-Krasnodar-Center', mission='supply', targetzone='Krasnodar-Center', condition = function() return zones.sochi.wasBlue end, urgent = zones.krasnodarc.side == 0}),
	GroupCommander:new({name='maykop-supply-Foxtrot', mission='supply', targetzone='Foxtrot', condition = function() return zones.sochi.wasBlue end, urgent = zones.foxtrot.side == 0}),
	GroupCommander:new({name='maykop-supply-Charlie', mission='supply', targetzone='Charlie', condition = function() return zones.alpha.wasBlue end, urgent = zones.charlie.side == 0}),
	GroupCommander:new({name='maykop-supply-Bravo', mission='supply', targetzone='Bravo', condition = function() return zones.kutaisi.wasBlue end, urgent = zones.bravo.side == 0}),
	GroupCommander:new({name='Support-SAM-India', mission='supply', targetzone='SAM-India', type='surface'}),
	GroupCommander:new({name='maykop-attack-Krasnodar-Pashkovsky', mission='attack', targetzone='Krasnodar-Pashkovsky'}),
	GroupCommander:new({name='maykop-attack-Charlie', mission='attack', targetzone='Charlie'}),
	GroupCommander:new({name='maykop-supply-Sochi-by-air', mission='supply', targetzone='Sochi'}),
	GroupCommander:new({name='Maykop-attack-krymsk', mission='attack', MissionType='CAP', targetzone='krymsk'}),
	GroupCommander:new({name='Mykop-patrol-sochi', mission='patrol', MissionType='CAP', targetzone='Sochi'}),
	GroupCommander:new({name='Maykop-Patrol-Krymsk', mission='patrol', MissionType='CAP', targetzone='Krymsk'}),
	GroupCommander:new({name='Maykop-supply-Golf-blue', mission='supply', targetzone='Golf'}),
	GroupCommander:new({name='Maykop-supply-Golf', mission='supply', targetzone='Golf', condition = function() return zones.sukhumi.wasBlue end, urgent = zones.golf.side == 0}),
	GroupCommander:new({name='maykop-supply-delta', mission='supply', targetzone='Delta', condition = function() return zones.sochi.wasBlue end, urgent = zones.delta.side == 0}),
	GroupCommander:new({name='Maykop-supply-Samsite', mission='supply', targetzone='SAMSite'}),
	GroupCommander:new({name='Maykop-cas-attack-Krasnodar-P-to-krymsk', mission='attack', targetzone='Krasnodar-Pashkovsky'}),
	GroupCommander:new({name='maykop-supply-mineralnye-by-air', mission='supply', targetzone='Mineralnye', condition = function() return zones.krasnodarp.wasBlue end, urgent = zones.mineralnye.side == 0}),
	GroupCommander:new({name='Maykop-attack-mineralnye-blue', mission='attack', targetzone='Mineralnye'})
})
zones.golf:addGroups({
	GroupCommander:new({name='Golf-supply-Hotel-blue', mission='supply', targetzone='Hotel'}),
	GroupCommander:new({name='Golf-supply-Maykop', mission='supply', targetzone='Maykop'}),
	GroupCommander:new({name='Golf-supply-hotel', mission='supply', targetzone='Hotel', urgent = zones.bravo.side == 0})
})
zones.hotel:addGroups({
	GroupCommander:new({name='Hotel-supply-India-blue', mission='supply', targetzone='India'}),
	GroupCommander:new({name='Hotel-supply-Golf', mission='supply', targetzone='Golf'}),
	GroupCommander:new({name='hotel-supply-india', mission='supply', targetzone='India', urgent = zones.india.side == 0})
})
zones.india:addGroups({
	GroupCommander:new({name='India-supply-Mineralnye-Blue', mission='supply', targetzone='Mineralnye'}),
	GroupCommander:new({name='India-supply-Hotel', mission='supply', targetzone='Hotel'}),
	GroupCommander:new({name='India-supply-Mineralnye', mission='supply', targetzone='Mineralnye', condition = function() return zones.krasnodarp.wasBlue end, urgent = zones.mineralnye.side == 0})
})
zones.mozdok:addGroups({
	GroupCommander:new({name='mozdok-supply-mineralnye', mission='supply', targetzone='Mineralnye'}),
	GroupCommander:new({name='mozdok-supply-nalchik', mission='supply', targetzone='Nalchik'}),
	GroupCommander:new({name='Mozdok-supply-Beslan', mission='supply', targetzone='Beslan', urgent = zones.beslan.side == 0}),
	GroupCommander:new({name='Support-SAM-Kilo', mission='supply', targetzone='SAM-Kilo', type='surface'}),
	GroupCommander:new({name='mozdok-attack-mineralnye', mission='attack', targetzone='Mineralnye'}),
	GroupCommander:new({name='mozdok-attack-nalchik', mission='attack', targetzone='Nalchik'}),
	GroupCommander:new({name='Mozdok-patrol-Mineralnye', mission='patrol', MissionType='CAP', targetzone='Mineralnye'}),
	GroupCommander:new({name='Mozdok-Attack-Maykop', mission='patrol', MissionType='CAP', targetzone='Mineralnye'}),
	GroupCommander:new({name='Mozdok-supply-Beslan-blue', mission='supply', targetzone='Beslan'}),
	GroupCommander:new({name='Mozdok-attack-beslan', mission='attack', targetzone='Beslan'})
	
})
zones.nalchik:addGroups({
	GroupCommander:new({name='nalchik-supply-mozdok', mission='supply', targetzone='Mozdok', condition = function() return zones.maykop.wasBlue end, urgent = zones.mozdok.side == 0}),
	GroupCommander:new({name='Nalchik-Attack-Kutaisi', mission='attack', MissionType='CAP', targetzone='Kutaisi'}),
	GroupCommander:new({name='Nalshik-supply-Mozdok-blue', mission='supply', targetzone='Mozdok'}),
	GroupCommander:new({name='Nalchik-supply-Beslan-blue', mission='supply', targetzone='Beslan'}),
	--GroupCommander:new({name='Nalchik-patrol-tbilisi', mission='patrol', targetzone='Nalchik', condition = function() return not zones.vaziani.wasBlue or not zones.tbilisi.wasBlue end, urgent = zones.tbilisi.side == 0}),
	GroupCommander:new({name='Nalchik-supply-Vaziani-by-air', mission='supply', targetzone='Vaziani', condition = function() return zones.kutaisi.wasBlue end, urgent = zones.vaziani.side == 0}),
	GroupCommander:new({name='nalchik-supply-juliett', mission='supply', targetzone='Juliett', condition = function() return zones.maykop.wasBlue or zones.vaziani.wasBlue or zones.tbilisi.wasBlue end, urgent = zones.juliett.side == 0}),
	GroupCommander:new({name='Nalchik-supply-Beslan', mission='supply', targetzone='Beslan'}),
	GroupCommander:new({name='Nalshik-attack-minieralnye', mission='attack', MissionType='CAP', targetzone='Mineralnye'}),
	GroupCommander:new({name='nalchik-supply-Mineralnye', mission='supply', targetzone='Mineralnye', condition = function() return zones.krasnodarp.wasBlue end, urgent = zones.mineralnye.side == 0}),
	GroupCommander:new({name='Nalchik-attack-kilo-blue', mission='patrol', targetzone='Nalchik'})

})
zones.beslan:addGroups({
	GroupCommander:new({name='Beslan-patrol-beslan', mission='patrol', MissionType='CAP', targetzone='Beslan'}),
	GroupCommander:new({name='Beslan-supply-Juliett', mission='supply', targetzone='Juliett', urgent = zones.juliett.side == 0}),
	GroupCommander:new({name='beslan-attack-mozdok', mission='attack', targetzone='Mozdok'}),
	GroupCommander:new({name='Beslan-attack-mozdok-by-air', mission='attack', targetzone='Mozdok'}),
	GroupCommander:new({name='Beslan-attack-mozdok-Minerlanye', mission='attack', targetzone='Mineralnye'})
})
zones.juliett:addGroups({
	GroupCommander:new({name='Juliet-supply-Kilo', mission='supply', targetzone='Kilo', urgent = zones.kilo.side == 0}),
	GroupCommander:new({name='Juliet-supply-Beslan', mission='supply', targetzone='Beslan'})
})
zones.kilo:addGroups({
	GroupCommander:new({name='Kilo-supply-Lima-blue', mission='supply', targetzone='Lima', urgent = zones.lima.side == 0}),
	GroupCommander:new({name='Kilo-supply-Juliet', mission='supply', targetzone='Juliett', urgent = zones.juliett.side == 0})
})
zones.lima:addGroups({
	GroupCommander:new({name='Lima-supply-Tbilisi', mission='supply', targetzone='Tbilisi', urgent = zones.tbilisi.side == 0})
	--GroupCommander:new({name='Lima-supply-Kilo', mission='supply', targetzone='Kilo', urgent = zones.kilo.side == 0})
})
zones.mineralnye:addGroups({
	GroupCommander:new({name='Mineralnye-Support-SAM-Juliett', mission='supply', targetzone='SAM-Juliett', type='surface'}),
	GroupCommander:new({name='Mineralnye-patrol-Maykop', mission='patrol', targetzone='Maykop'}),
	GroupCommander:new({name='Mineralnye-Attack-Maykop', mission='patrol', MissionType='CAP', targetzone='India', condition = function() return zones.maykop.wasBlue end}),
	--GroupCommander:new({name='Mineralnye-Attack-Maykop-2', mission='patrol', targetzone='India', condition = function() return zones.maykop.wasBlue end}),
	GroupCommander:new({name='Mineralnye-supply-Nalshik-blue', mission='supply', targetzone='Nalchik'}),
	GroupCommander:new({name='Mineralnye-supply-India', mission='supply', targetzone='India'}),
	GroupCommander:new({name='Mineralnye-supply-Mozdok-herc-blue', mission='supply', targetzone='Mozdok'}),
	GroupCommander:new({name='Mineralnye-supply-mozdok', mission='supply', targetzone='Mozdok', condition = function() return zones.maykop.wasBlue end, urgent = zones.mozdok.side == 0})
})
zones.tbilisi:addGroups({
	GroupCommander:new({name='tbilisi-supply-Soganlug', mission='supply', targetzone='Soganlug', urgent = zones.nalchik.side == 0, condition = function() return not CustomFlags["StrikeVaziani"] end}),
	GroupCommander:new({name='tbilisi-supply-Vaziani', mission='supply', targetzone='Vaziani', urgent = zones.nalchik.side == 0, condition = function() return not CustomFlags["StrikeVaziani"] end}),
	GroupCommander:new({name='Tbilisi-Patrol-Nalshik', mission='patrol', MissionType='CAP', targetzone='Nalchik'}),
	GroupCommander:new({name='Tbilisi-supply-Vaziani', mission='supply', targetzone='Vaziani', urgent = zones.nalchik.side == 0, condition = function() return not CustomFlags["StrikeVaziani"] end}),
	GroupCommander:new({name='Tbilisi-Patrol-Kilo', mission='patrol', MissionType='CAP', targetzone='Kilo'})
})
zones.vaziani:addGroups({
	GroupCommander:new({name='vaziani-supply-Kilo', mission='supply', targetzone='Kilo', condition = function() return (zones.maykop.wasBlue or zones.mineralnye.wasBlue or zones.lima.wasBlue) and not CustomFlags["StrikeVaziani"] end, urgent = zones.kilo.side == 0}),
	GroupCommander:new({name='vaziani-supply-Lima', mission='supply', targetzone='Lima', condition = function() return (zones.maykop.wasBlue or zones.mineralnye.wasBlue or zones.lima.wasBlue) and not CustomFlags["StrikeVaziani"] end, urgent = zones.lima.side == 0}),
	GroupCommander:new({name='vaziani-supply-Soganlug', mission='supply', targetzone='Soganlug', condition = function() return (zones.maykop.wasBlue or zones.mineralnye.wasBlue or zones.lima.wasBlue) and not CustomFlags["StrikeVaziani"] end, urgent = zones.soganlug.side == 0, spawnDelayFactor = 1.5}),
	GroupCommander:new({name='vaziani-supply-Tbilisi', mission='supply', targetzone='Tbilisi', condition = function() return (zones.maykop.wasBlue or zones.lima.wasBlue) and not CustomFlags["StrikeVaziani"] end, urgent = zones.tbilisi.side == 0, spawnDelayFactor = 2}),
	GroupCommander:new({name='Support-SAM-Lima', mission='supply', targetzone='SAM-Lima', type='surface', spawnDelayFactor = 2, condition = function() return not CustomFlags["StrikeVaziani"] end}),
	GroupCommander:new({name='Support-SAM-Mike', mission='supply', targetzone='SAM-Mike', type='surface', spawnDelayFactor = 2.5, condition = function() return not CustomFlags["StrikeVaziani"] end}),
	GroupCommander:new({name='vaziani-attack-Kilo', mission='attack', targetzone='Kilo'}),
	GroupCommander:new({name='vaziani-attack-Lima', mission='attack', targetzone='Lima', spawnDelayFactor = 1.5}),
	GroupCommander:new({name='vaziani-attack-Soganlug', mission='attack', targetzone='Soganlug', spawnDelayFactor = 2}),
	GroupCommander:new({name='vaziani-attack-Tbilisi', mission='attack', targetzone='Tbilisi'}),
	GroupCommander:new({name='Airspawn-Patrol-Lima', mission='attack', MissionType='CAP', targetzone='Lima', condition = function() return CustomFlags["StrikeVaziani"] end, spawnDelayFactor = 2})
})
function SpawnFriendlyAssets()

	if zones.redcarrier.wasBlue then
		activateGroupIfNotActive('CVN-73')
		destroyGroupIfActive('CVN-72')
	end
	if zones.beslan.wasBlue then
		destroyGroupIfActive('Red AWACS')
	end
--Destroy Awacs RED anapa
	if zones.tbilisi.wasBlue then
		destroyGroupIfActive('Red AWACS 3')
	end
--awacs anapa
	if zones.anapa.wasBlue and not zones.maykop.wasBlue and zones.samkilo.active and not zones.samgolf.active then
		SpawnGroupIfNotActive('Blue AWACS 1')

		destroyGroupIfActive('Blue AWACS 0')
		destroyGroupIfActive('Red AWACS')
	end
--tankers anapa	
	if zones.anapa.wasBlue and not zones.samgolf.active and zones.samkilo.active then
		SpawnGroupIfNotActive('Kutaisi-airforce-tanker-maykop')
		SpawnGroupIfNotActive('Kutaisi-navy-tanker-maykop')

		destroyGroupIfActive('Kutaisi-airforce-tanker')
		destroyGroupIfActive('Kutaisi-navy-tanker')
		destroyGroupIfActive('Blue AWACS 0')
		destroyGroupIfActive('Red AWACS')
	end
--maykop awacs	
	if zones.anapa.wasBlue and zones.maykop.wasBlue and zones.samkilo.active then
		SpawnGroupIfNotActive('Blue AWACS 3')
		destroyGroupIfActive('Blue AWACS 1')
		destroyGroupIfActive('Blue AWACS 0')
	end
	--kutaisi tankers
	if zones.kutaisi.wasBlue and zones.samgolf.active and not zones.samcharlie.active then
		SpawnGroupIfNotActive('Kutaisi-airforce-tanker')
		SpawnGroupIfNotActive('Kutaisi-navy-tanker')

		if not zones.chemsite.firstCaptureByRed then
			zones.chemsite:MakeZoneRedAndUpgrade()
			zones.secrettechfacility:MakeZoneRedAndUpgrade()
			zones.artilleryfactory:MakeZoneRedAndUpgrade()
			zones.insurgentcamp:MakeZoneRedAndUpgrade()
		end
	end
--mozdok tanker and awacs
	if zones.maykop.wasBlue and zones.mozdok.wasBlue and not zones.samkilo.active then
		SpawnGroupIfNotActive('Blue AWACS 2')
		SpawnGroupIfNotActive('Mozdok-navy-tanker')
		SpawnGroupIfNotActive('Mozdok-airforce-tanker')

		destroyGroupIfActive('Blue AWACS 3')
		destroyGroupIfActive('Kutaisi-airforce-tanker-maykop')
		destroyGroupIfActive('Kutaisi-navy-tanker-maykop')
		destroyGroupIfActive('Blue AWACS 0')
		destroyGroupIfActive('Red AWACS 2')
	end
	if zones.sochi.wasBlue and not zones.tankfactory.firstCaptureByRed then
	zones.tankfactory:MakeZoneRedAndUpgrade()
	zones.samsite:MakeZoneRedAndUpgrade()
	end
	if zones.sukhumi.wasBlue and not zones.ammonitiondepo.firstCaptureByRed then
	zones.ammonitiondepo:MakeZoneRedAndUpgrade()
	end
	if zones.mozdok.wasBlue and zones.samkilo.active then
		trigger.action.outTextForCoalition(2,'Texaco and Arco together with Awacs will start from Mozdok once SAM-Kilo is destroyed.',30)
		if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "admin.wav")
        end
	end

	if zones.anapa.wasBlue and zones.samgolf.active and not zones.mozdok.wasBlue then
		trigger.action.outTextForCoalition(2,'Texaco and Arco together with Awacs will start from Anapa once SAM-Golf is destroyed.',30)
		if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "admin.wav")
        end
	end
	
	if zones.kutaisi.wasBlue and not zones.anapa.wasBlue and not zones.mozdok.wasBlue and zones.samcharlie.active then
		trigger.action.outTextForCoalition(2,'Texaco and Arco will start from Kutaisi once SAM-charlie is destroyed.',30)
		if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "admin.wav")
        end
	end
	
	if zones.redcarrier.wasBlue then
		trigger.action.setMarkupTypeLine(zones.bluecarrier.index, 0)
	end
	if not CustomFlags[1] then
		zones.hidden1:MakeRedZoneUpgraded()
		CustomFlags[1] = true
	end
end
mist.scheduleFunction(SpawnFriendlyAssets, {}, timer.getTime() + 8)

function checkAndDisableFriendlyZones()
     if zones.kutaisi.wasBlue and zones.kobuleti.wasBlue then
       	zones.batumi:disableFriendlyZone()
		zones.kobuleti:disableFriendlyZone()				
	end
	 if zones.sochi.wasBlue and zones.sukhumi.wasBlue and zones.gudauta.wasBlue and
		zones.batumi.wasBlue then
		zones.sukhumi:disableFriendlyZone()
		zones.gudauta:disableFriendlyZone()
		zones.batumi:disableFriendlyZone()				
	end
	 if zones.sukhumi.wasBlue and zones.alpha.wasBlue and zones.kutaisi.wasBlue and
		zones.senaki.wasBlue then
       	zones.alpha:disableFriendlyZone()
		zones.senaki:disableFriendlyZone()
		zones.kutaisi:disableFriendlyZone()				
	end
    if  zones.anapa.wasBlue and zones.novorossiysk.wasBlue and zones.bravo.wasBlue and
		zones.charlie.wasBlue and zones.delta.wasBlue and zones.gelendzhik.wasBlue then
        zones.bravo:disableFriendlyZone()
		zones.charlie:disableFriendlyZone()
		zones.delta:disableFriendlyZone()
		zones.gelendzhik:disableFriendlyZone()
		zones.novorossiysk:disableFriendlyZone()
	end
	if  zones.maykop.wasBlue and zones.krasnodarc.wasBlue and zones.krasnodarp.wasBlue and
		zones.echo.wasBlue and zones.krymsk.wasBlue and zones.anapa.wasBlue	and
		zones.sochi.wasBlue then
        zones.krasnodarp:disableFriendlyZone()
		zones.krasnodarc:disableFriendlyZone()
		zones.echo:disableFriendlyZone()
		zones.krymsk:disableFriendlyZone()
		zones.anapa:disableFriendlyZone()
		zones.sochi:disableFriendlyZone()
	end
	if  zones.mozdok.wasBlue and zones.maykop.wasBlue and zones.india.wasBlue and
		zones.hotel.wasBlue and zones.golf.wasBlue then
        zones.maykop:disableFriendlyZone()
		zones.india:disableFriendlyZone()
		zones.hotel:disableFriendlyZone()
		zones.golf:disableFriendlyZone()
	end
end
mist.scheduleFunction(checkAndDisableFriendlyZones, {}, timer.getTime() + 5)

for i,v in pairs(zones) do
	bc:addZone(v)
end

missions = {
}

bc:addConnection("Blue Carrier","Batumi")
bc:addConnection("Batumi","Kobuleti")
bc:addConnection("Kobuleti","SAM-Alpha")
bc:addConnection("Kobuleti","Senaki")

bc:addConnection("Senaki","Kutaisi")
bc:addConnection("Kutaisi","Alpha")
bc:addConnection("Kutaisi","FuelDepo")
bc:addConnection("Alpha","Sukhumi")
bc:addConnection("Alpha","InsurgentCamp")
bc:addConnection("Sukhumi","SAM-Delta")
bc:addConnection("Sukhumi","SecretTechFacility")
bc:addConnection("Sukhumi","Gudauta")
bc:addConnection("Sochi","Gudauta")
bc:addConnection("Sochi","Bravo")
bc:addConnection("Sochi","Red Carrier")
bc:addConnection("Sochi","AmmonitionDepo")
bc:addConnection("Bravo","Charlie")
bc:addConnection("Charlie","Delta")
bc:addConnection("Delta","Gelendzhik")
bc:addConnection("Gelendzhik","SAM-Foxtrot")
bc:addConnection("Gelendzhik","Novorossiysk")
bc:addConnection("Novorossiysk","Anapa")
bc:addConnection("Anapa","SAM-Golf")
bc:addConnection("Anapa","Krymsk")
bc:addConnection("Krymsk","Echo")
bc:addConnection("Echo","Krasnodar-Center")
bc:addConnection("Krasnodar-Center","SAM-Hotel")
bc:addConnection("Krasnodar-Center","Krasnodar-Pashkovsky")
bc:addConnection("Krasnodar-Pashkovsky","TankFactory")
bc:addConnection("Krasnodar-Pashkovsky","Foxtrot")
bc:addConnection("Krasnodar-Pashkovsky","Maykop")
bc:addConnection("Foxtrot","Maykop")
bc:addConnection("Maykop","Golf")
bc:addConnection("Maykop","SAMSite")
bc:addConnection("Maykop","SAM-India")
bc:addConnection("Golf","Hotel")
bc:addConnection("Hotel","India")
bc:addConnection("India","Mineralnye")
bc:addConnection("Mineralnye","Nalchik")
bc:addConnection("Mineralnye","Mozdok")
bc:addConnection("Mineralnye","SAM-Juliett")
bc:addConnection("Mozdok","Nalchik")
bc:addConnection("Mozdok","Beslan")
bc:addConnection("Nalchik","ChemSite")
bc:addConnection("Nalchik","ArtilleryFactory")
bc:addConnection("Beslan","ArtilleryFactory")

bc:addConnection("Beslan","Juliett")
bc:addConnection("Juliett","Kilo")
bc:addConnection("Kilo","Lima")
bc:addConnection("Lima","Tbilisi")
bc:addConnection("Tbilisi","Soganlug")
bc:addConnection("Tbilisi","Vaziani")
bc:addConnection("Vaziani","SAM-Lima")
bc:addConnection("Vaziani","SAM-Mike")


bc:addConnection("Batumi","MiningFacility")

bc:addConnection("SAMSite", "Mineralnye")

bc:addConnection("Senaki","SAM-Bravo")
bc:addConnection("Kutaisi","SAM-Charlie")

bc:addConnection("Sochi","SAM-Echo")
bc:addConnection("Novorossiysk","SAM-Foxtrot")

bc:addConnection("Mozdok","SAM-Kilo")


--zones.fueldepo:addCriticalObject('FuelDepo1')
--zones.fueldepo:addCriticalObject('FuelDepo2')
--zones.fueldepo:addCriticalObject('FuelDepo3')
--zones.fueldepo:addCriticalObject('FuelDepo4')
--zones.fueldepo:addCriticalObject('FuelDepo5')
--zones.fueldepo:addCriticalObject('FuelDepo6')

zones.samalpha:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesamalpha')


zones.sambravo:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesambravo')

zones.samcharlie:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesamcharlie')

zones.samdelta:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesamdelta')

zones.samecho:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesamecho')

zones.samfoxtrot:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesamfoxtrot')

zones.samgolf:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesamgolf')

zones.samhotel:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesamhotel')

zones.samindia:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesamindia')

zones.samjuliett:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesamjuliett')

zones.samkilo:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesamkilo')

zones.samlima:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesamlima')

zones.sammike:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesammike')

zones.samsite:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+500 credits',20)
end, 'disablesamsite')

zones.miningfacility:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Mining facility is no more\n+500 credits',20)
end, 'disableminingfacility')

zones.insurgentcamp:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Insurgent camp is no more\n+500 credits',20)
end, 'disableinsurgentcamp')

zones.ammonitiondepo:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Ammunition depo is no more\n+500 credits',20)
end, 'disableammonitiondepo')

zones.artilleryfactory:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Artillery factory is no more\n+500 credits',20)
end, 'disableartilleryfactory')


zones.chemsite:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'chemsite is no more\n+500 credits',20)
end, 'disablechemsite')

zones.fueldepo:registerTrigger('lost', function(event, sender) 
	bc:addFunds(2,500)
	sender:disableZone()
	trigger.action.outTextForCoalition(2,'fueldepo disabled\n+500 credits',20)
end, 'disablefueldepo')

zones.secrettechfacility:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Secret tech facility is destroyed\n+500 credits',20)
end, 'disablesecrettechfacility')

zones.tankfactory:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Great work! Tank factory is now destroyed\n+500 credits',20)
end, 'disabletankfactory')

local missionCompleted = false
local checkMissionComplete = function(event, sender)
	if missionCompleted then return end
	local done = true
	for i, v in ipairs(bc:getZones()) do
		if not v.zone:lower():find("hidden") and v.side == 1 then
			done = false
			break
		end
	end
	if done then
		missionCompleted = true
		trigger.action.setUserFlag(180, true)
		trigger.action.outText("Enemy has been defeated.\n\nMission Complete.\n\nYou can restart the mission from the radio menu.", 120)

		timer.scheduleFunction(function()
			trigger.action.outSoundForCoalition(2, "BH.ogg")
		end, {}, timer.getTime() + 5)

			local subMenu = missionCommands.addSubMenuForCoalition(2, "Restart and Reset?", nil)
			missionCommands.addCommandForCoalition(2, "Yes", subMenu, function()
					Utils.saveTable(bc.saveFile, 'zonePersistance', {})
					if resetSaveFileAndFarp then
					resetSaveFileAndFarp()
					end
				trigger.action.outText("Restarting now..", 120)
				timer.scheduleFunction(function()
					trigger.action.setUserFlag(181, true)
				end, {}, timer.getTime() + 5)
			end)
			missionCommands.addCommandForCoalition(2, "No", subMenu, function()
		end)
	end
end


for i,v in ipairs(bc:getZones()) do
	v:registerTrigger('lost', checkMissionComplete, 'missioncompleted')
end

mist.scheduleFunction(function()
	checkMissionComplete(nil, nil)
	bc:roamGroupsToLocalSubZone({
		"Red armoured group 1 #",
		"Red armoured group 2 #",
		"Red SAM AAA group 2 #",
		"Red armoured group 3 #",
		"Red Tanks #",
		"Red SAM SHORAD SA-15 #",
		"Red SAM SHORAD SA-19 #",
		"Red SAM SHORAD SA-8 #"
	}, 50)
end, {}, timer.getTime() + 30)

local upgradeMenu = nil
bc:registerShopItem('supplies2', 'Resupply friendly Zone', 200, function(sender)
    if upgradeMenu then
        return 'Choose zone from F10 menu'
    end

    local upgradeZone = function(target)
        if upgradeMenu then
            local zn = bc:getZoneByName(target)
            if zn and zn.side == 2 then
                zn:upgrade()
            else
                return 'Zone not friendly'
            end
            
            upgradeMenu = nil
        end
    end

    upgradeMenu = bc:showTargetZoneMenu(2, 'Select Zone to resupply', upgradeZone, 2, true)
    
    trigger.action.outTextForCoalition(2, 'Supplies prepared. Choose zone from F10 menu', 15)
end,
function(sender, params)
    if params.zone and params.zone.side == 2 then
        params.zone:upgrade()
    else
        return 'Can only target friendly zone'
    end
end)

local fullyUpgradeMenu=nil
bc:registerShopItem('supplies','Fully Upgrade Friendly Zone',1000,
function(sender)
    if fullyUpgradeMenu then
        return'Choose zone from F10 menu to fully upgrade'
    end
    local fullyUpgradeZone
    fullyUpgradeZone=function(target)
        if fullyUpgradeMenu then
            local zn=bc:getZoneByName(target)
            if zn and zn.side==2 then
                local function repairs()
                    local n=0
                    for _,v in pairs(zn.built)do
                        local g=Group.getByName(v)
                        if g then
                            if g:getSize()<g:getInitialSize() then n=n+1
                            else
                                for _,u in ipairs(g:getUnits())do
                                    if u and u:isExist() and u:getLife()<u:getLife0() then n=n+1 break end
                                end
                            end
                        end
                    end
                    return n
                end
                local upgs=zn.upgrades.blue or{}
                local todo=repairs()+(#upgs-Utils.getTableSize(zn.built))
                if todo>0 then
                    local function loop()
                        local before=Utils.getTableSize(zn.built)
                        zn:upgrade()
                        local now=Utils.getTableSize(zn.built)
                        if repairs()>0 or now<#upgs then
                            mist.scheduleFunction(loop,{},timer.getTime()+2)
                        else
                            trigger.action.outTextForCoalition(2,target..' is now fully upgraded!',15)
                        end
                    end
                    loop()
                else
                    trigger.action.outTextForCoalition(2,target..' is already fully upgraded',15)
                end
            else
                return'Zone not friendly'
            end
            fullyUpgradeMenu=nil
        end
    end
    fullyUpgradeMenu=bc:showTargetZoneMenu(2,'Select Zone to Fully Upgrade',fullyUpgradeZone,2,true)
    trigger.action.outTextForCoalition(2,'Preparing to full upgrade and repair. Choose zone from F10 menu',15)
end,
function(sender,params)
    if params.zone and params.zone.side==2 then
        local zn=params.zone
        local upgs=zn.upgrades.blue or{}
        local function repairs()
            local n=0
            for _,v in pairs(zn.built)do
                local g=Group.getByName(v)
                if g then
                    if g:getSize()<g:getInitialSize() then n=n+1
                    else
                        for _,u in ipairs(g:getUnits())do
                            if u and u:isExist() and u:getLife()<u:getLife0() then n=n+1 break end
                        end
                    end
                end
            end
            return n
        end
        local function loop()
            local before=Utils.getTableSize(zn.built)
            zn:upgrade()
            local now=Utils.getTableSize(zn.built)
            if repairs()>0 or now<#upgs then
                mist.scheduleFunction(loop,{},timer.getTime()+2)
			else
				trigger.action.outTextForCoalition(2,params.zone.zone..' is now fully upgraded!',15)
			end
        end
        loop()
    else
        return'Can only target friendly zone'
    end
end)


Group.getByName('f4cap1'):destroy()
Group.getByName('f4cap2'):destroy()
Group.getByName('f4cap3'):destroy()
Group.getByName('f4cap4'):destroy()
Group.getByName('f4cap5'):destroy()
Group.getByName('f4cap6'):destroy()
bc:registerShopItem('cap', 'CAP', 500, function(sender)
        local grname = 'f4cap1'
	if not zones.sukhumi.wasBlue and zones.kutaisi.wasBlue and not zones.charlie.wasBlue then
		grname = 'f4cap2'
	elseif zones.sochi.wasBlue and zones.charlie.wasBlue and not zones.maykop.wasBlue then
		grname = 'f4cap3'    
	elseif zones.maykop.wasBlue and zones.anapa.wasBlue and not zones.mineralnye.wasBlue then
		grname = 'f4cap4'
	elseif not zones.nalchik.wasBlue and zones.mineralnye.wasBlue and not zones.beslan.wasBlue then
		grname = 'f4cap5'
	elseif zones.nalchik.wasBlue and zones.mineralnye.wasBlue and not zones.beslan.wasBlue then
		grname = 'f4cap5'
	elseif not zones.nalchik.wasBlue and zones.mineralnye.wasBlue and zones.beslan.wasBlue then
		grname = 'f4cap5'
	elseif (zones.nalchik.wasBlue and zones.mineralnye.wasBlue and zones.mozdok.wasBlue) then
		grname = 'f4cap6'
	end


        local gr = Group.getByName(grname)
        if Utils.isGroupActive(gr) then
            return 'CAP mission still in progress'
        end

        mist.respawnGroup(grname, true)
    end, 
    function(sender, params)
        local grname = 'f4cap1'
	if not zones.sukhumi.wasBlue and zones.kutaisi.wasBlue and not zones.charlie.wasBlue then
		grname = 'f4cap2'
	elseif zones.sochi.wasBlue and zones.charlie.wasBlue and not zones.maykop.wasBlue then
		grname = 'f4cap3'    
	elseif zones.maykop.wasBlue and zones.anapa.wasBlue and not zones.mineralnye.wasBlue then
		grname = 'f4cap4'
	elseif not zones.nalchik.wasBlue and zones.mineralnye.wasBlue and not zones.beslan.wasBlue then
		grname = 'f4cap5'
	elseif zones.nalchik.wasBlue and zones.mineralnye.wasBlue and not zones.beslan.wasBlue then
		grname = 'f4cap5'
	elseif not zones.nalchik.wasBlue and zones.mineralnye.wasBlue and zones.beslan.wasBlue then
		grname = 'f4cap5'
	elseif (zones.nalchik.wasBlue and zones.mineralnye.wasBlue and zones.mozdok.wasBlue) then
		grname = 'f4cap6'
	end


        local gr = Group.getByName(grname)
        if Utils.isGroupActive(gr) then
            return 'CAP mission still in progress'
        end

        mist.respawnGroup(grname, true)
    end
) -- close the registerShopItem function
-- End of script

tanksMenu = nil
bc:registerShopItem('armor', 'Deploy armor (for combined arms)', 100, function(sender)
	
	if tanksMenu then
		return 'Choose deploy zone from F10 menu'
	end
	
	local deployTanks = function(target)
		if tanksMenu then
		
			local zn = CustomZone:getByName(target)
			zn:spawnGroup('ca-tanks')
			
			tanksMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly armor deployed at '..target, 15)
		end
	end
	
	tanksMenu = bc:showTargetZoneMenu(2, 'Deploy armor (Choose friendly zone)', deployTanks, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then
		
		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('ca-tanks')
		trigger.action.outTextForCoalition(2, 'Friendly armor deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)
leogroupMenu = nil
bc:registerShopItem('leogroup', 'Deploy Leopard group (for combined arms)', 100, function(sender)
	
	if leogroupMenu then
		return 'Choose deploy zone from F10 menu'
	end
	
	local deployLeogroup = function(target)
		if leogroupMenu then
		
			local zn = CustomZone:getByName(target)
			zn:spawnGroup('leogroup')
			
			leogroupMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly armor deployed at '..target, 15)
		end
	end
	
	leogroupMenu = bc:showTargetZoneMenu(2, 'Deploy Leopard group (Choose friendly zone)', deployLeogroup, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then
		
		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('leogroup')
		trigger.action.outTextForCoalition(2, 'Friendly Leopard group deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)

artyMenu = nil
bc:registerShopItem('artillery', 'Deploy artillery (for combined arms)', 100, function(sender)
	
	if artyMenu then
		return 'Choose deploy zone from F10 menu'
	end
	
	local deployArty = function(target)
		if artyMenu then
		
			local zn = CustomZone:getByName(target)
			zn:spawnGroup('ca-arty')
			
			artyMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly artillery deployed at '..target, 15)
		end
	end
	
	artyMenu = bc:showTargetZoneMenu(2, 'Deploy artillery (Choose friendly zone)', deployArty, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then
		
		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('ca-arty')
		trigger.action.outTextForCoalition(2, 'Friendly artillery deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)

reconMenu = nil
bc:registerShopItem('recon', 'Deploy recon group (for combined arms)', 50, function(sender)
	
	if reconMenu then
		return 'Choose deploy zone from F10 menu'
	end
	
	local deployRecon = function(target)
		if reconMenu then
		
			local zn = CustomZone:getByName(target)
			zn:spawnGroup('ca-recon')
			
			reconMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly recon group deployed at '..target, 15)
		end
	end
	
	reconMenu = bc:showTargetZoneMenu(2, 'Deploy recon group (Choose friendly zone)', deployRecon, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then
		
		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('ca-recon')
		trigger.action.outTextForCoalition(2, 'Friendly recon group deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)

airdefMenu = nil
bc:registerShopItem('airdef', 'Deploy air defence (for combined arms)', 150, function(sender)
	
	if airdefMenu then
		return 'Choose deploy zone from F10 menu'
	end
	
	local deployAirDef = function(target)
		if airdefMenu then
		
			local zn = CustomZone:getByName(target)
			zn:spawnGroup('ca-airdef')
			
			airdefMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly air defence deployed at '..target, 15)
		end
	end
	
	airdefMenu = bc:showTargetZoneMenu(2, 'Deploy air defence (Choose friendly zone)', deployAirDef, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then
		
		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('ca-airdef')
		trigger.action.outTextForCoalition(2, 'Friendly air defence deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)

Group.getByName('jtacDrone'):destroy()
local jtacTargetMenu = nil
drone = JTAC:new({name = 'jtacDrone'})
bc:registerShopItem('jtac', 'MQ-9 Reaper JTAC mission', 150, function(sender)
	
	if jtacTargetMenu then
		return 'Choose target zone from F10 menu'
	end
	
	local spawnAndOrbit = function(target)
		if jtacTargetMenu then
			local zn = bc:getZoneByName(target)
			drone:deployAtZone(zn)
			drone:showMenu()
			trigger.action.outTextForCoalition(2, 'Reaper drone deployed over '..target, 15)
			jtacTargetMenu = nil
		end
	end
	
	jtacTargetMenu = bc:showTargetZoneMenu(2, 'Deploy JTAC', spawnAndOrbit, 1)
	
	trigger.action.outTextForCoalition(2, 'Choose which zone to deploy JTAC at from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 1 then
		drone:deployAtZone(params.zone)
		drone:showMenu()
		trigger.action.outTextForCoalition(2, 'Reaper drone deployed over '..params.zone.zone, 15)
	else
		return 'Can only target enemy zone'
	end
end)

local smoketargets = function(tz)
	local units = {}
	for i,v in pairs(tz.built) do
		local g = Group.getByName(v)
		for i2,v2 in ipairs(g:getUnits()) do
			table.insert(units, v2)
		end
	end
	
	local tgts = {}
	for i=1,3,1 do
		if #units > 0 then
			local selected = math.random(1,#units)
			table.insert(tgts, units[selected])
			table.remove(units, selected)
		end
	end
	
	for i,v in ipairs(tgts) do
		local pos = v:getPosition().p
		trigger.action.smoke(pos, 1)
	end
end
------------------------------------ START own 9 line jtac AM START ----------------------------------
local jtacZones = {}
Group.getByName('JTAC9lineam'):destroy()
local jtacTargetMenu2 = nil
local droneAM = JTAC9line:new({name = 'JTAC9lineam'})
bc:registerShopItem('9lineam', 'Jtac 9line AM', 0, function(sender)
    if jtacTargetMenu2 then
        return 'Choose target zone from F10 menu'
    end
    
    local spawnAndOrbit2 = function(target)
        if jtacTargetMenu2 then
            local zn = bc:getZoneByName(target)
            droneAM:deployAtZone(zn)
			
			jtacZones[target] = {drone = 'JTAC9lineam'}
			
			
		trigger.action.outTextForCoalition(2, 'Reaper drone deployed over ' .. target .. '. Contact Springfield on 241.00 AM ', 30)
        jtacTargetMenu2 = nil
		end
    end
    
    jtacTargetMenu2 = bc:showTargetZoneMenu(2, 'Deploy JTAC to Zone', spawnAndOrbit2, 1)
    trigger.action.outTextForCoalition(2, 'Choose which zone to deploy JTAC at from F10 menu', 15)
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        droneAM:deployAtZone(params.zone)
		jtacZones[params.zone.zone] = {drone = 'JTAC9lineam'}
        trigger.action.outTextForCoalition(2, 'Reaper drone deployed over ' .. params.zone.zone .. '. Contact Springfield on 241.00 AM ', 30)
    else
        return 'Can only target enemy zone'
    end
end)

  ------------------------------ END 9 line jtac AM END ----------------------------------
  ----------------------------- START 9 line jtac fm START ---------------------------

Group.getByName('JTAC9linefm'):destroy()
local jtacTargetMenu3 = nil
local droneFM = JTAC9linefmr:new({name = 'JTAC9linefm'})
bc:registerShopItem('9linefm', 'Jtac 9line FM', 0, function(sender)
    if jtacTargetMenu3 then
        return 'Choose target zone from F10 menu'
    end
    
    local spawnAndOrbit3 = function(target)
        if jtacTargetMenu3 then
            local zn = bc:getZoneByName(target)
            droneFM:deployAtZone(zn)
			
			jtacZones[target] = {drone = 'JTAC9linefm'}
			
		trigger.action.outTextForCoalition(2, 'Reaper drone deployed over ' .. target .. '. Contact Uzi on 31.00 FM ', 30)            
            jtacTargetMenu3 = nil
        end
    end
    
    jtacTargetMenu3 = bc:showTargetZoneMenu(2, 'Deploy JTAC to Zone', spawnAndOrbit3, 1)
    trigger.action.outTextForCoalition(2, 'Choose which zone to deploy JTAC at from F10 menu', 15)
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
        droneFM:deployAtZone(params.zone)
		jtacZones[params.zone.zone] = {drone = 'JTAC9linefm'}
        trigger.action.outTextForCoalition(2, 'Reaper drone deployed over ' .. params.zone.zone .. '. Contact Uzi on 31.00 FM ', 30)
    else
        return 'Can only target enemy zone'
    end
end)


function CheckJtacStatus()
	 if jtacZones == nil then
			return false
		end

    local jtacFound = false
    
    for zoneName, jtacInfo in pairs(jtacZones) do
        local jtacGroup = Group.getByName(jtacInfo.drone)
        if jtacGroup and Utils.isGroupActive(jtacGroup) then
            local zone = bc:getZoneByName(zoneName)
            if zone and zone.side == 0 or not zone.active then
                jtacGroup:destroy()
                jtacZones[zoneName] = nil
                jtacFound = true
            end
        else
            jtacZones[zoneName] = nil
        end
    end

    return jtacFound
end

  -------------------------- END 9 line jtac FM END ----------------------------------
local smokeTargetMenu = nil
bc:registerShopItem('smoke', 'Smoke markers', 20, function(sender)
	if smokeTargetMenu then
		return 'Choose target zone from F10 menu'
	end
	
	local launchAttack = function(target)
		if smokeTargetMenu then
			local tz = bc:getZoneByName(target)
			smoketargets(tz)
			smokeTargetMenu = nil
			trigger.action.outTextForCoalition(2, 'Targets marked with RED smoke at '..target, 15)
		end
	end
	
	smokeTargetMenu = bc:showTargetZoneMenu(2, 'Smoke marker target', launchAttack, 1)
	
	trigger.action.outTextForCoalition(2, 'Choose target zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 1 then
		smoketargets(params.zone)
		trigger.action.outTextForCoalition(2, 'Targets marked with RED smoke at '..params.zone.zone, 15)
	else
		return 'Can only target enemy zone'
	end
end)

local casTargetMenu = nil

Group.getByName('cas1'):destroy()
Group.getByName('cas2'):destroy()
Group.getByName('cas3'):destroy()
Group.getByName('cas4'):destroy()
Group.getByName('cas5'):destroy()
bc:registerShopItem('cas', 'F-16C Ground Attack', 500, function(sender)
    local grname = 'cas1'
	if zones.sukhumi.wasBlue and zones.kutaisi.wasBlue and not zones.charlie.wasBlue then
		grname = 'cas2'
	elseif zones.sochi.wasBlue and zones.charlie.wasBlue and not zones.maykop.wasBlue then
		grname = 'cas3'
	elseif zones.maykop.wasBlue and zones.anapa.wasBlue and not zones.mozdok.wasBlue then
		grname = 'cas4'
	elseif zones.nalchik.wasBlue and zones.mineralnye.wasBlue and zones.mozdok.wasBlue then
		grname = 'cas5'
	end



    local gr = Group.getByName(grname)
    if Utils.isGroupActive(gr) then
        return 'Ground attack mission still in progress'
    end

    mist.respawnGroup(grname, true)

    if casTargetMenu then
        return 'Choose target zone from F10 menu'
    end

    local launchAttack = function(target)
        if casTargetMenu then
            if Group.getByName(grname) then
                local err = bc:engageZone(target, grname)
                if err then
                    return err
                end

                trigger.action.outTextForCoalition(2, 'F-16C Vipers engaging groups at ' .. target, 15)
            else
                trigger.action.outTextForCoalition(2, 'Group has left the area or has been destroyed', 15)
            end

            casTargetMenu = nil
        end
    end

    casTargetMenu = bc:showTargetZoneMenu(2, 'F-16C Target', launchAttack, 1)

    trigger.action.outTextForCoalition(2, 'F-16C Vipers on route. Choose target zone from F10 menu', 15)
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
    local grname = 'cas1'
	if zones.sukhumi.wasBlue and zones.kutaisi.wasBlue and not zones.charlie.wasBlue then
		grname = 'cas2'
	elseif zones.sochi.wasBlue and zones.charlie.wasBlue and not zones.maykop.wasBlue then
		grname = 'cas3'
	elseif zones.maykop.wasBlue and zones.anapa.wasBlue and not zones.mozdok.wasBlue then
		grname = 'cas4'
	elseif zones.nalchik.wasBlue and zones.mineralnye.wasBlue and zones.mozdok.wasBlue then
		grname = 'cas5'
	end


        local gr = Group.getByName(grname)
        if gr and gr:getSize() > 0 and gr:getController():hasTask() then
            return 'Ground attack mission still in progress'
        end

        mist.respawnGroup(grname, true)
        mist.scheduleFunction(function(target)
            if Group.getByName(grname) then
                local err = bc:engageZone(target, grname)
                if err then
                    return err
                end

                trigger.action.outTextForCoalition(2, 'F-16C Vipers engaging groups at ' .. target, 15)
            end
        end, {params.zone.zone}, timer.getTime() + 2)
    else
        return 'Can only target enemy zone'
    end
end)

local seadTargetMenu = nil

Group.getByName('sead1'):destroy()
Group.getByName('sead2'):destroy()
Group.getByName('sead3'):destroy()
Group.getByName('sead4'):destroy()
Group.getByName('sead5'):destroy()

bc:registerShopItem('sead', 'F/A-18C SEAD mission', 250, function(sender)
    local grname = 'sead1'
	if zones.sukhumi.wasBlue and zones.kutaisi.wasBlue and not zones.charlie.wasBlue then
		grname = 'sead2'
	elseif zones.sochi.wasBlue and zones.charlie.wasBlue and not zones.maykop.wasBlue then
		grname = 'sead3'
	elseif zones.maykop.wasBlue and zones.anapa.wasBlue and not zones.mozdok.wasBlue then
		grname = 'sead4'
	elseif zones.nalchik.wasBlue and zones.mineralnye.wasBlue and zones.mozdok.wasBlue then
		grname = 'sead5'
	end



    local gr = Group.getByName(grname)
    if Utils.isGroupActive(gr) then
        return 'SEAD mission still in progress'
    end

    mist.respawnGroup(grname, true)

    if seadTargetMenu then
        return 'Choose target zone from F10 menu'
    end

    local launchAttack = function(target)
        if seadTargetMenu then
            if Group.getByName(grname) then
                local err = bc:engageSead(target, grname, AI.Task.WeaponExpend.ALL)
                if err then
                    return err
                end

                trigger.action.outTextForCoalition(2, 'F/A-18C Hornets engaging SAMs at ' .. target, 15)
            else
                trigger.action.outTextForCoalition(2, 'Group has left the area or has been destroyed', 15)
            end

            seadTargetMenu = nil
        end
    end

    seadTargetMenu = bc:showTargetZoneMenu(2, 'SEAD Target', launchAttack, 1)

    trigger.action.outTextForCoalition(2, 'F/A-18C Hornets on route. Choose target zone from F10 menu', 15)
end,
function(sender, params)
    if params.zone and params.zone.side == 1 then
    local grname = 'sead1'
	if zones.sukhumi.wasBlue and zones.kutaisi.wasBlue and not zones.charlie.wasBlue then
		grname = 'sead2'
	elseif zones.sochi.wasBlue and zones.charlie.wasBlue and not zones.maykop.wasBlue then
		grname = 'sead3'
	elseif zones.maykop.wasBlue and zones.anapa.wasBlue and not zones.mozdok.wasBlue then
		grname = 'sead4'
	elseif zones.nalchik.wasBlue and zones.mineralnye.wasBlue and zones.mozdok.wasBlue then
		grname = 'sead5'
	end



        local gr = Group.getByName(grname)
        if gr and gr:getSize() > 0 and gr:getController():hasTask() then
            return 'SEAD mission still in progress'
        end

        mist.respawnGroup(grname, true)
        mist.scheduleFunction(function(target)
            if Group.getByName(grname) then
                local err = bc:engageSead(target, grname, AI.Task.WeaponExpend.ALL)
                if err then
                    return err
                end

                trigger.action.outTextForCoalition(2, 'F/A-18C Hornets engaging SAMs at ' .. target, 15)
            end
        end, {params.zone.zone}, timer.getTime() + 2)
    else
        return 'Can only target enemy zone'
    end
end)

-- new menu
local supplyMenu=nil
bc:registerShopItem('capture','Emergency capture neutral zone',0,
function(sender)
	if supplyMenu then
		return 'Choose a zone from F10 menu'
	end
    local cost=500
    trigger.action.outTextForCoalition(2,'Select zone from F10 menu',15)
    supplyMenu=bc:showEmergencyNeutralZoneMenu(2,'Select Zone for Emergency capture',
    function(zonename)
		env.info('DIGII ZONES NAME: ' ..zonename)
        if not zonename then
            bc:addFunds(2,cost)
            if supplyMenu then missionCommands.removeItemForCoalition(2,supplyMenu) end
            supplyMenu=nil
            trigger.action.outTextForCoalition(2,'No zone name selected, purchase refunded',10)
            return 'No zone name'
        end
        local chosenZone=bc:getZoneByName(zonename)
        if not chosenZone then
            bc:addFunds(2,cost)
            if supplyMenu then missionCommands.removeItemForCoalition(2,supplyMenu) end
            supplyMenu=nil
            trigger.action.outTextForCoalition(2,'Zone not found, purchase refunded',10)
            return 'Zone not found'
        end
        if chosenZone.side~=0 then
            bc:addFunds(2,cost)
            if supplyMenu then missionCommands.removeItemForCoalition(2,supplyMenu) end
            supplyMenu=nil
            trigger.action.outTextForCoalition(2,'Zone is not neutral anymore, purchase refunded',10)
            return 'Zone is no longer neutral!'
        end
        local bestCommander,status=findNearestAvailableSupplyCommander(chosenZone)
        if not bestCommander then
            bc:addFunds(2,cost)
            if supplyMenu then missionCommands.removeItemForCoalition(2,supplyMenu) end
            supplyMenu=nil
            if status=='inprogress' then
                trigger.action.outTextForCoalition(2,'Supply to '..chosenZone.zone..' already in progress, purchase refunded',10)
                return 'Supply mission in progress for this zone'
            else
                trigger.action.outTextForCoalition(2,'No suitable supply group found for '..chosenZone.zone..', purchase refunded',10)
                return 'No available supply convoys'
            end
        end
        bestCommander.targetzone=zonename
        bestCommander.state='preparing'
        bestCommander.urgent=true
        bestCommander.lastStateTime=timer.getAbsTime()-999999
        trigger.action.outTextForCoalition(2,'Emergency Capture from '..bestCommander.name..' heading to '..zonename,10)
        if supplyMenu then
            missionCommands.removeItemForCoalition(2,supplyMenu)
            supplyMenu=nil
        end
        return nil
    end)
    return nil
end,
function(sender,params)
    if not params.zone or params.zone.side~=0 then
        return 'Zone is not neutral'
    end
    local chosenZone=bc:getZoneByName(params.zone.zone)
    local bestCommander,status=findNearestAvailableSupplyCommander(chosenZone)
    if not bestCommander then
        if status=='inprogress' then
            return 'Supply mission in progress for this zone'
        else
            return 'No available supply convoys'
        end
    end
    bestCommander.targetzone=params.zone.zone
    bestCommander.state='preparing'
    bestCommander.urgent=true
    bestCommander.lastStateTime=timer.getAbsTime()-999999
    trigger.action.outTextForCoalition(2,'Emergency Capture from '..bestCommander.name..' heading to '..params.zone.zone,10)
    return nil
end)
--end of menu

local intelMenu=nil
bc:registerShopItem('intel','Intel on enemy zone',150,function(sender)
	if intelMenu then
		return 'Already choosing a zone'
	end
	local pickZone = function(targetZoneName)
		if intelMenu then
			local zoneObj = bc:getZoneByName(targetZoneName)
			if not zoneObj or zoneObj.side ~= 1 then
				return 'Must pick an enemy zone'
			end
			intelActiveZones[targetZoneName] = true
			trigger.action.outTextForCoalition(2, 'Intel available for '..targetZoneName..'. Check Zone status. Valid for 1 hour', 15)
			mist.scheduleFunction(function(zName)
				local zn = bc:getZoneByName(zName)
				if not zn or zn.side ~= 1 then return end
				if intelActiveZones[zName] then
					intelActiveZones[zName] = false
					trigger.action.outTextForCoalition(2, 'Intel on '..zName..' has expired.', 10)
				end
			end, {targetZoneName}, timer.getTime()+60*60)
			intelMenu = nil
		end
	end
	intelMenu = bc:showTargetZoneMenu(2, 'Choose Enemy Zone for Intel', pickZone, 1)
	trigger.action.outTextForCoalition(2, 'Intel purchase started. Select enemy zone from F10 menu.', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 1 then
		intelActiveZones[params.zone.zone] = true
		trigger.action.outTextForCoalition(2, 'Intel available for '..params.zone.zone..'. Check Zone status. Valid for 1 hour', 15)
		mist.scheduleFunction(function(zName)
			if intelActiveZones[zName] then
				intelActiveZones[zName] = false
				trigger.action.outTextForCoalition(2, 'Intel on '..zName..' has expired.', 10)
			end
		end, {params.zone.zone}, timer.getTime()+60*60)
	else
		return 'Must pick an enemy zone'
	end
end)

bc:addShopItem(2, 'cap', -1)
bc:addShopItem(2, 'cas', -1)
bc:addShopItem(2, 'sead', -1)
bc:addShopItem(2, '9lineam', -1)
bc:addShopItem(2, '9linefm', -1) 
bc:addShopItem(2, 'supplies', -1)
bc:addShopItem(2, 'supplies2', -1)
bc:addShopItem(2, 'jtac', -1)
bc:addShopItem(2, 'smoke', -1)
bc:addShopItem(2, 'armor', -1)
bc:addShopItem(2, 'leogroup', -1)
bc:addShopItem(2, 'artillery', -1)
bc:addShopItem(2, 'recon', -1)
bc:addShopItem(2, 'airdef', -1)
bc:addShopItem(2, 'capture', -1)
bc:addShopItem(2, 'intel', -1)

supplyZones = {
	'Blue Carrier',
	'Red Carrier',
	'Batumi',	
	'Kobuleti', 
	'Senaki', 
	'Kutaisi', 
	'Alpha', 
	'Sukhumi', 
	'Gudauta', 
	'Sochi',
	'Bravo',
	'Charlie',
	'Delta',
	'Gelendzhik',
	'Novorossiysk',
	'Anapa',
	'Krymsk',
	'Echo',
	'Krasnodar-Center',
	'Krasnodar-Pashkovsky',
	'Foxtrot',
	'Maykop',
	'Golf',
	'Hotel',
	'India',
	'Mineralnye',
	'Nalchik',
	'Mozdok',
	'Beslan',
	'Juliett',
	'Kilo',
	'Lima',
	'Soganlug',
	'Tbilisi',
	'Vaziani'
}

lc = LogisticCommander:new({battleCommander = bc, supplyZones = supplyZones})
lc:init()

bc:loadFromDisk() --will load and overwrite default zone levels, sides, funds and available shop items
bc:init()
bc:startRewardPlayerContribution(15,{infantry = 10, ground = 10, sam = 30, airplane = 30, structure = 30, ship = 250, helicopter=30, crate=200, rescue = 100})
HercCargoDropSupply.init(bc)

GlobalSettings.defaultRespawns[1]['supply'] = { dead=60*60, hangar=30*60, preparing=5*60}
GlobalSettings.setDifficultyScaling(1.4,1)


evc = EventCommander:new({ decissionFrequency=30*60, decissionVariance=30*60, skipChance = 10})
evc:init()

Group.getByName('Maykop-Scuds'):destroy()
evc:addEvent({
	id='scuds',
	action = function()
	mist.respawnGroup('Maykop-Scuds', true)
		
		timer.scheduleFunction(function(param, time)
			if Group.getByName('Maykop-Scuds') then
				local tgts = {
					'Gudauta',
					'Sochi',
					'Sukhumi'
				
				}
				
				local validtgts = {}
				for _,v in ipairs(tgts) do
					if bc:getZoneByName(v).side == 2 then
						table.insert(validtgts, v)
					end
				end
				
				if #validtgts == 0 then return time+(10*60) end
				
				local die = math.random(1,#validtgts)
				local choice = validtgts[die]
				bc:fireAtZone(choice, 'Maykop-Scuds', false, 8)
				trigger.action.outTextForCoalition(2, 'SCUDS at Maykop are launching at '..choice, 15)
			end
		end, {}, timer.getTime()+(20*60))
	end,
	canExecute = function()
		if math.random(1,100) < 50 then return false end
		local gr = Group.getByName('Maykop-Scuds')
		if gr then return false end
		
		if bc:getZoneByName('Maykop').side ~= 1 then return false end
		
		local triggers = {'Sukhumi', 'Sochi'}
		for _,v in ipairs(triggers) do
			if bc:getZoneByName(v).side == 2 then
				return true
			end
		end
		
		return false
	end
})

Group.getByName('evt-shiptercept1'):destroy()
Group.getByName('evt-shiptercept2'):destroy()
Group.getByName('evt-shiptercept3'):destroy()
local shipDieEvent = nil
evc:addEvent({
	id='shiptercept',
	action=function()
		local ships={'evt-shiptercept1','evt-shiptercept2','evt-shiptercept3'}
		local choice=math.random(1,#ships)
		mist.respawnGroup(ships[choice],true)

		local shipDied=function(event)
			if event.id==30 then
				if event.initiator and event.initiator.getName then
					local name=event.initiator:getName()
					if type(name)=="string" and name:find('^evt%-shiptercept') then
						if IsGroupActive(name) then
							return
						end
						
						mist.removeEventHandler(shipDieEvent)
						shipDieEvent=nil
						trigger.action.outTextForCoalition(2,'Enemy supply ship destroyed.\n+500 credits',15)
						bc:addFunds(2,500)
					end
				end
			end
		end
		shipDieEvent=mist.addEventHandler(shipDied)
	end,
	canExecute=function()
		if math.random(1,100)<70 then return false end
		if bc:getZoneByName('Red Carrier').side~=2 then return false end
		if bc:getZoneByName('Novorossiysk').side~=1 then return false end
		if bc:getZoneByName('Sochi').side~=2 then return false end
		if Group.getByName('evt-shiptercept1') then return false end
		if Group.getByName('evt-shiptercept2') then return false end
		if Group.getByName('evt-shiptercept3') then return false end
		return true
	end
})
Group.getByName('evt-cargointercept1'):destroy()
Group.getByName('evt-cargointercept2'):destroy()
Group.getByName('evt-cargointercept3'):destroy()
Group.getByName('evt-cargointercept4'):destroy()
local cargoDieEvent = nil
evc:addEvent({
	id='cargointercept',
	action = function()
		local planes
		if bc:getZoneByName('Maykop').side == 1 then
		  planes = {'evt-cargointercept1'}
		elseif bc:getZoneByName('Sochi').side == 1 then
		  planes = {'evt-cargointercept2'}
		elseif bc:getZoneByName('Anapa').side == 1 then
		  planes = {'evt-cargointercept3'}
		elseif bc:getZoneByName('Mineralnye').side == 1 then
		  planes = {'evt-cargointercept4'}
		else
			return
		end
		mist.respawnGroup(planes[1], true)
		local cargoDie = function(event)
			if event.id==30 then
				if event.initiator and event.initiator.getName then
					local name = event.initiator:getName()
					if type(name)=="string" and name:find('^evt%-cargointercept') then
						if IsGroupActive(name) then
							return
						end
						mist.removeEventHandler(cargoDieEvent)
						cargoDieEvent = nil
						trigger.action.outTextForCoalition(2,'Enemy cargo plane destroyed.\n+500 credits',15)
						bc:addFunds(2,500)
					end
				end
			end
		end
		cargoDieEvent = mist.addEventHandler(cargoDie)
	end,
	canExecute = function()
		if math.random(1,100) < 70 then return false end
		if bc:getZoneByName('Maykop').wasBlue and bc:getZoneByName('Sochi').wasBlue and
		   bc:getZoneByName('Anapa').wasBlue then return false end
		if Group.getByName('evt-cargointercept1') then return false end
		if Group.getByName('evt-cargointercept2') then return false end
		if Group.getByName('evt-cargointercept3') then return false end
		if Group.getByName('evt-cargointercept4') then return false end
		return true
	end
})

mc = MissionCommander:new({side = 2, battleCommander = bc, checkFrequency = 60})

mc:trackMission({ --!
	title = "Destroy SCUDS (21)",
	description = "SCUDS have been spotted at Zapolyarnyy (21).\nDestroy them before they can launch their missiles",
	messageStart = function ()
		DIGII_GROUND_PLAYER_TAKS:NEW_BAI_TASK("Zapolyarnyy", "(21)")
		return "New mission: Destroy SCUDS at Maykop"
	end,
	messageEnd = "Mission ended: Destroy SCUDS",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
	isActive = function()
		local gr = Group.getByName('Maykop-Scuds')
		if gr then return true else return false end
	end
})
mc:trackMission({
    title = "Intercept cargo plane",
    description = "Find and destroy the enemy cargo plane taking off from Vaziani heading for Anapa, Kutaisi or Mineralnye.",
    messageStart = "New mission: Intercept cargo plane",
    messageEnd = "Mission ended: Intercept cargo plane",
    startAction = function() 
        if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function() 
        if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if Group.getByName('evt-cargointercept1') then return true end
        if Group.getByName('evt-cargointercept2') then return true end
        if Group.getByName('evt-cargointercept3') then return true end
        
        return false
    end
})

mc:trackMission({
    title = "Destroy cargo & battle ships",
    description = "Find and destroy the enemy battle ships sailing off from Novorossiysk, heading towards Sochi or Gudauta or Sukhumi!",
    messageStart = "New mission: Destroy battle ships",
    messageEnd = "Mission ended: Destroy battle ships",
    startAction = function()
        if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
        if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if Group.getByName('evt-shiptercept1') then return true end
        if Group.getByName('evt-shiptercept2') then return true end
        if Group.getByName('evt-shiptercept3') then return true end

        return false
    end
})

Group.getByName('evt-bomb'):destroy()
Group.getByName('EscortBomber'):destroy()
evc:addEvent({
	id='bomb',
	action = function()
		mist.respawnGroup('evt-bomb', true)
		timer.scheduleFunction(function()
			startBomberAttack()
			mist.respawnGroup('EscortBomber', true)
			timer.scheduleFunction(function()
				local bomber = Group.getByName('evt-bomb')
				local escort = Group.getByName('EscortBomber')
				if bomber and escort then
					local cnt = escort:getController()
					cnt:popTask()
					local escortTask = {
						id = 'Escort',
						params = {
							groupId = bomber:getID(),
							pos = {x=-20,y=2000,z=50},
							lastWptIndexFlag=false,
							lastWptIndex=-1,
							engagementDistMax=12000,
							targetTypes={"Air"}
						}
					}
					cnt:pushTask(escortTask)
				end
			end, {}, timer.getTime()+5)
		end, {}, timer.getTime()+10)
	end,	
	canExecute = function()
		local gr = Group.getByName('evt-bomb')
		if gr then return false end
		if math.random(1,100)<70 then return false end
		local triggers = {'Kutaisi', 'Sochi', 'Sukhumi', 'Maykop', 'Mineralnye'}
		for _,v in ipairs(triggers) do
			if bc:getZoneByName(v).side == 2 then
				return true
			end
		end
		
		return false
	end
})

function startBomberAttack()
	local tgts = {
		'Kutaisi',
		'Sochi',
		'Senaki',
		'Batumi',
		'Kobuleti',
		'Sukhumi',
		'Gudauta',
		'Gelendzhik',
		'Novorossiysk',
		'Krymsk',
		'Krasnodar-Center',
		'Krasnodar-Pashkovsky',
		'Maykop',
		'Mineralnye',
		'Mozdok'
	}
	
	local validtgts = {}
	for _,v in ipairs(tgts) do
		if bc:getZoneByName(v).side == 2 then
			table.insert(validtgts, v)
		end
	end
	
    if #validtgts > 0 then
        local choice = validtgts[math.random(#validtgts)]
        BASE:I("Chosen target: "..choice)
        if Group.getByName('evt-bomb') then
            bc:carpetBombRandomUnitInZone(choice, 'evt-bomb')
        end
    else
        BASE:I("No valid targets found for bomber attack.")
    end
end

mc:trackMission({
	title = "Intercept Bombers",
	description = "Enemy bombers spotted north of Mineralnye\nDestroy them before they get in range.",
	messageStart = "New mission: Intercept Bombers",
	messageEnd = "Mission ended: Intercept Bombers",
	startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
	isActive = function()
		local gr = Group.getByName('evt-bomb')
		if gr then return true else return false end
	end
})

Group.getByName('evt-attack'):destroy()
evc:addEvent({
	id='cas',
	action = function()
		mist.respawnGroup('evt-attack', true)
		
		timer.scheduleFunction(function(param, time)
			local tgts = {
			'Kutaisi',
			'Sochi',
			'Senaki',
			'Batumi',
			'Kobuleti',
			'Sukhumi',
			'Gudauta',
			'Gelendzhik',
			'Novorossiysk',
			'Krymsk',
			'Krasnodar-Center',
			'Krasnodar-Pashkovsky',
			'Maykop',
			'Mineralnye',
			'Mozdok'
			}		
			local validtgts = {}
			for _,v in ipairs(tgts) do
				if bc:getZoneByName(v).side == 2 then
					table.insert(validtgts, v)
				end
			end
			
			if #validtgts ~= 0 then
				local die = math.random(1,#validtgts)
				local choice = validtgts[die]
				
				if Group.getByName('evt-attack') then
					bc:engageZone(choice, 'evt-attack')
				end
			end
		end, {}, timer.getTime()+3)
	end,
	canExecute = function()
		local gr = Group.getByName('evt-attack')
		if gr then return false end
		if math.random(1,100) < 50 then return false end
				
		local triggers = {'Kutaisi', 'Sochi', 'Sukhumi', 'Maykop', 'Mineralnye'}
		for _,v in ipairs(triggers) do
			if bc:getZoneByName(v).side == 2 then
				return true
			end
		end
		
		return false
	end
})
mc:trackMission({
	title = "Intercept enemy airstrike",
	description = "Enemy aircraft conducting an airstrike from the west to east\nDestroy them before they get in range.",
	messageStart = "New mission: Intercept enemy airstrike",
	messageEnd = "Mission ended: Intercept enemy airstrike",
	startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
	isActive = function()
		local gr = Group.getByName('evt-attack')
		if gr then return true else return false end
	end
})
Group.getByName('escort-me'):destroy()
Group.getByName('interceptor-1'):destroy()
Group.getByName('interceptor-2'):destroy()
evc:addEvent({
	id='escort',
	action = function()
		mist.respawnGroup('escort-me', true)
		
		local spawnIntercept = function(groupname)
			if Group.getByName('escort-me') then
				local g = Group.getByName(groupname)
				if not g then
					if math.random(1,100) > 30 then
						if math.random(1,100) > 50 then
							trigger.action.outTextForCoalition(2,'Enemy interceptor spotted heading for our cargo transport.',15)
						else
							trigger.action.outTextForCoalition(2,'The enemy has launched an intercept mission against our cargo transport',15)
						end
						mist.respawnGroup(groupname, true)
					end
				end
			end
		end
		
		local timers = {math.random(10*60,20*60), math.random(15*60,25*60)}
		mist.scheduleFunction(spawnIntercept, {'interceptor-1'}, timer.getTime()+timers[1])
		mist.scheduleFunction(spawnIntercept, {'interceptor-2'}, timer.getTime()+timers[2])
	end,
	canExecute = function()
		local gr = Group.getByName('escort-me')
		if gr then return false end
		if bc:getZoneByName('Kutaisi').side ~= 2 then return false end
		local triggers = {'Kutaisi', 'Sochi', 'Sukhumi', 'Maykop', 'Mineralnye'}
		for _,v in ipairs(triggers) do
			if bc:getZoneByName(v).side == 2 then
				return true
			end
		end
		
		return false
	end
})
mc:trackMission({
    title = "Escort cargo plane",
    description = "Friendly cargo plane is taking off from Kutaisi. Protect it until it leaves the airspace.",
    messageStart = "New mission: Escort cargo plane",
    messageEnd = "Mission ended: Escort cargo plane",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if Group.getByName('escort-me') then return true end
        return false
    end
})
resupplyTarget = nil
mc:trackMission({
    title = function()
        local wp = WaypointList[resupplyTarget] or ""
        return "Resupply " .. resupplyTarget .. wp
    end,
    description = function()
        return "Deliver supplies to " .. resupplyTarget end,
    messageStart = function()
        local wp = WaypointList[resupplyTarget] or ""
        return "New mission: Resupply " .. resupplyTarget .. wp
    end,
    messageEnd = function()
        return "Mission ended: Resupply " .. resupplyTarget end,
    startAction = function()
        if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
		resupplyTarget = nil
        if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if not resupplyTarget then return false end

        local targetzn = bc:getZoneByName(resupplyTarget)
        return targetzn:canRecieveSupply()
    end
})
attackTarget = nil
mc:trackMission({ --
    title = function()
        local wp = WaypointList[attackTarget] or ""
        return "Attack " .. attackTarget .. wp
    end,
    description = function()
        local wp = WaypointList[attackTarget] or ""
        return "Destroy enemy forces at " .. attackTarget end,
    messageStart = function()
        local wp = WaypointList[attackTarget] or ""
		DIGII_GROUND_PLAYER_TAKS:NEW_ATTACK_TASK(attackTarget, wp)
        return "New mission: Attack " .. attackTarget .. wp
    end,
    messageEnd = function()
        return "Mission ended: Attack " .. attackTarget end,
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cas.ogg")
        end
    end,
    endAction = function()
		attackTarget = nil
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if not attackTarget then return false end
        local targetzn = bc:getZoneByName(attackTarget)
        return targetzn.side == 1
    end
})


captureTarget = nil
mc:trackMission({ --
    title = function()
        local wp = WaypointList[captureTarget] or ""
        return "Capture " .. captureTarget .. wp
    end,
    description = function()
        return captureTarget .. " is neutral. Capture it by delivering supplies" end,
    messageStart = function()
        local wp = WaypointList[captureTarget] or ""
        return "New mission: Capture " .. captureTarget .. wp
    end,
    messageEnd = function()
        return "Mission ended: Capture " .. captureTarget end,
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
	captureTarget = nil
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if not captureTarget then return false end

        local targetzn = bc:getZoneByName(captureTarget)
        return targetzn.side == 0 and targetzn.active
    end
})

seadTarget = nil
function generateSEADMission()
    if seadTarget then return end
    if not attackTarget then return end

    local function isSEADZone(zone)
        local lname = zone.zone:lower()
        return zone.side == 1 and zone.active and (lname:find('sam') or lname:find('defence'))
    end

    local validSEADZones = {}
    local attackZone = bc:getZoneByName(attackTarget)

    if attackZone then
        for _, zone in ipairs(bc.zones) do
            if isSEADZone(zone) and measureDistanceZoneToZone(attackZone, zone) <= 18520 then
                table.insert(validSEADZones, zone.zone)
            end
        end
    end

    if #validSEADZones == 0 then
        for _, connection in ipairs(bc.connections) do
            local from = bc:getZoneByName(connection.from)
            local to = bc:getZoneByName(connection.to)

            if from.side ~= to.side and from.side ~= 0 and to.side ~= 0 then
                if isSEADZone(from) then
                    table.insert(validSEADZones, from.zone)
                end
                if isSEADZone(to) then
                    table.insert(validSEADZones, to.zone)
                end
            end
        end
    end

	if #validSEADZones == 0 then return end
    seadTarget = validSEADZones[math.random(#validSEADZones)]
    return true
end

mc:trackMission({ --
	zone = seadTarget,
	missionType = "SEAD",
	title = function() return "SEAD mission at " .. seadTarget end,
	description = function() return "Neutralize enemy SAM/defences at " .. seadTarget end,
	messageStart = function()
		DIGII_GROUND_PLAYER_TAKS:NEW_SEAD_TASK(seadTarget)
		return "New SEAD mission: Engage SAM at " .. seadTarget 
	end,
	messageEnd = function() return "SEAD mission ended" end,
	startAction = function()
		if not missionCompleted then
			trigger.action.outSoundForCoalition(2, "ding.ogg") end
	end,
	endAction = function()
		seadTarget = nil
		if not missionCompleted then
			trigger.action.outSoundForCoalition(2, "cancel.ogg") end
	end,
	isActive = function()
		if not seadTarget then return false end
		local zn = bc:getZoneByName(seadTarget)
		return zn and zn.side == 1
	end
})


capMissionTarget = nil
capKillsByPlayer = {}
capTargetPlanes = 0
capWinner = nil
capMissionCooldownUntil = 0

mc:trackMission({
    title = function() return "CAP mission" end,
    description = function()
        if not next(capKillsByPlayer) then
            return "Kill "..capTargetPlanes.." A/A targets without getting shot down, who wins?"
        else
            local scoreboard = "Current Kill Count:\n"
            for playerName, kills in pairs(capKillsByPlayer) do
                scoreboard = scoreboard .. string.format("%s: %d\n", playerName, kills)
            end
            return string.format("Kill %d A/A targets, who wins?\n\n%s", capTargetPlanes, scoreboard)
        end
    end,
    messageStart = function()
        return "New CAP mission: Kill "..capTargetPlanes.." A/A targets." end,
    messageEnd = function() return "Mission ended: CAP" end,
    startAction = function()
        if not missionCompleted then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
        if capWinner then
            local reward = capTargetPlanes * 100
            capMissionCooldownUntil = timer.getTime() + 1800
            trigger.action.outTextForCoalition(2, "["..capWinner.."] completed the CAP mission!\nReward: "..reward.." credits", 20)
            bc:addFunds(2, reward)
        end
        capMissionTarget = nil
        capKillsByPlayer = {}
        capWinner = nil
		capTargetPlanes = 0
        if not missionCompleted then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
    end,
    isActive = function()
        if not capMissionTarget then return false end
        return true
    end
})

function checkAndGenerateCAPMission()
	if capMissionTarget ~= nil or timer.getTime() < capMissionCooldownUntil then
		return
	end
	local countInAir = 0
	for _, zC in pairs(bc.zones) do
		if zC.side == 1 and zC.active then
			for _, groupCom in ipairs(zC.groups) do
				if groupCom.side == 1
				and (groupCom.mission == 'attack' or groupCom.mission == 'patrol')
				and groupCom.state == 'inair' then
					countInAir = countInAir + 1
				end
			end
		end
	end
	local players = getBluePlayersCount()
	local limit = getCapLimit(players)
	if players == 0 then return end
	if countInAir >= 1 then
		if limit == 1 then
			capTargetPlanes = math.random(1,2)
		elseif limit == 2 then
			capTargetPlanes = math.random(2,3)
		elseif limit == 3 then
			capTargetPlanes = math.random(2,4)
		elseif limit == 4 then
			capTargetPlanes = math.random(3,6)
		elseif limit == 99999 then
			capTargetPlanes = math.random(3,6)
		end
		capMissionTarget = "Active"
	end
end

function generateCaptureMission()
    if captureTarget ~= nil then return end
    
    local validzones = {}
    for _, v in ipairs(bc.zones) do
        if v.active and v.side == 0 and (not v.NeutralAtStart or v.firstCaptureByRed) and 
           not string.find(v.zone, "Hidden") then
            table.insert(validzones, v.zone)
        end
    end
    
    if #validzones == 0 then return end
    
    local choice = math.random(1, #validzones)
    if validzones[choice] then
        captureTarget = validzones[choice]
        return true
    end
end

function generateAttackMission()
    if missionCompleted then return end
    if attackTarget ~= nil then return end
	
    local validzones = {}
    for _, v in ipairs(bc.connections) do
        local to = bc:getZoneByName(v.to)
        local from = bc:getZoneByName(v.from)

        local function checkValid(zone)
			local lname = zone.zone:lower()
            return zone.side == 1 and zone.active and not isZoneUnderSEADMission(zone.zone)
			and not lname:find('sam') and not lname:find('defence')
        end

        if from.side ~= to.side and from.side ~= 0 and to.side ~= 0 then
            if checkValid(from) then
                table.insert(validzones, from.zone)
            elseif checkValid(to) then
                table.insert(validzones, to.zone)
            end
        end
    end

    if #validzones == 0 then return end

    local choice = math.random(1, #validzones)
    attackTarget = validzones[choice]
    return true
end
function generateEscortMission(zoneName, groupName, groupID, group, mission)
    local mission = mission or missions[zoneName]
    if not mission then return false end

    missionGroupIDs[zoneName] = missionGroupIDs[zoneName] or {}
    missionGroupIDs[zoneName][groupID] = {
        groupID = groupID,
        group = group
    }
	    if IsGroupActive(mission.missionGroup) then
		trigger.action.outSoundForGroup(groupID, "ding.ogg")
		trigger.action.outTextForGroup(groupID, "Active mission is pending:\n\nEscort convoy from " .. mission.zone .. " to " .. mission.TargetZone, 30)
        return
    end
	if mc.missionFlags[zoneName] then
			trigger.action.outSoundForGroup(groupID, "ding.ogg")
			trigger.action.outTextForGroup(groupID, "Special mission available:\n\nEscort convoy from " .. mission.zone .. " to " .. mission.TargetZone, 30)
		return 
	end

    mc:trackMission({
        MainTitle = function() return "Escort mission" end,
        title = function() return "Escort mission" end,
		titleBefore = function(self)
			self.notified = true
			trigger.action.outSoundForGroup(groupID, "ding.ogg")
			trigger.action.outTextForGroup(groupID, "Special mission available:\n\nEscort convoy from " .. mission.zone .. " to " .. mission.TargetZone, 30)
		 end,
        description = function() return "\nEscort a convoy to " .. mission.TargetZone .. "\nThe roads are filled with hostile enemies." end,
        isEscortMission = true,
        accept = false,
        missionGroup = mission.missionGroup,
        zoneName = zoneName,
        reward = 1000,
        messageStart = function() return "Escort convoy to " .. mission.TargetZone end,
		missionFail = function(self)
		self.accept = false
		if not IsGroupActive(mission.missionGroup) then
			mc.missionFlags[zoneName] = nil
			if missionGroupIDs[zoneName] and next(missionGroupIDs[zoneName]) then
				for groupName, data in pairs(missionGroupIDs[zoneName]) do
					local groupID = data.groupID
					local group = data.group
					trigger.action.outSoundForGroup(groupID, "cancel.ogg")
					trigger.action.outTextForGroup(groupID, "Mission failed:\n\nConvoy was destroyed\n\nRestart the mission from the radio menu", 30)
					removeMissionMenuForAll(mission.zone, groupID)
					if trackedGroups[groupName] then
						trackedGroups[groupName] = nil
						handleMission(zoneName, groupName, groupID, group)
					end
				end
			else
				trigger.action.outSoundForCoalition(2, "cancel.ogg")
				trigger.action.outTextForCoalition(2, "Mission failed:\n\nConvoy was destroyed", 30)
				removeMissionMenuForAll(mission.zone, nil, true)
				destroyGroupIfActive(mission.missionGroup)
			end
			return true
		end
		return false
		end,
		startOver = function(self)
			timer.scheduleFunction(function()
		if missionGroupIDs[zoneName] then
			for groupName, data in pairs(missionGroupIDs[zoneName]) do
				local groupID = data.groupID
				local group = data.group
				handleMission(zoneName, groupName, groupID, group)
				return nil
			end
		end	
			end, nil, timer.getTime() + 10)
		end,
        startAction = function() return IsGroupActive(mission.missionGroup) end,
		endAction = function()
			local targetZone = bc:getZoneByName(mission.TargetZone)
			if targetZone.side == 2 and targetZone.active then
				if missionGroupIDs[zoneName] then
					for groupName, data in pairs(missionGroupIDs[zoneName]) do
						local groupID = data.groupID
						local group = data.group
						removeMissionMenuForAll(mission.zone, groupID)
						if trackedGroups[groupName] then
							trackedGroups[groupName] = nil
						end
						destroyGroupIfActive(mission.missionGroup)
						timer.scheduleFunction(function()
							handleMission(mission.TargetZone, groupName, groupID, group)
						end, nil, timer.getTime() + 30)
					end
				else
					removeMissionMenuForAll(mission.zone, nil, true)

					destroyGroupIfActive(mission.missionGroup)
				end
				mc.missionFlags[zoneName] = nil
				trigger.action.outSoundForCoalition(2, "ding.ogg")
				trigger.action.outTextForCoalition(2, "Escort mission complete!\n\nReward: 1000 credits", 20)
				return true
			end
			return false
		end,
        isActive = function()
            local targetZone = bc:getZoneByName(mission.TargetZone)
            if targetZone.side ~= 2 and targetZone.active then
                return true
            end
            return false
        end,
        returnAccepted = function(self)
            if not self.accept then return false end
            return IsGroupActive(mission.missionGroup)
        end,
    })

    mc.missionFlags[zoneName] = true
end
function generateSupplyMission()
    if missionCompleted then return end
    if resupplyTarget ~= nil then return end

    local validzones = {}
    for _, v in ipairs(bc.zones) do
        if v.side == 2 and v:canRecieveSupply() then
            table.insert(validzones, v.zone)
        end
    end

    if #validzones == 0 then return end

    local choice = math.random(1, #validzones)
    if validzones[choice] then
        resupplyTarget = validzones[choice]
        return true
    end
end

local sceneryList = {
  ["StrikeTarget"] = {SCENERY:FindByZoneName("StrikeTarget")},
  ["StrikeTarget1"] = {SCENERY:FindByZoneName("StrikeTarget1")},
  ["StrikeTarget2"] = {SCENERY:FindByZoneName("StrikeTarget2")},
  ["RightHandMan"] = {SCENERY:FindByZoneName("RightHandMan")},
  ["LefttHandMan"] = {SCENERY:FindByZoneName("LefttHandMan")},
  ["StrikeVaziani"] = {SCENERY:FindByZoneName("StrikeVaziani")},
  
}

SCHEDULER:New(nil, function()
    for name, sceneries in pairs(sceneryList) do
        local allBelow50 = true
        for _, scenery in ipairs(sceneries) do
            if scenery and scenery:GetRelativeLife() > 50 then
                allBelow50 = false
                break
            end
        end
        if allBelow50 then
            CustomFlags[name] = true
        end
    end
end, {}, 5, 20)

mc:trackMission({
	title = "Strike High value target",
	description = 
[[Strike a high-value building at these coordinates:

MGRS: 37 T EK 58654 22580
Lat long: N 44°27'14" E 39°44'14"
Lat long Decimal Minutes: N 44°27.248' E 39°44.234'

Elevation: 677 feet

reward = 500]],
	messageStart = "New strike mission: Strike High value target building",
	messageEnd = "Strike mission ended: Strike High value target building\n+500 credtis",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
	end,
	canExecute = function(self)
	if CustomFlags["StrikeTarget"] then return false end
	if bc:getZoneByName('Sochi').side ~= 1 then return false end
	if not self.myOtherDelay then self.myOtherDelay = timer.getTime() + 70 end
	if timer.getTime() < self.myOtherDelay then return false end
	return true
	end,
	reward = 500,
	isActive = function()
	if CustomFlags["StrikeTarget"] then return false end
	  return true
	end,
})

mc:trackMission({
	title = "Strike High value target",
	description = 
[[Strike a high-value building at these coordinates:

MGRS: 37 T FH 84000 46225
Lat long: N 42°50'47" E 41°15'06"
Lat long Decimal Minutes: N 42°50.788' E 41°15.108'

Elevation: 193 feet

reward = 500]],
	messageStart = "New strike mission: Strike High value target building",
	messageEnd = "Strike mission ended: Strike High value target building\n+500 credits",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
	end,
	canExecute = function(self)
	if CustomFlags["StrikeTarget1"] then return false end
	if bc:getZoneByName('Kutaisi').side ~= 2 then return false end
	if not self.myOtherDelay then self.myOtherDelay = timer.getTime() + 70 end
	if timer.getTime() < self.myOtherDelay then return false end
	return true
	end,
	reward = 500,
	isActive = function()
	if CustomFlags["StrikeTarget1"] then return false end
	  return true
	end,
})
Group.getByName('Red SAM SHORAD StrikeTarget2'):destroy()
evc:addEvent({
	id='StrikeTarget2',
	action = function()
	mist.respawnGroup('Red SAM SHORAD StrikeTarget2')
	end,
	canExecute = function()
		if math.random(1,100) < 50 then return false end
		if bc:getZoneByName('Senaki').side ~= 2 then return false end
		if CustomFlags["StrikeTarget2"] == true then return false end
		return true
end
})
mc:trackMission({
	title = "Strike High value target",
description = 
[[Strike a high value building at these coordinates:

MGRS: 38 T LM 09247 78805
Lat long: N 42°14'17" E 42°41'17"
Lat long Decimal Minutes: N 42°14.288' E 42°41.287'

Elevation: 435 feet

reward = 500]],
	messageStart = "New strike mission: Strike High value target",
	messageEnd = "Strike mission ended: Strike High value target/n+500 credits",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
	end,
	reward = 500,
	isActive = function()
		if CustomFlags["StrikeTarget2"] then return false end
		if Group.getByName('Red SAM SHORAD StrikeTarget2') then return true	end
		return false
	end,
})

--
Group.getByName('RightHandMan'):destroy()
local SecondManEvent = nil
evc:addEvent({
	id='RightHandMan',
	action = function()
		mist.respawnGroup('RightHandMan', true)
		
		local secondManKilled = false
		local GeneralDie = function(event)
			if event.id == 30 and event.initiator and event.initiator.getName then
				local name = event.initiator:getName()
				if type(name)=="string" and name:find('RightHandMan') then
					if not IsGroupActive('RightHandMan') and (not secondManKilled) then
						secondManKilled = true
						mist.removeEventHandler(SecondManEvent)
						SecondManEvent = nil

						trigger.action.outTextForCoalition(2, 'Splash!', 15)
						--mist.respawnGroup('Red SAM SA-3 Fixed Righthand', true)
						bc:addFunds(2, 500)
						
					end
				end
			end
		end
		SecondManEvent = mist.addEventHandler(GeneralDie)
	end,
	canExecute = function()
		if bc:getZoneByName('Krymsk').side ~= 2 then return false end
		if CustomFlags["RightHandMan"] == true then return false end
		
		return true
	end
})

mc:trackMission({
	title = "Kill a high value general",
description = 
[[We have the located a high value target
in the city of Belorechensk, Take him out!.

Coordinates:
MGRS: 37 T EK 68850 58279
Lat Long: N 44°46'28" E 39°52'12"
Lat long Decimal Minutes: N 44°46.475' E 39°52.210'

Elevation: 381 feet

Reward: 500

Destroy the house and whoever is nearby.]],

	messageStart = "New strike mission:Kill a high value general",
	messageEnd = "Strike mission ended: Kill a high value general\n+500 credits",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
	end,
	isActive = function()
		if CustomFlags["RightHandMan"] then return false end
		if Group.getByName('RightHandMan') then return true end
		return false
	end
})

Group.getByName('LefttHandMan'):destroy()
local SecondManEvent = nil
evc:addEvent({
	id='LefttHandMan',
	action = function()
		mist.respawnGroup('LefttHandMan', true)
		
		local LefttHandManKilled = false
		local GeneralDie = function(event)
			if event.id == 30 and event.initiator and event.initiator.getName then
				local name = event.initiator:getName()
				if type(name)=="string" and name:find('LefttHandMan') then
					if not IsGroupActive('LefttHandMan') and (not LefttHandManKilled) then
						LefttHandManKilled = true
						mist.removeEventHandler(SecondManEvent)
						SecondManEvent = nil

						trigger.action.outTextForCoalition(2, 'Splash!\nWait a minute..', 15, true)
						mist.respawnGroup('Red SAM SA-3 Fixed LefttHandMan', true)
						bc:addFunds(2, 500)
						
					end
				end
			end
		end
		SecondManEvent = mist.addEventHandler(GeneralDie)
	end,
	canExecute = function()
		if bc:getZoneByName('Maykop').side ~= 2 then return false end
		if CustomFlags["LefttHandMan"] == true then return false end
		
		return true
	end
})

mc:trackMission({
	title = "Kill a high value general",
description = 
[[We have the located another high value target
in the city of cherkessk, hes probably inside
the building. Take him out!.

Coordinates:
MGRS: 38 T KQ 64147 02594
Lat Long: N 44°14'18" E 42°02'47"
Lat long Decimal Minutes: N 44°14.303' E 42°02.786'

Elevation: 1705 feet

Reward: 500

Destroy the house and whoever is nearby.]],

	messageStart = "New strike mission: Kill a high value general",
	messageEnd = "Strike mission ended: Kill a high value general\n+500 credits",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
	end,
	isActive = function()
		if CustomFlags["LefttHandMan"] then return false end
		if Group.getByName('LefttHandMan') then return true end
		return false
	end
})

--
Group.getByName('StrikeVaziani'):destroy()
local SecondManEvent = nil
evc:addEvent({
	id='StrikeVaziani',
	action = function()
		mist.respawnGroup('StrikeVaziani', true)
		
		local StrikeVazianidestroyed = false
		local GeneralDie = function(event)
			if event.id == 30 and event.initiator and event.initiator.getName then
				local name = event.initiator:getName()
				if type(name)=="string" and name:find('StrikeVaziani') then
					if not IsGroupActive('StrikeVaziani') and (not StrikeVazianidestroyed) then
						StrikeVazianidestroyed = true
						mist.removeEventHandler(SecondManEvent)
						SecondManEvent = nil
						trigger.action.outTextForCoalition(2, 'Splash!', 15, true)					
					end
				end
			end
		end
		SecondManEvent = mist.addEventHandler(GeneralDie)
	end,
	canExecute = function()
		if bc:getZoneByName('Lima').side ~= 2 then return false end
		if CustomFlags["StrikeVaziani"] then return false end
		return true
	end
})

mc:trackMission({
	title = "Strike Vaziani's supply warehouse",
	description = 

[[Strike Vaziani's supply warehouse to cripple the supplies
to their surrounding.

Coordinates:
MGRS: 38 T NM 04080 09769
Lat long: N 41°38'22" E 45°02'56"
Lat long Decimal Minutes: N 41°38.378' E 45°02.939'

Elevation 1465 feet

Reward 1000

2000 Pounds required]],
	messageStart = "New strike mission: Strike Vaziani's supply warehouse\n\nStrike this building to cripple the supplis to the surrounding enemy zones",
	messageEnd = "Strike mission ended: Strike Vaziani's supply warehouse\n\nsupply warehouse is now out of order\n\n+1000 credits",
    startAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "ding.ogg")
        end
    end,
    endAction = function()
         if not missionCompleted and trigger.misc.getUserFlag(180) == 0 then
            trigger.action.outSoundForCoalition(2, "cancel.ogg")
        end
	end,
	reward = 1000,
	isActive = function()
	if CustomFlags["StrikeVaziani"] then return false end
	if Group.getByName('StrikeVaziani') then return true end
	  return false
	end,
})

timer.scheduleFunction(function(_, time)
	if generateCaptureMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 20)

timer.scheduleFunction(function(_, time)
	if generateAttackMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 35)

timer.scheduleFunction(function(_, time)
	if generateSEADMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 55)
timer.scheduleFunction(function(_, time)
	if generateSupplyMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 60)
timer.scheduleFunction(function(_,time)
   if checkAndGenerateCAPMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 60)

mc:init()

----------------------- FLAGS --------------------------

local function checkZoneFlags()

	if zones.kutaisi.side == 1 and not zones.samalpha.active then
        trigger.action.setUserFlag(21, true)	
    end

	if zones.kutaisi.wasBlue then
        trigger.action.setUserFlag(20, true)	
		trigger.action.setUserFlag(21, false)
    end
    if zones.sukhumi.wasBlue and not zones.sochi.wasBlue and not zones.redcarrier.wasBlue and
	not zones.samdelta.active then
        trigger.action.setUserFlag(91, true)
		trigger.action.setUserFlag(21, false)
    end
	if zones.sukhumi.wasBlue and zones.sochi.wasBlue and not zones.redcarrier.wasBlue and 
	not zones.samecho.active then
        trigger.action.setUserFlag(93, true)
		trigger.action.setUserFlag(91, false)
    end
	if zones.sukhumi.wasBlue and zones.redcarrier.wasBlue and not zones.charlie.wasBlue then
		trigger.action.setUserFlag(20, false)
		trigger.action.setUserFlag(91, false)
		trigger.action.setUserFlag(93, false)
        trigger.action.setUserFlag(92, true)
    end
	if zones.sochi.wasBlue and zones.redcarrier.wasBlue and zones.charlie.wasBlue then
		trigger.action.setUserFlag(20, false)
		trigger.action.setUserFlag(91, false)
		trigger.action.setUserFlag(93, false)
        trigger.action.setUserFlag(92, false)
		trigger.action.setUserFlag(94, true)
    end
	if zones.mozdok.wasBlue and zones.beslan.wasBlue and not zones.samkilo.active then
		trigger.action.setUserFlag(94, false)
		trigger.action.setUserFlag(219, true)
    end
	if zones.anapa.wasBlue and zones.krymsk.wasblue and zones.krasnodarc.side == 1 then
		local cap3 = Group.getByName('f4cap3')
		if cap3 and Utils.isGroupActive(cap3) then
		trigger.action.setUserFlag(1, true)
		end
	end
	if zones.anapa.wasBlue and zones.krymsk.wasblue and zones.krasnodarc.wasBlue then
		local cap3 = Group.getByName('f4cap3')
		if cap3 and Utils.isGroupActive(cap3) then
		trigger.action.setUserFlag(1, false)
		trigger.action.setUserFlag(2, true)
		end
	end
	if zones.anapa.wasBlue and zones.krasnodarp.wasBlue and not zones.maykop.wasBlue then
		trigger.action.setUserFlag(3, true)
	end
	if zones.anapa.wasBlue and zones.maykop.wasBlue and not zones.mineralnye.wasBlue then
		trigger.action.setUserFlag(4, true)
		trigger.action.setUserFlag(3, false)
	end
	if zones.mineralnye.wasBlue and not zones.mozdok.wasBlue then
		trigger.action.setUserFlag(7, true)
		trigger.action.setUserFlag(4, false)
	end
	if zones.mineralnye.wasBlue and zones.mozdok.wasBlue then
		trigger.action.setUserFlag(465, true)
	end
	if zones.mineralnye.wasBlue then
		local cap4 = Group.getByName('f4cap4')
		if cap4 and Utils.isGroupActive(cap4) then
		trigger.action.setUserFlag(24, true)
		end
	end
	if trigger.misc.getUserFlag("cap") == 1 then
	  if not anyGroupAlive("f16cap") then
		destroyF16capGroups()
	  trigger.action.setUserFlag("cap", false)
	  end
	end

	if trigger.misc.getUserFlag("cas") == 1 then
	  if not anyGroupAlive("cas") then
		destroyCasGroups()
		trigger.action.setUserFlag("cas", false)
	  end
	end

	if trigger.misc.getUserFlag("decoy") == 1 then
	  if not anyGroupAlive("decoy") then
		destroydecoyGroups()
		trigger.action.setUserFlag("decoy", false)
	  end
	end

	if trigger.misc.getUserFlag("sead") == 1 then
	  if not anyGroupAlive("sead") then
		destroySeadGroups()
		trigger.action.setUserFlag("sead", false)
	  end
	end
end
timer.scheduleFunction(function()
    checkZoneFlags()
    return timer.getTime() + 30
end, {}, timer.getTime() + 2)

----------------------- END OF FLAGS --------------------------

env.info("Mission Setup : is completed!")