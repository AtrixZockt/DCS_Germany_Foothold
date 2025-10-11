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

-- DAtabases
upgrades = {
    test = {
		blue = {'blueInfantry', 'blueArmor'},
		red = {'redInfantry1', 'Red Tanks', 'Red armoured group 1', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-15'}
	},
	hamburg = {
		blue = {'BLUE EWR HAMBURG FIXED', 'blueInfantry', 'blueArmor', 'BLUE SAM HAWK HAMBURG', 'BLUE SAM MASAMS HAMBURG'},
		red = {}
	},
	airfield1 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry1', 'Red SAM AAA', 'Red SAM AAA group 2', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-19 group 2', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 group 2'}
	},
	airfield2 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry1', 'Red SAM AAA', 'Red SAM AAA group 2', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 group 2', 'Red SAM SHORAD SA-8'}
	},
	airfield3 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD2'},
		red = {'redInfantry2', 'Red Tanks', 'Red armoured group 1', 'Red SAM AAA', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 group 2'}
	},
	airfield4 = {
		blue = {'blueInfantry','blueArmor', 'bluePD2'},
		red = {'redInfantry2', 'Red SAM AAA', 'Red SAM AAA group 2', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 group 2'}
	},
	Frankfurt = {
		blue = {'blueInfantry','blueArmor', 'bluePD2'},
		red = {'RED SA11 FRANKFURT FIXED', 'RED Armoured-1 FRANKFURT FIXED', 'RED AA FRANKFURT FIXED', 'RED EWR FRANKFURT FIXED', 'RED INF FRANKFURT FIXED-1', 'RED Bunker FRANKFURT FIXED', 'RED Armoured-2 FRANKFURT FIXED', 'Red Tanks', 'Red SAM AAA'}
	},
	farp1 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry1','Red Tanks', 'Red armoured group 1','Red SAM AAA','Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-8', 'Red SAM AAA group 2'}
	},
	farp2 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'redInfantry1', 'Red Tanks', 'Red armoured group 1', 'Red SAM SHORAD SA-19', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 group 2', 'Red SAM SHORAD SA-15'}
	},
	farp3 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD1'},
		red = {'Red Tanks', 'Red armoured group 1', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-15', 'Red SAM SHORAD SA-15 group 2'}
	},
	farp4 = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD2'},
		red = {'redInfantry2', 'Red armoured group 2', 'Red armoured group 3', 'Red SAM SHORAD SA-8', 'Red SAM SHORAD SA-8 group 2'}
	},
	QuarryFixed = {
		blue = {'blueInfantry', 'blueArmor', 'bluePD2'},
		red = {'RED HQ Building Quarry', 'Red SAM SA19 Quarry', 'RED Fueldepot Quarry', 'RED Workshop Quarry', 'Red AAA Quarry', 'Red armoured Quarry', 'Red Inf Quarry'}
	},
	SAMLiebenau = {
		blue = {},
		red = {'Red SAM SA11 Liebenau', 'Red SAM SA15 Liebenau'}
	},
	SAMPadaborn = {
		blue = {},
		red = {'Red SAM SA5 Paderborn', 'Red SAM Paderborn Inf'}
	},
	SAMFrielendorf = {
		blue = {},
		red = {'Red SAM SA2 Frielendorf', 'Red SAM SA19 Frielendorf'}
	},
	Hidden1Group = {
		blue = {},
		red = {'HQ Fixed', 'Red EWR Fixed 1', 'Red EWR Fixed 3', 'Red EWR Fixed 2', 'Red EWR 4 Fixed'}
	}
}

flavor = {
    test = 'WPT 2\n',
	Hamburg = 'WPT 1\n',
	Hamburg_FARP = 'WPT 2\n',
	Luneburg = 'WPT 3\n',
	Rotenburg_Farp = 'WPT 4\n',
	Bremen = 'WPT 5\n',
	Fassberg = 'WPT 6\n',
	Northeim = 'WPT 7\n',
	Hannover = 'WPT 10\n',
	SAM_Liebenau = 'WPT 11\n',
	Braunschweig = 'WPT 9\n',
	Hameln_FARP = 'WPT 12\n',
	Gutersloh = 'WPT 14\n',
	Obermehler_Schlotheim = 'WPT 16\n',
	Fritzlar = 'WPT 17\n',
	Laubach_FARP = 'WPT 19\n',
	Frankfurt = 'WPT 20\n',
	Quarry = 'WPT 13\n',
	SAM_Paderborn = 'WPT 15\n',
	SAM_Frielendorf = 'WPT 18\n',
	Parsau_FARP = 'WPT 8\n'
}

WaypointList = {
	Hamburg = ' (1)',
	Hamburg_FARP = ' (2)',
	Luneburg = ' (3)',
	Rotenburg_Farp = ' (4)',
	Bremen = ' (5)',
	Fassberg = ' (6)',
	Northeim = ' (7)',
	Hannover = ' (10)',
	SAM_Liebenau = ' (11)',
	Braunschweig = ' (9)',
	Hameln_FARP = ' (12)',
	Gutersloh = ' (14)',
	Obermehler_Schlotheim = ' (16)',
	Fritzlar = ' (17)',
	Laubach_FARP = ' (19)',
	Frankfurt = ' (20)',
	Quarry = ' (13)',
	SAM_Paderborn = ' (15)',
	SAM_Frielendorf = ' (18)',
	Parsau_FARP = ' (8)'
}

-- Zones
zones = {
    Hamburg = ZoneCommander:new({zone='Hamburg', side=2, level=20, upgrades=upgrades.hamburg, crates={}, flavorText=flavor.Hamburg}),
    Luneburg = ZoneCommander:new({zone='Luneburg', side=1, level=7, upgrades=upgrades.airfield1, crates={}, flavorText=flavor.Luneburg}),
    Bremen = ZoneCommander:new({zone='Bremen', side=1, level=20, upgrades=upgrades.airfield3, crates={}, flavorText=flavor.Bremen}),
    Fassberg = ZoneCommander:new({zone='Fassberg', side=1, level=20, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.Fassberg}),
	Northeim = ZoneCommander:new({zone='Northeim', side=1, level=12, upgrades=upgrades.airfield1, crates={}, flavorText=flavor.Northeim}),
    Hannover = ZoneCommander:new({zone='Hannover', side=1, level=20, upgrades=upgrades.airfield4, crates={}, flavorText=flavor.Hannover}),
    Braunschweig = ZoneCommander:new({zone='Braunschweig', side=1, level=7, upgrades=upgrades.airfield1, crates={}, flavorText=flavor.Braunschweig}),
    Gutersloh = ZoneCommander:new({zone='Gutersloh', side=1, level=20, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.Gutersloh}),
    Obermehler_Schlotheim = ZoneCommander:new({zone='Obermehler_Schlotheim', side=1, level=20, upgrades=upgrades.airfield3, crates={}, flavorText=flavor.Obermehler_Schlotheim}),
    Fritzlar = ZoneCommander:new({zone='Fritzlar', side=1, level=20, upgrades=upgrades.airfield2, crates={}, flavorText=flavor.Fritzlar}),
	Frankfurt = ZoneCommander:new({zone='Frankfurt', side=1, level=20, upgrades=upgrades.Frankfurt, crates={}, flavorText=flavor.Frankfurt}),
    
    Hamburg_FARP = ZoneCommander:new({zone='Hamburg_FARP', side=0, level=7, upgrades=upgrades.farp3, crates={}, flavorText=flavor.Hamburg_FARP}),
	Rotenburg_Farp = ZoneCommander:new({zone='Rotenburg Farp', side=1, level=7, upgrades=upgrades.farp1, crates={}, flavorText=flavor.Rotenburg_Farp}),
    Laubach_FARP = ZoneCommander:new({zone='Laubach FARP', side=1, level=20, upgrades=upgrades.farp4, crates={}, flavorText=flavor.Laubach_FARP}),
	Parsau_FARP = ZoneCommander:new({zone='Parsau FARP', side=1, level=20, upgrades=upgrades.farp2, crates={}, flavorText=flavor.Parsau_FARP}),
	Hameln_FARP = ZoneCommander:new({zone='Hameln FARP', side=1, level=7, upgrades=upgrades.farp3, crates={}, flavorText=flavor.Hameln_FARP}),
    
	Quarry = ZoneCommander:new({zone='Quarry', side=1, level=20, upgrades=upgrades.QuarryFixed, crates={}, flavorText=flavor.Quarry}),

	SAM_Liebenau = ZoneCommander:new({zone='SAM Liebenau', side=1, level=20, upgrades=upgrades.SAMLiebenau, crates={}, flavorText=flavor.SAM_Liebenau}),
	SAM_Paderborn = ZoneCommander:new({zone='SAM Paderborn', side=1, level=20, upgrades=upgrades.SAMPadaborn, crates={}, flavorText=flavor.SAM_Paderborn}),
	SAM_Frielendorf = ZoneCommander:new({zone='SAM Frielendorf', side=1, level=20, upgrades=upgrades.SAMFrielendorf, crates={}, flavorText=flavor.SAM_Frielendorf}),

	hidden1 = ZoneCommander:new({zone='Hidden1', side=1, level=20, upgrades=upgrades.Hidden1Group, crates={}, flavorText=flavor.hidden1})
}

-- Spawn bases
zones.Hamburg.isHeloSpawn = true
zones.Hamburg_FARP.isHeloSpawn = true
zones.Luneburg.isHeloSpawn = true
zones.Rotenburg_Farp.isHeloSpawn = true
zones.Bremen.isHeloSpawn = true
zones.Fassberg.isHeloSpawn = true
zones.Northeim.isHeloSpawn = true
zones.Hannover.isHeloSpawn = true
zones.Braunschweig.isHeloSpawn = true
zones.Hameln_FARP.isHeloSpawn = true
zones.Gutersloh.isHeloSpawn = true
zones.Obermehler_Schlotheim.isHeloSpawn = true
zones.Fritzlar.isHeloSpawn = true
zones.Laubach_FARP.isHeloSpawn = true
zones.Frankfurt.isHeloSpawn = true
zones.Parsau_FARP.isHeloSpawn = true


-- AirBase names
zones.Hamburg.airbaseName = 'Hamburg'
zones.Luneburg.airbaseName = 'Luneburg'
zones.Bremen.airbaseName = 'Bremen'
zones.Fassberg.airbaseName = 'Fassberg'
zones.Northeim.airbaseName = 'Northeim'
zones.Hannover.airbaseName = 'Hannover'
zones.Braunschweig.airbaseName = 'Braunschweig'
zones.Gutersloh.airbaseName = 'Gutersloh'
zones.Obermehler_Schlotheim.airbaseName = 'Obermehler_Schlotheim'
zones.Fritzlar.airbaseName = 'Fritzlar'
zones.Frankfurt.airbaseName = 'Frankfurt'

-- FARP Zones
zones.Hamburg_FARP.airbaseName = 'Hamburg FARP'
zones.Rotenburg_Farp.airbaseName = 'Rotenburg Farp'
zones.Parsau_FARP.airbaseName = 'Parsau FARP'
zones.Hameln_FARP.airbaseName = 'Hameln FARP'
zones.Laubach_FARP.airbaseName = 'Laubach FARP'

-- Groups
zones.Hamburg:addGroups({
	GroupCommander:new({name='Hamburg-Supply-Hamburg_Farp-Blue', mission='supply', targetzone='Hamburg_FARP'}),
	GroupCommander:new({name='Hamburg-Supply-Luneburg-Blue', mission='supply', targetzone='Luneburg'}),
	GroupCommander:new({name='Hamburg-patrol-Luneburg-Blue', mission='patrol', MissionType='CAP', targetzone='Luneburg', urgent = true}),
	GroupCommander:new({name='Hamburg-patrol-Bremen-Blue', mission='patrol', MissionType='CAP', targetzone='Hamburg_FARP', urgent = true})
})
zones.Hamburg_FARP:addGroups({
	GroupCommander:new({name='Hamburg_Farp-Supply-Luneburg-Blue', mission= 'supply', targetzone='Luneburg'}),
	GroupCommander:new({name='Hamburg_Farp-Supply-Rotenburg_Farp-Blue', mission='supply', targetzone='Rotenburg Farp'})
})
zones.Rotenburg_Farp:addGroups({
	GroupCommander:new({name='Rotenburg_Farp-supply-Bremen-Blue', mission = 'supply', targetzone='Bremen'}),
	GroupCommander:new({name='Rotenburg_Farp-supply-Luneburg', mission='supply', targetzone='Luneburg'}),
	GroupCommander:new({name='Rotenburg_Farp-supply-Bremen', mission='supply', targetzone='Bremen'})
})
zones.Luneburg:addGroups({
	GroupCommander:new({name='Luneburg-supply-Fassberg-blue', mission='supply', targetzone='Fassberg'}),
	GroupCommander:new({name='Luneburg-supply-Northeim-blue', mission='supply', targetzone='Northeim'})
})
zones.Bremen:addGroups({
	GroupCommander:new({name='Bremen-attack-rotenburg_farp', mission='attack', targetzone='Rotenburg Farp'}),
	GroupCommander:new({name='Bremen-supply-rotenburg_farp', mission='supply', targetzone='Rotenburg Farp'}),
	GroupCommander:new({name='Bremen-partol-Rotenburg_Farp', mission='patrol', MissionType='CAP', targetzone='Rotenburg_Farp'}),
	GroupCommander:new({name='Bremen-partol-Hannover', mission='patrol', MissionType='CAP', targetzone='Hannover'}),
	GroupCommander:new({name='Bremen-Supply-Hannover-blue', mission='supply', targetzone='Hannover'}),
	GroupCommander:new({name='Bremen-partol-Fassburg_blue', mission='patrol', MissionType='CAP', targetzone='Luneburg'}),
	GroupCommander:new({name='Bremen-partol-Hannover_blue-1', mission='patrol', MissionType='CAP', targetzone='Hannover'})
})
zones.Fassberg:addGroups({
	GroupCommander:new({name='Fassberg-supply-Bremen', mission='supply', targetzone='Bremen'}),
	GroupCommander:new({name='Fassberg-supply-Northeim', mission='supply', targetzone='Northeim'}),
	GroupCommander:new({name='Fassberg-supply-Hannover-blue', mission='supply', targetzone='Hannover'})
})
zones.Northeim:addGroups({
	GroupCommander:new({name='Northeim-supply-Fassberg', mission='supply', targetzone='Fassberg'}),
	GroupCommander:new({name='Northeim-attack-Fassberg', mission='attack', targetzone='Fassberg'}),
	GroupCommander:new({name='Northeim-supply-Parsau_Farp-blue', mission='supply', targetzone='Parsau FARP'})
})
zones.Parsau_FARP:addGroups({
	GroupCommander:new({name='Parsau_FARP-supply-Fassberg', mission='supply', targetzone='Fassberg'}),
	GroupCommander:new({name='Parsau_FARP-supply-Northeim', mission='supply', targetzone='Northeim'}),
	GroupCommander:new({name='Parsau_FARP-supply-Braunschweig', mission='supply', targetzone='Braunschweig'}),
	GroupCommander:new({name='Parsau_FARP-supply-Braunschweig-blue', mission='supply', targetzone='Braunschweig'})
})
zones.Braunschweig:addGroups({
	GroupCommander:new({name='Braunschweig-supply-Parsau_farp', mission='supply', targetzone='Parsau FARP'}),
	GroupCommander:new({name='Braunschweig-supply-Hannover', mission='supply', targetzone='Hannover'}),
	GroupCommander:new({name='Braunschweig-attack-Northeim', mission='attack', targetzone='Northeim'}),
	GroupCommander:new({name='Braunschweig-supply-Parsau_Farp-blue', mission='supply', targetzone='Parsau FARP'}),
	GroupCommander:new({name='Braunschweig-supply-Hannover-blue', mission='supply', targetzone='Hannover'}),
	GroupCommander:new({name='Braunschweig-supply-Quarry-Blue', mission='supply', targetzone='Quarry', urgent = zones.Quarry.side == 0})
})
zones.Hannover:addGroups({
	GroupCommander:new({name='Hannover-supply-Bremen', mission='supply', targetzone='Bremen', urgent = zones.Bremen.side == 0}),
	GroupCommander:new({name='Hannover-supply-Braunschweig', mission='supply', targetzone='Braunschweig'}),
	GroupCommander:new({name='Hannover-Patrol-Northeim', mission='patrol', MissionType='CAP', targetzone='Northeim'}),
	GroupCommander:new({name='Hannover-Attack-Braunschweig', mission='attack', targetzone='Braunschweig'}),
	GroupCommander:new({name='Hannover-attack-bremen', mission='attack', targetzone='Bremen'}),
	GroupCommander:new({name='Hannover-supply-Fassberg', mission='supply', targetzone='Fassberg'}),
	GroupCommander:new({name='Hannover-attack-sead-Bremen', mission='attack', targetzone='Bremen'}),
	GroupCommander:new({name='Hannover-supply-SAM_Liebenau', mission='supply', targetzone='SAM Liebenau', type='surface', spawnDelayFactor = 1.4}),
	GroupCommander:new({name='Hannover-patrol-quarry', mission='patrol', MissionType='CAP', targetzone='Quarry'}),
	GroupCommander:new({name='Hannover-supply-Hameln_FARP', mission='supply', targetzone='Hameln FARP'}),
	GroupCommander:new({name='Hannover-supply-Hameln_farp_blue', mission='supply', targetzone='Hameln FARP', urgent = zones.Hameln_FARP.side == 0}),
	GroupCommander:new({name='Hannover-supply-Gutersloh-blue', mission='supply', targetzone='Gutersloh', urgent= zones.Gutersloh.side == 0})
})
zones.Hameln_FARP:addGroups({
	GroupCommander:new({name='Hameln_Farp-supply-Hannover', mission='supply', targetzone='Hannover'}),
	GroupCommander:new({name='Hameln_FARP-supply-Gutersloh', mission='supply', targetzone='Gutersloh'})
})
zones.Gutersloh:addGroups({
	GroupCommander:new({name='Gutersloh-supply-sam_paderborn', mission='supply', targetzone='SAM Paderborn'}),
	GroupCommander:new({name='Gutersloh-supply-Hameln_FARP', mission='supply', targetzone='Hameln FARP'}),
	GroupCommander:new({name='Gutersloh-attack-Hameln_FARP', mission='attack', targetzone='Hameln FARP'})
})
zones.Quarry:addGroups({
	GroupCommander:new({name='Quarry-supply-Obermehler-blue', mission='supply', targetzone='Obermehler_Schlotheim', urgent = zones.Obermehler_Schlotheim.side == 0})
})
zones.Obermehler_Schlotheim:addGroups({
	GroupCommander:new({name='Obermehler-supply-fritzlar-blue', mission='supply', targetzone='Fritzlar', urgent = zones.Fritzlar.side == 0}),
	GroupCommander:new({name='Obermehler-supply-quarry', mission='supply', targetzone='Quarry'})
})
zones.Fritzlar:addGroups({
	GroupCommander:new({name='Fritzlar-supply-obermehler', mission='supply', targetzone='Obermehler_Schlotheim'}),
	GroupCommander:new({name='Fritzlar-attack-Obermehler', mission='attack', targetzone='Obermehler_Schlotheim'}),
	GroupCommander:new({name='Fritzlar-supply-SAM_Frielendorf', mission='supply', targetzone='SAM Frielendorf'}),
	GroupCommander:new({name='Fritzlar-supply-Laubach_FARP-blue', mission='supply', targetzone='Laubach FARP', urgent = zones.Laubach_FARP.side == 0}),
	GroupCommander:new({name='Fritzlar-supply-Frankfurt-blue', mission='supply', targetzone='Frankfurt', urgent = zones.Frankfurt.side == 0})
})
zones.Laubach_FARP:addGroups({
	GroupCommander:new({name='Laubach_FARP-supply-Fritzlar', mission='supply', targetzone='Fritzlar'}),
	GroupCommander:new({name='Laubach_FARP-attack-Fritzlar', mission='attack', targetzone='Fritzlar'}),
	GroupCommander:new({name='Lauchbar_FARP-supply-Frankfurt', mission='supply', targetzone='Frankfurt'}),
	GroupCommander:new({name='Laubach_FARP-supply-Frankfurt-blue', mission='supply', targetzone='Frankfurt'})
})
zones.Frankfurt:addGroups({
	GroupCommander:new({name='Frankfurt-patrol-Obermehler', mission='patrol', MissionType='CAP', targetzone='Obermehler_Schlotheim'}),
	GroupCommander:new({name='Frankfurt-patrol-Gutersloh', mission='patrol', MissionType='CAP', targetzone='Gutersloh'}),
	GroupCommander:new({name='Frankfurt-patrol-Fritzlar', mission='patrol', MissionType='CAP', targetzone='Fritzlar'}),
	GroupCommander:new({name='Frankfurt-attack-Fritzlar', mission='attack', targetzone='Fritzlar'}),
	GroupCommander:new({name='frankfurt-attack-sead-Fritzlar', mission='attack', targetzone='Fritzlar'}),
	GroupCommander:new({name='Frankfurt-attack-Gutersloh', mission='attack', targetzone='Gutersloh'}),
	GroupCommander:new({name='Frankfurt-attack-Gutersloh-1', mission='attack', targetzone='Gutersloh'}),
	GroupCommander:new({name='Frankfurt-supply-Laubach', mission='supply', targetzone='Laubach FARP'}),
	GroupCommander:new({name='Frankfurt-supply-Gutersloh', mission='supply', targetzone='Gutersloh'}),
	GroupCommander:new({name='Frankfurt-attack-laubach', mission='attack', targetzone='Laubach FARP'})
})

function SpawnFriendlyAssets()
	if not CustomFlags[1] then
		zones.hidden1:MakeRedZoneUpgraded()
		CustomFlags[1] = true
	end
end
mist.scheduleFunction(SpawnFriendlyAssets, {}, timer.getTime() + 8)

-- Battlecommander
local filepath = 'DiGii_FootHold_GCW_v0.1.lua'
if lfs then 
	local dir = lfs.writedir()..'Missions/Saves/'
	lfs.mkdir(dir)
	filepath = dir..filepath
	env.info('Foothold - Save file path: '..filepath)
end
bc = BattleCommander:new(filepath, 10, 60)

-- Add all zones to the BattleCommander
for i,v in pairs(zones) do
	bc:addZone(v)

	if not string.find(v.zone, 'SAM') then
		v:registerTrigger('lost', DynamicTasking:GenerateCaptureMission(v), 'zonelost')
	end
end

-- Add connections
bc:addConnection("Hamburg","Hamburg_FARP")
bc:addConnection("Hamburg","Luneburg")
bc:addConnection("Hamburg_FARP","Luneburg")
bc:addConnection("Hamburg_FARP","Rotenburg Farp")
bc:addConnection("Luneburg","Rotenburg Farp")
bc:addConnection("Rotenburg Farp","Bremen")
bc:addConnection("Rotenburg Farp","Fassberg")
bc:addConnection("Bremen","Fassberg")
bc:addConnection("Luneburg","Northeim")
bc:addConnection("Fassberg","Northeim")
bc:addConnection("Fassberg","Hannover")
bc:addConnection("Northeim","Parsau FARP")
bc:addConnection("Parsau FARP","Braunschweig")
bc:addConnection("Braunschweig","Hannover")
bc:addConnection("Hannover", "Hameln FARP")
bc:addConnection("Hannover", "SAM Liebenau")
bc:addConnection("Braunschweig", "Quarry")
bc:addConnection("Hameln FARP", "Quarry")
bc:addConnection("Hameln FARP", "Gutersloh")
bc:addConnection("Hannover", "Gutersloh")
bc:addConnection("Gutersloh", "SAM Paderborn")
bc:addConnection("Quarry", "Obermehler_Schlotheim")
bc:addConnection("Obermehler_Schlotheim", "Fritzlar")
bc:addConnection("Gutersloh", "Fritzlar")
bc:addConnection("Fritzlar", "SAM Frielendorf")
bc:addConnection("Fritzlar", "Laubach FARP")
bc:addConnection("Obermehler_Schlotheim", "Laubach FARP")
bc:addConnection("Laubach FARP", "Frankfurt")
bc:addConnection("Fritzlar", "Frankfurt")
bc:addConnection("Gutersloh", "Frankfurt")

zones.SAM_Paderborn:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesampaderborn')

zones.SAM_Liebenau:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesamLiebenau')

zones.SAM_Frielendorf:registerTrigger('lost', function(event, sender) 
	sender:disableZone()
	bc:addFunds(2,200)
	trigger.action.outTextForCoalition(2,'Enemey SAM destroyed\n+200 credits',20)
end, 'disablesamFrielendorf')


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


-- SHOP
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
bc:registerShopItem('cap', 'CAP', 500, function(sender)
        local grname = 'f4cap1'
	if not zones.Hannover.wasBlue and zones.Bremen.wasBlue and not zones.Obermehler_Schlotheim.wasBlue then
		grname = 'f4cap2'
	elseif zones.Obermehler_Schlotheim.wasBlue and zones.Gutersloh.wasBlue and not zones.Fritzlar.wasBlue then
		grname = 'f4cap3'
	elseif (zones.Fritzlar.wasBlue and zones.Obermehler_Schlotheim.wasBlue) then
		grname = 'f4cap4'
	end


        local gr = Group.getByName(grname)
        if Utils.isGroupActive(gr) then
            return 'CAP mission still in progress'
        end

        mist.respawnGroup(grname, true)
    end, 
    function(sender, params)
        local grname = 'f4cap1'
	if not zones.Hannover.wasBlue and zones.Bremen.wasBlue and not zones.Obermehler_Schlotheim.wasBlue then
		grname = 'f4cap2'
	elseif zones.Obermehler_Schlotheim.wasBlue and zones.Gutersloh.wasBlue and not zones.Fritzlar.wasBlue then
		grname = 'f4cap3'    
	elseif (zones.Fritzlar.wasBlue and zones.Obermehler_Schlotheim.wasBlue) then
		grname = 'f4cap4'
	end

        local gr = Group.getByName(grname)
        if Utils.isGroupActive(gr) then
            return 'CAP mission still in progress'
        end

        mist.respawnGroup(grname, true)
    end
)

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
  ---
  ---
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

local seadTargetMenu = nil

Group.getByName('sead1'):destroy()
Group.getByName('sead2'):destroy()
Group.getByName('sead3'):destroy()
Group.getByName('sead4'):destroy()

bc:registerShopItem('sead', 'SU-17 SEAD mission', 250, function(sender)
    local grname = 'sead1'
	if not zones.Hannover.wasBlue and zones.Bremen.wasBlue and not zones.Obermehler_Schlotheim.wasBlue then
		grname = 'sead2'
	elseif zones.Obermehler_Schlotheim.wasBlue and zones.Gutersloh.wasBlue and not zones.Fritzlar.wasBlue then
		grname = 'sead3'    
	elseif (zones.Fritzlar.wasBlue and zones.Obermehler_Schlotheim.wasBlue) then
		grname = 'sead4'
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
	if not zones.Hannover.wasBlue and zones.Bremen.wasBlue and not zones.Obermehler_Schlotheim.wasBlue then
		grname = 'sead2'
	elseif zones.Obermehler_Schlotheim.wasBlue and zones.Gutersloh.wasBlue and not zones.Fritzlar.wasBlue then
		grname = 'sead3'    
	elseif (zones.Fritzlar.wasBlue and zones.Obermehler_Schlotheim.wasBlue) then
		grname = 'sead4'
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

local intelMenu=nil
bc:registerShopItem('intel','Intel on enemy zone',0,function(sender)
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

bc:addShopItem(2, 'capture', -1)
bc:addShopItem(2, 'cap', -1)
bc:addShopItem(2, 'sead', -1)
bc:addShopItem(2, '9lineam', -1)
bc:addShopItem(2, '9linefm', -1)
bc:addShopItem(2, 'smoke', -1)
bc:addShopItem(2, 'supplies', -1)
bc:addShopItem(2, 'supplies2', -1)
bc:addShopItem(2, 'intel', -1)
---
-- Supply zones
supplyZones = {
	'Hamburg',
	'Hamburg_FARP',
	'Luneburg',
	'Rotenburg_FARP',
	'Bremen',
	'Fassberg',
	'Northeim',
	'Parsau_FARP',
	'Braunschweig',
	'Hannover',
	'Hamlen_FARP',
	'Gutersloh',
	'Quarry',
	'Obermehler_Schlotheim',
	'Fritzlar',
	'Luabach_FARP',
	'Frankfurt'
}

lc = LogisticCommander:new({battleCommander = bc, supplyZones = supplyZones})
lc:init()

bc:loadFromDisk() --will load and overwrite default zone levels, sides, funds and available shop items
bc:init()
bc:startRewardPlayerContribution(15,{infantry = 10, ground = 10, sam = 30, airplane = 30, structure = 30, ship = 250, helicopter=30, crate=200, rescue = 100})

DynamicTasking:Start()

GlobalSettings.defaultRespawns[1]['supply'] = { dead=60*60, hangar=30*60, preparing=5*60}
GlobalSettings.setDifficultyScaling(1.4,1)


evc = EventCommander:new({ decissionFrequency=30*60, decissionVariance=30*60, skipChance = 10})
evc:init()

--- Mission Commander
mc = MissionCommander:new({side = 2, battleCommander = bc, checkFrequency = 60})

function generateAttackMission()
    if missionCompleted then return end
    
    local validzones = {}
    for _, v in ipairs(bc.connections) do
        local to = bc:getZoneByName(v.to)
        local from = bc:getZoneByName(v.from)
        local function checkValid(zone)
            local lname = zone.zone:lower()
            return zone.side == 1 and zone.active and not lname:find('sam') and not lname:find('defence')
        end
        if from.side ~= to.side and from.side ~= 0 and to.side ~= 0 then
            if checkValid(from) then table.insert(validzones, from) end
            if checkValid(to) then table.insert(validzones, to) end
        end
    end

    if #validzones == 0 then return end

    local missionGenerated = false

    -- Attempt to generate a standard A2G mission
    do
        local zoneToTask = validzones[math.random(1, #validzones)]
        if DynamicTasking:GenerateA2GMissionForZone(zoneToTask) then
            trigger.action.outText("New Ground Attack Mission available at " .. zoneToTask.zone, 15)
            missionGenerated = true
        end
    end

    -- Attempt to generate a Runway Attack mission
    do
        -- Define all possible enemy airbases
        local runwayAttackCandidates = { "Frankfurt", "Luneburg", "Bremen", "Fassberg", "Northeim", "Hannover", "Braunschweig", "Gutersloh", "Obermehler_Schlotheim", "Fritzlar" }
        local validRunwayTargets = {}

        -- Find frontline zones (where blue and red zones are connected)
        local frontlineZones = {}
        for _, connection in ipairs(bc.connections) do
            local fromZone = bc:getZoneByName(connection.from)
            local toZone = bc:getZoneByName(connection.to)
            if fromZone and toZone and fromZone.side ~= toZone.side and fromZone.side ~= 0 and toZone.side ~= 0 then
                table.insert(frontlineZones, fromZone.side == 2 and fromZone or toZone)
            end
        end

        -- Only proceed if we have a frontline
        if #frontlineZones > 0 then
            -- Filter runway candidates to be RED controlled and near the frontline
            for _, airbaseName in ipairs(runwayAttackCandidates) do
                local zone = bc:getZoneByName(airbaseName)
                if zone and zone.side == 1 then -- Check if the airbase zone is RED
                    local airbaseCoord = ZONE:FindByName(zone.zone):GetCoordinate() -- Use the already fetched zone object
                    for _, frontlineZone in ipairs(frontlineZones) do
                        if airbaseCoord:Get2DDistance(ZONE:FindByName(frontlineZone.zone):GetCoordinate()) < 150000 then -- 150km from frontline
                            table.insert(validRunwayTargets, airbaseName)
                            break -- Add only once and move to the next candidate
                        end
                    end
                end
            end
        end

        if #validRunwayTargets > 0 then
            local targetAirbaseName = validRunwayTargets[math.random(1, #validRunwayTargets)]
            -- The GenerateRunwayAttackMission function now handles the logic to prevent duplicates.
            if DynamicTasking:GenerateRunwayAttackMission(targetAirbaseName, 3) then
                missionGenerated = true
            end
        end
    end

    return missionGenerated
end

-- Schedule the A2G mission generation
timer.scheduleFunction(function(_, time)
    if missionCompleted == false and generateAttackMission() then
        return time + math.random(300, 600) -- Generate a mission every 5-10 minutes
    else
        return time + 120
    end
end, {}, timer.getTime() + 20)

mc:init()
