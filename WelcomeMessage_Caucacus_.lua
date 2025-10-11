BASE:I("Loading Leka's special all in one script handler")

-- This script handles Welcome messages, Callsign assigement, Escort, Missle tracking, Radio menu for ATIS and getting closest Airbase.

-- This script needs cuople of things, Static unit called EventMan and the carrier named CVN-72 or change those names bellow,
-- most importantly it needs Moose.

static = STATIC:FindByName("EventMan", true)


local atisZones = {
    ["Kutaisi"] = {airbaseName = AIRBASE.Caucasus.Kutaisi},
    ["Maykop"] = {airbaseName = AIRBASE.Caucasus.Maykop_Khanskaya},
    ["Anapa"] = {airbaseName = AIRBASE.Caucasus.Anapa_Vityazevo},
    ["Mozdok"] = {airbaseName = AIRBASE.Caucasus.Mozdok},
    ["Sochi"] = {airbaseName = AIRBASE.Caucasus.Sochi_Adler},
    ["Senaki"] = {airbaseName = AIRBASE.Caucasus.Senaki_Kolkhi},
	["Kobuleti"] = {airbaseName = AIRBASE.Caucasus.Kobuleti},
	["Mineralnye"] = {airbaseName = AIRBASE.Caucasus.Mineralnye_Vody},
	["Sukhumi"] = {airbaseName = AIRBASE.Caucasus.Sukhumi_Babushara},
	["Gudauta"] = {airbaseName = AIRBASE.Caucasus.Gudauta},
	["Krymsk"] = {airbaseName = AIRBASE.Caucasus.Krymsk},
	["Batumi"] = {airbaseName = AIRBASE.Caucasus.Batumi},
	["Krasnodar-Center"] = {airbaseName = AIRBASE.Caucasus.Krasnodar_Center},
	["Krasnodar-Pashkovsky"] = {airbaseName = AIRBASE.Caucasus.Krasnodar_Pashkovsky},
	["Soganlug"] = {airbaseName = AIRBASE.Caucasus.Soganlug},
	["Nalchik"] = {airbaseName = AIRBASE.Caucasus.Nalchik},
	["Beslan"] = {airbaseName = AIRBASE.Caucasus.Beslan},
	["Novorossiysk"] = {airbaseName = AIRBASE.Caucasus.Novorossiysk},
	["Gelendzhik"] = {airbaseName = AIRBASE.Caucasus.Gelendzhik},
    ["Vaziani"] = {airbaseName = AIRBASE.Caucasus.Vaziani}
}

local atisZoneNames = {
    ["Sochi-Adler"] = {airbaseName = AIRBASE.Caucasus.Sochi_Adler},
    ["Maykop-Khanskaya"] = {airbaseName = AIRBASE.Caucasus.Maykop_Khanskaya},
    ["Anapa-Vityazevo"] = {airbaseName = AIRBASE.Caucasus.Anapa_Vityazevo},
    ["Senaki-Kolkhi"] = {airbaseName = AIRBASE.Caucasus.Senaki_Kolkhi},
	["Mineralnye Vody"] = {airbaseName = AIRBASE.Caucasus.Mineralnye_Vody},
	["Sukhumi-Babushara"] = {airbaseName = AIRBASE.Caucasus.Sukhumi_Babushara},
	["Tbilisi-Lochini"] = {airbaseName = AIRBASE.Caucasus.Tbilisi_Lochini}
}

-- Define all zones
local allZones = {
    "Kutaisi", "Maykop", "Red Carrier", "Blue Carrier", "Anapa", "Mozdok", "Sochi", "Mineralnye",
    "Batumi", "Kobuleti", "Senaki", "Sukhumi", "Gudauta", "Gelendzhik", "Novorossiysk", "Krymsk",
    "Krasnodar-Center", "Krasnodar-Pashkovsky", "Nalchik", "Beslan", "Soganlug", "Tbilisi", "Vaziani",
    "Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "India", "Juliett",
    "Kilo", "Lima"
}
airbaseStatics = {
	["Alpha"] = {"Farpalphaammo", "Farpalphafuel", "Farpalphatent1", "Farpalphatent2", "Farpalphatent3", "Farpalphatent4", "Farpalphacommand", "Farpalphawind"},
    ["Bravo"] = {"Farbravoammo", "Farpbravofuel", "Farpbravotent1", "Farpbravotent2", "Farpbravotent3", "Farpbravotent4", "Farpbravocommand", "Farpbravowind"},
    ["Charlie"] = {"Farpcharliammo", "Farpcharliefuel", "Farpcharlietent1", "Farpcharlietent2", "Farpcharlietent3", "Farpcharlietent4", "Farpcharlicenter", "Farpcharliewind"},
    ["Delta"] = {"Farpdeltaammo", "Farpdeltafuel", "Farpdeltatent1", "Farpdeltatent2", "Farpdeltatent3", "Farpdeltatent4", "Farpdeltacenter", "Farpdeltawind"},
    ["Echo"] = {"Farpechoammo", "Farpechofuel", "Farpechotent1", "Farpechotent2", "Farpechotent3", "Farpechotent4", "Farpechocommand", "Farpechowind"},
    ["Foxtrot"] = {"Farpfoxtrotammo", "Farpfoxtrotfuel", "Farpfoxtrottent1", "Farpfoxtrottent2", "Farpfoxtrottent3", "Farpfoxtrottent4", "Farpfoxtrotcommand", "Farpfoxtrotwind"},
    ["Golf"] = {"Farpgolfammo", "Farpgolffuel", "Farpgolftent1", "Farpgolftent2", "Farpgolftent3", "Farpgolftent4", "Farpgolfcommand", "Farpgolfwind"},
    ["Hotel"] = {"Farphotelammo", "Farphotelfuel", "Farphoteltent1", "Farphoteltent2", "Farphoteltent3", "Farphoteltent4", "Farphotelcommand", "Farphotelwind"},
    ["India"] = {"Farpindiaammo", "Farpindiafuel", "Farpindiatent1", "Farpindiatent2", "Farpindiatent3", "Farpindiatent4", "Farpindiacommand", "Farpindiawind"},
    ["Juliett"] = {"Farpjuliettammo", "Farpjuliettfuel", "Farpjulietttent1", "Farpjulietttent2", "Farpjulietttent3", "Farpjulietttent4", "Farpjulietttent1command", "Farpjuliettwind"},
    ["Kilo"] = {"Farpkiloammo", "Farpkilofuel", "Farpkilotent1", "Farpkilotent2", "Farpkilotent3", "Farpkilotent4", "Farpkilocommand", "Farpkilowind"},
    ["Lima"] = {"Farplimaammo", "Farplimafuel", "Farplimatent1", "Farplimatent2", "Farplimatent3", "Farplimatent4", "Farplimacommand", "Farplimawind"},
	    
}

staticDetails = {}

function GatherStaticDetails()
    for airbaseName, staticNames in pairs(airbaseStatics) do
        for _, staticName in ipairs(staticNames) do
            local static = STATIC:FindByName(staticName)
            if static and static:IsAlive() then
                local point = static:GetPointVec3()
                local typeName = static:GetTypeName()
                if typeName == ".Command Center" then
                shapeName = shapeName or "ComCenter"
                end
                local coalitionSide = static:GetCoalition()
                local heading = static:GetHeading()
                staticDetails[staticName] = {
                    airbaseName = airbaseName,
                    typeName = typeName,
                    shapeName = shapeName,
                    coalitionSide = coalitionSide,
                    point = point,
                    heading = heading,
                }
            else
                env.info("Static not found or not alive: " .. staticName)
            end
        end
    end
end

function RespawnStaticsForAirbase(airbaseName, coalitionSide)
    local statics = airbaseStatics[airbaseName]
    if not statics then
        return
    end

    local countryID
    if coalitionSide == coalition.side.BLUE then
        countryID = country.id.USA
    elseif coalitionSide == coalition.side.RED then
        countryID = country.id.RUSSIA
    else
        return
    end

    for _, staticName in ipairs(statics) do
        local static = STATIC:FindByName(staticName, false)
        if static and static:IsAlive() then
            static:ReSpawn(countryID)
        else
            local details = staticDetails[staticName]
            if details then
                local headingInRadians = math.rad(details.heading)
                local spawnTemplate = {
                    ["name"] = staticName,
                    ["type"] = details.typeName,
                    ["shape_name"] = details.shapeName,
                    ["category"] = "Static",
                    ["country"] = countryID,
                    ["heading"] = headingInRadians,
                    ["position"] = details.point,
                }
                local spawnStatic = SPAWNSTATIC:NewFromTemplate(spawnTemplate, countryID)
                spawnStatic:SpawnFromCoordinate(COORDINATE:NewFromVec3(details.point))
            end
        end
    end
end

GatherStaticDetails()

local aircraftAssignments = {
    ["F.A.18"] = {
        ["Arctic1"] = {
            IFFs = {1400, 1401, 1402, 1403},
            assignments = {}
        },
        ["Bender2"] = {
            IFFs = {1404, 1405, 1406, 1407},
            assignments = {}
        },
        ["Crimson3"] = {
            IFFs = {1410, 1411, 1412, 1413},
            assignments = {}
        },
        ["Dusty4"] = {
            IFFs = {1300, 1301, 1302, 1303},
            assignments = {}
        },
        ["Lion3"] = {
            IFFs = {1310, 1311, 1312, 1313},
            assignments = {}
        },
    },
    ["F.16CM"] = {
        ["Jester1"] = {
            IFFs = {1510, 1511, 1512, 1513},
            assignments = {}
        },
        ["Indy9"] = {
            IFFs = {1500, 1501, 1502, 1503},
            assignments = {}
        },
        ["Venom4"] = {
            IFFs = {1610, 1611, 1612, 1613},
            assignments = {}
        },
    },
    ["A.10C"] = {
        ["Hawg8"] = {
            IFFs = {1330, 1331, 1332, 1333},
            assignments = {}
        },
        ["Tusk2"] = {
            IFFs = {1350, 1351, 1352, 1353},
            assignments = {}
        },
        ["Pig7"] = {
            IFFs = {1340, 1341, 1342, 1343},
            assignments = {}
        },
    },
    ["AH.64D"] = {
        ["Rage9"] = {
            IFFs = {1610, 1611, 1612, 1613},
            assignments = {}
        },
        ["Salty1"] = {
            IFFs = {1620, 1621, 1622, 1623},
            assignments = {}
        },
    },
    ["AJS37"] = {
        ["Fenris6"] = {
            IFFs = {1060, 1061, 1062, 1063},
            assignments = {}
        },
        ["Grim7"] = {
            IFFs = {1070, 1071, 1072, 1073},
            assignments = {}
        },
    },
    ["UH.1H"] = {
        ["Nitro5"] = {
            IFFs = {1050, 1051, 1052, 1053},
            assignments = {}
        },
    },
    ["CH.47F"] = { 
        ["Greyhound3"] = { 
            IFFs = {1370, 1371, 1372, 1373}, 
            assignments = {}
        },
    },
    ["F.15E.S4"] = { 
        ["Hitman3"] = { 
            IFFs = {1360, 1361, 1362, 1363}, 
            assignments = {}
        },
    },
	[".OH.58D"] = { 
        ["Blackjack4"] = { 
            IFFs = {1440, 1441, 1442, 1443}, 
            assignments = {}
        },
    },
    ["F.14.B"] = { 
        ["Elvis5"] = { 
            IFFs = {1100, 1101, 1102, 1103}, 
            assignments = {}
        },
        ["Mustang4"] = { 
            IFFs = {1104, 1105, 1106, 1107}, 
            assignments = {}
        },
    },
}

local zoneAssignments = {}
local playerZoneVisits = {}
local globalCallsignAssignments = {}

function logZoneAssignments()
    BASE:I("Zone Assignments:")
    for zone, assignments in pairs(zoneAssignments) do
        BASE:I("Zone: " .. zone)
        for fullCallsign, assignedPlayer in pairs(assignments) do
            BASE:I("    Callsign: " .. fullCallsign .. " -> Player: " .. assignedPlayer)
        end
    end
end
local function isCallsignUsedInOtherZones(fullCallsign, currentZone)
    for zone, assignments in pairs(zoneAssignments) do
        if assignments[fullCallsign] then
            if zone ~= currentZone then
                return true
            elseif assignments[fullCallsign] then
                return true
            end
        end
    end
    return false
end
function getAssignedCallsignAndIFF(groupName)
    for prefix, typeAssignments in pairs(aircraftAssignments) do
        if string.find(groupName, prefix) then
            for callsign, details in pairs(typeAssignments) do
                for i, IFF in ipairs(details.IFFs) do
                    local fullCallsign = callsign .. "" .. i
                    if not isCallsignUsedInOtherZones(fullCallsign, zoneName) then
                        return fullCallsign, IFF
                    end
                end
            end
        end
    end
    return nil, nil
end

function getPlayerAssignment(playerName)
    if globalCallsignAssignments[playerName] then
        local callsignInfo = globalCallsignAssignments[playerName]
        BASE:I(string.format("Player '%s' has callsign '%s' in zone '%s'", playerName, callsignInfo.callsign, callsignInfo.zoneName))
        return callsignInfo.callsign, callsignInfo.zoneName
    end
    BASE:I(string.format("Player '%s' has no callsign assignment.", playerName))
    return nil, nil
end
function findOrAssignSlot(playerName, groupName, zoneName)

    local existingCallsign, assignedZone = getPlayerAssignment(playerName)
    if existingCallsign then
        if assignedZone == zoneName then
            for prefix, typeAssignments in pairs(aircraftAssignments) do
                if string.find(groupName, prefix) then
                    for callsign, details in pairs(typeAssignments) do
                        if string.find(existingCallsign, callsign) then
                            local number = tonumber(string.sub(existingCallsign, -1))
                            if number then
                                local IFF = details.IFFs[number]
                                BASE:I(string.format("Reusing existing callsign %s for player %s in zone %s", existingCallsign, playerName, zoneName))
                                return existingCallsign, IFF
                            end
                        end
                    end
                end
            end
        else
            releaseSlot(playerName, assignedZone)
            globalCallsignAssignments[playerName] = nil
            BASE:I("Removed old callsign " .. existingCallsign .. " for player: " .. playerName)
        end
    end

    zoneAssignments[zoneName] = zoneAssignments[zoneName] or {}

    for prefix, typeAssignments in pairs(aircraftAssignments) do
        if string.find(groupName, prefix) then
            local preferredOrder
            if prefix == "F.A.18" then
                preferredOrder = {"Arctic1", "Bender2", "Crimson3", "Dusty4", "Lion3"}
            elseif prefix == "F.16CM" then
                preferredOrder = {"Indy9", "Jester1", "Venom4"}
            elseif prefix == "A.10C" then
                preferredOrder = {"Hawg8", "Tusk2", "Pig7"}
            elseif prefix == "AH.64D" then
                preferredOrder = {"Rage9", "Salty1"}
            elseif prefix == "AJS37" then
                preferredOrder = {"Fenris6", "Grim7"}
            elseif prefix == "UH.1H" then
                preferredOrder = {"Nitro5"}
            elseif prefix == "CH.47F" then
                preferredOrder = {"Greyhound3"}
            elseif prefix == "F.15E.S4" then
                preferredOrder = {"Hitman3"}
            elseif prefix == "F.14.B" then
                preferredOrder = {"Elvis5", "Mustang4"}
            elseif prefix == ".OH.58D" then
                preferredOrder = {"Blackjack4"}
            end

            if #preferredOrder == 1 then
                local baseCallsign = preferredOrder[1]

                local maxNumber = 0
                for zone, assignments in pairs(zoneAssignments) do
                    for fullCallsign, assignedPlayer in pairs(assignments) do
                        if string.find(fullCallsign, baseCallsign) then
                            local number = tonumber(string.sub(fullCallsign, -1))
                            if number and number > maxNumber then
                                maxNumber = number
                            end
                        end
                    end
                end

                local newCallsign = baseCallsign .. (maxNumber + 1)
                local IFF = typeAssignments[baseCallsign].IFFs[(maxNumber % #typeAssignments[baseCallsign].IFFs) + 1]

                zoneAssignments[zoneName][newCallsign] = playerName
                globalCallsignAssignments[playerName] = {callsign = newCallsign, zoneName = zoneName}

                BASE:I(string.format("Assigned %s to player %s in zone %s", newCallsign, playerName, zoneName))
                logZoneAssignments()
                return newCallsign, IFF
            end

            local availableMainCallsign = nil
            local existingPrefixInZone = nil

            for _, mainCallsign in ipairs(preferredOrder) do
                for i = 1, #typeAssignments[mainCallsign].IFFs do
                    local fullCallsign = mainCallsign .. "" .. i
                    if zoneAssignments[zoneName][fullCallsign] then
                        existingPrefixInZone = mainCallsign
                        break
                    end
                end
                if existingPrefixInZone then
                    break
                end
            end

            if not existingPrefixInZone then
                for _, mainCallsign in ipairs(preferredOrder) do
                    local isUsedInOtherZones = false
                    for zone, assignments in pairs(zoneAssignments) do
                        if zone ~= zoneName then
                            for fullCallsign, assignedPlayer in pairs(assignments) do
                                if string.find(fullCallsign, mainCallsign) then
                                    isUsedInOtherZones = true
                                    break
                                end
                            end
                        end
                    end
                    if not isUsedInOtherZones then
                        availableMainCallsign = mainCallsign
                        break
                    end
                end
            else
                availableMainCallsign = existingPrefixInZone
            end

            if availableMainCallsign then
                for i, IFF in ipairs(typeAssignments[availableMainCallsign].IFFs) do
                    local fullCallsign = availableMainCallsign .. "" .. i
                    if not zoneAssignments[zoneName][fullCallsign] then
                        zoneAssignments[zoneName][fullCallsign] = playerName

                        globalCallsignAssignments[playerName] = {callsign = fullCallsign, zoneName = zoneName}

                        BASE:I(string.format("Assigned %s to player %s in zone %s", fullCallsign, playerName, zoneName))
                        logZoneAssignments()
                        return fullCallsign, IFF
                    end
                end
            end
            for _, mainCallsign in ipairs(preferredOrder) do
                for i, IFF in ipairs(typeAssignments[mainCallsign].IFFs) do
                    local fullCallsign = mainCallsign .. "" .. i
                    if not isCallsignUsedInOtherZones(fullCallsign, zoneName) and zoneAssignments[zoneName][fullCallsign] == nil then
                        zoneAssignments[zoneName][fullCallsign] = playerName


                        globalCallsignAssignments[playerName] = {callsign = fullCallsign, zoneName = zoneName}

                        BASE:I(string.format("Assigned %s to player %s in zone %s (cycled back, first available)", fullCallsign, playerName, zoneName))
                        logZoneAssignments()
                        return fullCallsign, IFF
                    end
                end
            end
            for _, mainCallsign in ipairs(preferredOrder) do
                for i, IFF in ipairs(typeAssignments[mainCallsign].IFFs) do
                    local fullCallsign = mainCallsign .. "" .. i
                    if not zoneAssignments[zoneName][fullCallsign] then
                        zoneAssignments[zoneName][fullCallsign] = playerName

                        globalCallsignAssignments[playerName] = {callsign = fullCallsign, zoneName = zoneName}

                        BASE:I(string.format("Assigned %s to player %s in zone %s (cycled back, fallback)", fullCallsign, playerName, zoneName))
                        logZoneAssignments()
                        return fullCallsign, IFF
                    end
                end
            end
        end
    end

    return nil, nil
end

function releaseSlot(playerName, zoneName)
    if zoneAssignments[zoneName] then
        for callsign, assignedPlayer in pairs(zoneAssignments[zoneName]) do
            if assignedPlayer == playerName then
                zoneAssignments[zoneName][callsign] = nil

                globalCallsignAssignments[playerName] = nil

                BASE:I(string.format("Released %s from player %s in zone %s", callsign, playerName, zoneName))
                break
            end
        end
    end
end
function sendGreetingToPlayer(playerUnitID, greetingMessage)
    trigger.action.outTextForUnit(playerUnitID, greetingMessage, 55, true)
end
function sendDetailedMessageToPlayer(args)
    local playerUnitID = args[1]
    local message = args[2]
    local playerGroupID = args[3]
    trigger.action.outTextForUnit(playerUnitID, message, 120)
    if trigger.misc.getUserFlag(180) == 0 then
        trigger.action.outSoundForGroup(playerGroupID, "admin.wav")
    end
end
local function getAltimeter()
    local coord = COORDINATE:NewFromVec3({x = 0, y = 0, z = 0})
    local pressure_hPa = coord:GetPressure(0)  
    local pressureInHg = pressure_hPa * 0.0295300
    return string.format("Altimeter %.2f", pressureInHg)
end
local function getBRC()
    if IsGroupActive("CVN-73") then
        local myAirboss = AIRBOSS:New("CVN-73")
        local brc = myAirboss:GetBRC()
        return string.format("BRC %d°", brc)
    elseif IsGroupActive("CVN-72") then
        local myAirboss2 = AIRBOSS:New("CVN-72")
        local brc = myAirboss2:GetBRC()
        return string.format("BRC %d°", brc)
    else
        return "BRC data unavailable"
    end
end
local function getCarrierWind()
    local cvn
    if IsGroupActive('CVN-73') then
        cvn = UNIT:FindByName("CVN-73")
    elseif IsGroupActive('CVN-72') then
        cvn = UNIT:FindByName("CVN-72")
    end
    if cvn then
        local cvnCoord = cvn:GetCoordinate()
        local windDirection, windSpeed = cvnCoord:GetWind(18)
        if windDirection and windSpeed then
            local windSpeedKnots = windSpeed * 1.94384  
            windDirection = (windDirection + 360) % 360
            return string.format("Wind is %03d° at %d knots", windDirection, windSpeedKnots)
        else
            return "Wind data unavailable"
        end
    else
        return "Carrier not found"
    end
end
function getCarrierInfo()
    if IsGroupActive("CVN-73") then
        return "George Washington", "73X"
    elseif IsGroupActive("CVN-72") then
        return "Abraham Lincoln", "72X"
    else
        return "Unknown Carrier", "N/A"
    end
end

local function getAirbaseWind(airbaseName)
    local airbase = AIRBASE:FindByName(airbaseName)
    if airbase then
        local airbaseCoord = airbase:GetCoordinate()  
        local windDirection, windSpeed = airbaseCoord:GetWind(10)
        if windDirection and windSpeed then
            local windSpeedKnots = math.floor(windSpeed * 1.94384)
            windDirection = (windDirection + 360) % 360
            return string.format("Wind is %03d° at %d", windDirection, windSpeedKnots), windDirection
        else
            return "Wind data unavailable", nil
        end
    else
        return "Airbase not found", nil
    end
end

local function fetchActiveRunway(zoneName)
    local airbase = AIRBASE:FindByName(atisZones[zoneName].airbaseName)
    if not airbase then
        trigger.action.outText("Airbase/FARP conflict detected or airbase not found: " .. atisZones[zoneName].airbaseName, 10)
        return "Airbase data unavailable."
    end
    local landingRunway, takeoffRunway = airbase:GetActiveRunway()
    if not landingRunway and not takeoffRunway then
        return "No active runway data available."
    end
    local landingRunwayName
    local takeoffRunwayName
    if landingRunway then
        landingRunwayName = airbase:GetRunwayName(landingRunway)
    end
    if takeoffRunway then
        takeoffRunwayName = airbase:GetRunwayName(takeoffRunway)
    end
    if landingRunwayName and takeoffRunwayName then
        if landingRunwayName == takeoffRunwayName then
            return string.format("Active runway is %s", landingRunwayName)
        else
            return string.format("Active runway for landing is %s, for takeoff is %s", landingRunwayName, takeoffRunwayName)
        end
    elseif landingRunwayName then
        return string.format("Active runway (landing) is %s", landingRunwayName)
    elseif takeoffRunwayName then
        return string.format("Active runway (takeoff) is %s", takeoffRunwayName)
    else
        return "No active runway data available."
    end
end

local function getPlayerWind(playerCoord)
    local playerPosition = playerCoord:GetVec3()
    local windVector = atmosphere.getWind(playerPosition)
    if windVector then
        local windSpeedMps = math.sqrt(windVector.x^2 + windVector.z^2)
        local windSpeedKnots = math.floor(windSpeedMps * 1.94384)
        local originalWindDirection = math.deg(math.atan2(windVector.z, windVector.x))
        originalWindDirection = (originalWindDirection + 360) % 360
        local originatingWindDirection = (originalWindDirection + 180) % 360
        return string.format("Wind is %03d° at %d", originatingWindDirection, windSpeedKnots), originatingWindDirection
    else
        return "Wind data unavailable", nil
    end
end
local function getPlayerTemperature(playerCoord)
    local playerPosition = playerCoord:GetVec3()
    local temperatureCelsius = playerCoord:GetTemperature(playerPosition.y)
    
    if temperatureCelsius then
        return string.format("Temperature is %d°C", temperatureCelsius)
    else
        return "Temperature data unavailable"
    end
end

-- ATIS MENU --

local function sendATISInformation(client, group, zoneName)
    if not client then return end
    local messageText  
    if string.find(zoneName, "Carrier") then
        local windMessage = getCarrierWind()
        local brcMessage = getBRC()  
        local altimeterMessage = getAltimeter()
        messageText = string.format("ATIS for Mother:\n\n%s, %s\n\n%s", windMessage, altimeterMessage, brcMessage or "BRC data unavailable")
        MESSAGE:New(messageText, 15, ""):ToUnit(client)
    else        
        local windMessage, windDirection = getAirbaseWind(atisZones[zoneName].airbaseName)
        if windMessage == "Wind data unavailable" or windMessage == "Airbase not found" then
            messageText = string.format("ATIS for %s:\n\n%s", zoneName, windMessage)
        else
            local runwayInfo = fetchActiveRunway(zoneName, windDirection)
            messageText = string.format("ATIS for %s:\n\n%s, %s\n\n%s.", zoneName, windMessage, getAltimeter(), runwayInfo or "Runway information not available")
        end
        MESSAGE:New(messageText, 20, ""):ToUnit(client)
    end
end

local MainMenu = {}

function getClosestFriendlyAirbaseInfo(client)
    if not client or not client:IsAlive() then
        BASE:E("Client is nil or not alive.")
        return
    end
    local playerCoord = client:GetCoordinate()
    if not playerCoord then
        MESSAGE:New("Unable to determine player position.", 15, ""):ToUnit(client)
        return
    end
    local clientType = client:GetTypeName()
    local considerCVN72 = (clientType == "FA-18C_hornet")
    local closestZoneName, closestDistance, closestBearing = nil, math.huge, nil
    local closestNormalZoneName, closestNormalDistance, closestNormalBearing = nil, math.huge, nil

    local cvnCoord, cvnDistance, cvnBearing
    if considerCVN72 then
        local cvn
			if IsGroupActive('CVN-73') then
				cvn = UNIT:FindByName("CVN-73")
			elseif IsGroupActive('CVN-72') then
				cvn = UNIT:FindByName("CVN-72")
			end
        if cvn then
            cvnCoord = cvn:GetCoordinate()
            cvnDistance = playerCoord:Get2DDistance(cvnCoord)
            local trueBearingToCVN = playerCoord:HeadingTo(cvnCoord, nil)
            local magneticDeclination = playerCoord:GetMagneticDeclination()
            cvnBearing = (trueBearingToCVN - magneticDeclination + 360) % 360

            if cvnDistance < closestDistance then
                closestZoneName = cvn:GetName()
                closestDistance = cvnDistance
                closestBearing = cvnBearing
            end
        end
    end
    for zoneName, details in pairs(atisZones) do
        local airbase = AIRBASE:FindByName(details.airbaseName)
        if airbase and airbase:GetCoalition() == coalition.side.BLUE then
            local distanceToAirbase = playerCoord:Get2DDistance(airbase:GetCoordinate())
            local trueBearingToAirbase = playerCoord:HeadingTo(airbase:GetCoordinate(), nil)
            local magneticDeclination = playerCoord:GetMagneticDeclination()
            local magneticBearingToAirbase = (trueBearingToAirbase - magneticDeclination + 360) % 360

            if distanceToAirbase < closestDistance then
                closestZoneName = zoneName
                closestDistance = distanceToAirbase
                closestBearing = magneticBearingToAirbase
            end
            if not string.find(zoneName, "Carrier") and distanceToAirbase < closestNormalDistance then
                closestNormalZoneName = zoneName
                closestNormalDistance = distanceToAirbase
                closestNormalBearing = magneticBearingToAirbase
            end
        end
    end
	if closestZoneName == "CVN-72" or closestZoneName == "CVN-73" then
		local brcMessage = getBRC()
		local tacanCode = closestZoneName == "CVN-72" and "72X" or "73X"
		local cvnMessageText = string.format("Carrier: %s\n\nDistance: %.2f NM, Bearing: %03d°\n\nTACAN: %s, %s",
											 closestZoneName, closestDistance * 0.000539957, closestBearing, tacanCode, brcMessage)
		MESSAGE:New(cvnMessageText, 25, ""):ToUnit(client)
	end
    if closestNormalZoneName then
        local distanceInNM = closestNormalDistance * 0.000539957
        local displayName = closestNormalZoneName .. (WaypointList[closestNormalZoneName] or "")
        local windMessage, windDirection = getAirbaseWind(atisZones[closestNormalZoneName] and atisZones[closestNormalZoneName].airbaseName or "")
        local altimeterMessage, runwayInfo = "", ""

        if windMessage ~= "Wind data unavailable" and windMessage ~= "Airbase not found" then
            altimeterMessage = getAltimeter()
            runwayInfo = fetchActiveRunway(closestNormalZoneName, windDirection) or "Runway information not available"
        end
        local normalMessageText = string.format("Closest Friendly Airfield: %s\n\nDistance: %.2f NM, Bearing: %03d°\n\n%s%s%s",
                                                displayName, distanceInNM, closestNormalBearing, windMessage,
                                                altimeterMessage ~= "" and (", " .. altimeterMessage) or "",
                                                runwayInfo ~= "" and ("\n\n" .. runwayInfo) or "")
        MESSAGE:New(normalMessageText, 25, ""):ToUnit(client)
    end
end

function SetupATISMenu(client)
    local group = client:GetGroup()
    if not group then return end

    local groupID = group:GetName()

    if MainMenu[groupID] then
        MainMenu[groupID]:Remove()
    end

    local mainMenu = MENU_GROUP:New(group, "ATIS and Closest Airbase")
    MainMenu[groupID] = mainMenu

    local atisMenu = MENU_GROUP:New(group, "ATIS Information", mainMenu)
    MENU_GROUP_COMMAND:New(group, "Get Closest Friendly Airbase", mainMenu, getClosestFriendlyAirbaseInfo, client)
    MENU_GROUP_COMMAND:New(group, "Get ATIS for Mother", atisMenu, sendATISInformation, client, group, "Carrier")

    local currentMenu = atisMenu
    local menuItemCount = 2

    for zoneName, details in pairs(atisZones) do
        if not zoneName:find("Carrier") then
            local airbase = AIRBASE:FindByName(details.airbaseName)
            if airbase and airbase:GetCoalitionName() == 'Blue' then
                if menuItemCount >= 9 then
                    currentMenu = MENU_GROUP:New(group, "Next Page...", atisMenu)
                    menuItemCount = 0
                end
                MENU_GROUP_COMMAND:New(group, "Get ATIS for " .. zoneName, currentMenu, sendATISInformation, client, group, zoneName)
                menuItemCount = menuItemCount + 1
            end
        end
    end
end

function static:onBaseCapture(_event)
local event = _event -- Core.Event#EVENTDATA
if event.id == EVENTS.BaseCaptured and event.Place then
	local capturedBaseName = event.Place:GetName()  
	local coalitionSide = event.Place:GetCoalition()

	if (atisZoneNames[capturedBaseName] or atisZones[capturedBaseName]) and event.Place:GetCoalition() == coalition.side.BLUE then  
		
			local clientSet = SET_CLIENT:New():FilterCategories("plane"):FilterCoalitions("blue"):FilterAlive():FilterOnce()
			clientSet:ForEachClient(function(client)
				SetupATISMenu(client)  
				
				local messageText = string.format("ATIS for %s is now available.", capturedBaseName)
				MESSAGE:New(messageText, 25, ""):ToClient(client)
			end)
		end
	end  
end

function static:onPlayerSpawn(_event)
local event = _event
if event.id == EVENTS.PlayerEnterAircraft and event.IniUnit and event.IniPlayerName then
	local player = event.IniUnit
	local playerName = player:GetPlayerName()
	
	if player:GetUnitCategory() == Unit.Category.AIRPLANE then
		SetupATISMenu(player)
	end
	
	local group = player:GetGroup()
	local groupName = group:GetName()
	
	local foundZone = false
	
	for _, zoneName in ipairs(allZones) do
		local zone = ZONE:New(zoneName)
		if zone and zone:IsCoordinateInZone(player:GetCoordinate()) then
			  foundZone = true
			local playerUnitID = player:GetID()
			local playerGroupID = player:GetGroup():GetID()
			
			local isNewVisit = not playerZoneVisits[playerName] or not playerZoneVisits[playerName][zoneName]
			playerZoneVisits[playerName] = playerZoneVisits[playerName] or {}
			playerZoneVisits[playerName][zoneName] = true

			local assignedCallsign, assignedIFF = findOrAssignSlot(playerName, groupName, zoneName)

			local altimeterMessage = getAltimeter()
			local temperatureMessage = getPlayerTemperature(player:GetCoordinate())
			local greetingMessage, detailedMessage
			
				if string.find(zoneName, "Carrier") then
				local brcMessage = getBRC()
				local carrierWindMessage = getCarrierWind()
				local carrierName, tacanCode = getCarrierInfo()

				 if assignedCallsign and assignedIFF then
					greetingMessage = string.format("Welcome aboard %s, %s!\n\nYou have been assigned to %s, IFF %d.\n\nStandby for weather report from Mother.", carrierName, playerName, assignedCallsign, assignedIFF)
					detailedMessage = string.format("Welcome aboard %s, %s!\n\n%s, %s, %s\n\nTCN: %s, %s\n\nOnce 7 miles out, push Tactical on CH 3.", carrierName, assignedCallsign, carrierWindMessage, temperatureMessage, altimeterMessage, tacanCode, brcMessage)
				else
					greetingMessage = string.format("Welcome aboard %s, %s!\n\nStandby for weather and BRC.", carrierName, playerName)
					detailedMessage = string.format("Welcome aboard %s, %s!\n\n%s, %s, %s\n\nTCN: %s, %s\n\nOnce 7 miles out, push Tactical on CH 3.", carrierName, playerName, carrierWindMessage, temperatureMessage, altimeterMessage, tacanCode, brcMessage)
				end
			else
				local windMessage, displayWindDirection

				if atisZones[zoneName] then
					windMessage, displayWindDirection = getAirbaseWind(atisZones[zoneName].airbaseName)
					local activeRunwayMessage = fetchActiveRunway(zoneName, displayWindDirection)

					if isNewVisit then
						if assignedCallsign and assignedIFF then
							greetingMessage = string.format("Welcome to %s, %s!\n\nYou have been assigned to %s, IFF %d.\n\nStandby for weather and ATIS information.", zoneName, playerName, assignedCallsign, assignedIFF)
							detailedMessage = string.format("Welcome to %s, %s!\n\n%s, %s, %s.\n\n%s.\n\nOnce airborne push Tactical on CH 3.", zoneName, assignedCallsign, windMessage, temperatureMessage, altimeterMessage, activeRunwayMessage)
						else
							greetingMessage = string.format("Welcome to %s, %s!\n\nStandby for weather information.", zoneName, playerName)
							detailedMessage = string.format("Welcome to %s, %s!\n\n%s, %s, %s.\n\n%s.\n\nOnce airborne push Tactical on CH 3.", zoneName, playerName, windMessage, temperatureMessage, altimeterMessage, activeRunwayMessage)
						end

					else
						if assignedCallsign and assignedIFF then
							greetingMessage = string.format("Welcome back to %s, %s!\n\nYou have been assigned to %s, IFF %d.\n\nYou'll receive the latest weather and ATIS info shortly.", zoneName, playerName, assignedCallsign, assignedIFF)
							detailedMessage = string.format("Welcome back to %s, %s!\n\n%s, %s, %s.\n\n%s.\n\nOnce airborne push Tactical on CH 3.", zoneName, assignedCallsign, windMessage, temperatureMessage, altimeterMessage, activeRunwayMessage)
						else
							greetingMessage = string.format("Welcome back to %s, %s!\n\nStandby for updated weather information.", zoneName, playerName)
							detailedMessage = string.format("Welcome back to %s, %s!\n\n%s, %s, %s.\n\n%s.\n\nOnce airborne push Tactical on CH 3.", zoneName, playerName, windMessage, temperatureMessage, altimeterMessage, activeRunwayMessage)
						end
					end
				else

					local playerCoord = player:GetCoordinate()
					windMessage, _ = getPlayerWind(playerCoord)
					temperatureMessage = getPlayerTemperature(playerCoord)

					if isNewVisit then
						if assignedCallsign and assignedIFF then
							greetingMessage = string.format("Welcome to %s, %s!\n\nYou have been assigned to %s, IFF %d.\n\nStandby for weather information.", zoneName, playerName, assignedCallsign, assignedIFF)
							detailedMessage = string.format("Welcome to %s, %s!\n\n%s, %s, %s.\n\nOnce airborne push Tactical on CH 3.\n\nDon't forget supplies.", zoneName, assignedCallsign, windMessage, temperatureMessage, altimeterMessage)
						else
							greetingMessage = string.format("Welcome to %s, %s!\n\nStandby for weather information.", zoneName, playerName)
							detailedMessage = string.format("Welcome to %s, %s!\n\n%s, %s, %s.\n\nOnce airborne push Tactical on CH 3.\n\nDon't forget supplies.", zoneName, playerName, windMessage, temperatureMessage, altimeterMessage)
						end

					else
						if assignedCallsign and assignedIFF then
							greetingMessage = string.format("Welcome back to %s, %s!\n\nYou have been assigned to %s, IFF %d.\n\nYou'll receive updated weather information shortly.", zoneName, playerName, assignedCallsign, assignedIFF)
							detailedMessage = string.format("Welcome back to %s, %s!\n\n%s, %s, %s.\n\nOnce airborne push Tactical on CH 3.\n\nDon't forget supplies.", zoneName, assignedCallsign, windMessage, temperatureMessage, altimeterMessage)
						else
							greetingMessage = string.format("Welcome back to %s, %s!\n\nStandby for updated weather information.", zoneName, playerName)
							detailedMessage = string.format("Welcome back to %s, %s!\n\n%s, %s, %s.\n\nOnce airborne push Tactical on CH 3.\n\nDon't forget supplies.", zoneName, playerName, windMessage, temperatureMessage, altimeterMessage)
						end
					end
				end
			end
				sendGreetingToPlayer(playerUnitID, greetingMessage)
				timer.scheduleFunction(sendDetailedMessageToPlayer, {playerUnitID, detailedMessage, playerGroupID}, timer.getTime() + 60)
				break
			end
		end
		if not foundZone then
			local carrierUnit

			if IsGroupActive("CVN-72") then
				carrierUnit = UNIT:FindByName("CVN-72")
			elseif IsGroupActive("CVN-73") then
				carrierUnit = UNIT:FindByName("CVN-73")
			end

			if carrierUnit then
				local carrierPos = carrierUnit:GetCoordinate()
				local playerPos = player:GetCoordinate()
				local distanceToCarrier = playerPos:Get2DDistance(carrierPos)

				if distanceToCarrier < 200 then
					local assignedCallsign, assignedIFF = findOrAssignSlot(playerName, groupName, carrierUnit:GetName())
					local playerUnitID = player:GetID()
					local altimeterMessage = getAltimeter()
					local temperatureMessage = getPlayerTemperature(carrierPos)
					local brcMessage = getBRC()
					local carrierWindMessage = getCarrierWind()

					if assignedCallsign and assignedIFF then
						greetingMessage = string.format("Welcome aboard Abraham Lincoln, %s!\n\nYou have been assigned to %s, IFF %d.\n\nStandby for weather report from Mother.", playerName, assignedCallsign, assignedIFF)
						detailedMessage = string.format("Welcome aboard Abraham Lincoln, %s!\n\n%s, %s, %s\n\n%s\n\nOnce 7 miles out, push Tactical on CH 3.", assignedCallsign, carrierWindMessage, temperatureMessage, altimeterMessage, brcMessage)
					else
						greetingMessage = string.format("Welcome aboard Abraham Lincoln, %s!\n\nStandby for weather and BRC.", playerName)
						detailedMessage = string.format("Welcome aboard Abraham Lincoln, %s!\n\n%s, %s, %s\n\n%s\n\nOnce 7 miles out, push Tactical on CH 3.", playerName, carrierWindMessage, temperatureMessage, altimeterMessage, brcMessage)
					end

					sendGreetingToPlayer(playerUnitID, greetingMessage)
					timer.scheduleFunction(sendDetailedMessageToPlayer, {playerUnitID, detailedMessage, player:GetGroup():GetID()}, timer.getTime() + 60)
				else
					return
				end
			else
				MESSAGE:New("Carrier CVN-72 is not available.", 15, ""):ToUnit(player)
			end
		end
    end
end
function WeaponImpact(Weapon)
    local impactPos = Weapon:GetImpactVec3()
    if impactPos then
        trigger.action.explosion(impactPos, 100)
        BASE:I("Explosion triggered at impact position.")
    end
	Weapon:StopTrack()
end
function WeaponTrack(Weapon)
    local target = Weapon:GetTarget()
    if target and target.GetUnitCategory and target:GetUnitCategory() == Unit.Category.HELICOPTER and target:GetCoalition() == coalition.side.RED then
        return
    end
end

function static:OnEventShot(EventData)
    local eventdata = EventData
    if eventdata and eventdata.weapon and eventdata.IniUnit and eventdata.IniPlayerName then
        local initiator = eventdata.IniUnit
        local playerName = eventdata.IniPlayerName

        if initiator and (initiator:GetUnitCategory() == Unit.Category.AIRPLANE or initiator:GetUnitCategory() == Unit.Category.HELICOPTER) then
            local weapon = WEAPON:New(eventdata.weapon)
            if weapon:IsMissile() then
                local target = eventdata.TgtUnit
                if target and target.GetUnitCategory and target:GetUnitCategory() == Unit.Category.HELICOPTER and target:GetCoalition() == coalition.side.RED then
                    weapon:SetFuncTrack(WeaponTrack)
                    weapon:SetFuncImpact(WeaponImpact)
                    weapon:StartTrack()
					BASE:I("Tracking RED coalition helicopter target.")
                end
            end
        end
    end
end

---- Escort ------
spawnedGroups = {}
local escortGroups = {}
local menuEscortRequest = {}
local escortRequestMenus = {}
local escortMenus = {}

function AddEscortRequestMenu(group)
    if not group then
        return
    end
    local groupName = group:GetName()
    escortRequestMenus[groupName] = MENU_GROUP_COMMAND:New(group, "Request Escort", nil, EscortClientGroup, group)
end
function EnableEscortRequestMenu(group)
    if not group then
        return
    end
    local groupName = group:GetName()
    if menuEscortRequest[groupName] then
        menuEscortRequest[groupName]:Remove()
    end
end
function RequestEscort(group)
    EscortClientGroup(group)
    local groupName = group:GetName()
    if menuEscortRequest[groupName] then
        menuEscortRequest[groupName]:Remove()
        menuEscortRequest[groupName] = nil
    end
end
function RemoveRequestEscortMenu(group)
    local groupName = group:GetName()
    if escortRequestMenus[groupName] then
        escortRequestMenus[groupName]:Remove()
        escortRequestMenus[groupName] = nil
    end
end
function FindEscortTemplateWithAlias(clientGroup, alias)
    local groupName = clientGroup:GetName()
    local aircraftType = clientGroup:GetUnit(1):GetTypeName()

    local templateName = "EscortA10"
    if string.find(aircraftType, "F-15") then
        templateName = "EscortF15"
    end

    local escortSpawn = SPAWN:NewWithAlias(templateName, alias)
    return escortSpawn
end

function EscortClientGroup(clientGroup)
    local groupName = clientGroup:GetName()
    local spawnCount = spawnedGroups[groupName] and spawnedGroups[groupName].escortSpawnCount or 1
    local alias = groupName .. "_Escort_" .. string.format("%03d", spawnCount)
    local escortSpawn = FindEscortTemplateWithAlias(clientGroup, alias)

    local clientPosition = clientGroup:GetPointVec3()
    local clientHeading = clientGroup:GetHeading()
    local distanceBehindMeters = 1500

    local offsetX = math.cos(math.rad(clientHeading)) * distanceBehindMeters
    local offsetZ = math.sin(math.rad(clientHeading)) * distanceBehindMeters

    local escortSpawnPosition = {
        x = clientPosition.x - offsetX,
        y = clientPosition.y + 3700,
        z = clientPosition.z - offsetZ
    }
    local escortCoord = COORDINATE:NewFromVec3(escortSpawnPosition, clientHeading)

        escortSpawn:InitSkill("Excellent"):InitHeading(clientHeading):OnSpawnGroup(function(spawnedEscortGroup)
        local escortGroup = FLIGHTGROUP:New(spawnedEscortGroup)
		escortGroup:SetSpeed(600, true, true)
        escortGroup:GetGroup():CommandSetUnlimitedFuel(true)
        escortGroups[groupName] = escortGroup
        local escortAuftrag = AUFTRAG:NewESCORT(clientGroup, {x = -100, y = 3048, z = 100}, 40, {"Air"})
        local currentMission = escortGroup:GetMissionCurrent()

        if currentMission then
            escortGroup:MissionCancel(currentMission)
        end

        escortGroup:AddMission(escortAuftrag)
        escortGroup:MissionStart(escortAuftrag)

        MESSAGE:New("ESCORT IS ON ROUTE.\n\nYou can control the escort from the radio menu.", 20):ToGroup(clientGroup)
        RemoveRequestEscortMenu(clientGroup)
        AddEscortMenu(clientGroup)

        function escortGroup:OnAfterDead(From, Event, To)
            escortGroups[groupName] = nil
            RemoveEscortMenu(clientGroup)

            if clientGroup and clientGroup:IsAlive() then
                MESSAGE:New("Your escort group has been destroyed. Takeoff from an airfield to get a new one.", 10):ToGroup(clientGroup)
            end
        end
    end)
    escortSpawn:SpawnFromCoordinate(escortCoord)
    spawnedGroups[groupName].escortSpawnCount = spawnCount + 1
end
function AddEscortMenu(group)
    if not group then
        return
    end
    local groupName = group:GetName()

    escortMenus[groupName] = MENU_GROUP:New(group, "Escort")
    
    MENU_GROUP_COMMAND:New(group, "Patrol Ahead 15 NM", escortMenus[groupName], PatrolAhead, group)
    MENU_GROUP_COMMAND:New(group, "Racetrack, On my nose 20 NM", escortMenus[groupName], RaceTrackOnNose, group)
    MENU_GROUP_COMMAND:New(group, "Racetrack, Left to right 20 NM", escortMenus[groupName], RaceTrackLeftToRight, group)
    MENU_GROUP_COMMAND:New(group, "Racetrack, Right to left 20 NM", escortMenus[groupName], RaceTrackRightToLeft, group)
    MENU_GROUP_COMMAND:New(group, "Start Orbit", escortMenus[groupName], EscortOrbit, group)
    MENU_GROUP_COMMAND:New(group, "Rejoin", escortMenus[groupName], EscortRejoin, group)
    MENU_GROUP_COMMAND:New(group, "Escort RTB", escortMenus[groupName], EscortAbort, group)


end
function RemoveEscortMenu(group)
    local groupName = group:GetName()
    if escortMenus[groupName] then
        escortMenus[groupName]:Remove()
        escortMenus[groupName] = nil
    else
        env.info("No escort menu found for " .. groupName .. ".")
    end
end
function EscortOrbit(group)
    local escortGroup = escortGroups[group:GetName()]
    if escortGroup then
        local clientCoord = group:GetPointVec2()
        local escortHeading = group:GetHeading()
        local orbitAuftrag = AUFTRAG:NewORBIT(clientCoord, 25000, 350, escortHeading, 1)
        escortGroup:AddMission(orbitAuftrag)
        local currentMission = escortGroup:GetMissionCurrent()
        if currentMission then
		currentMission:__Cancel(5)
        end        

        MESSAGE:New("Escort is setting up an orbit.", 20):ToGroup(group)
    else
        MESSAGE:New("No active escort found.", 10):ToGroup(group)
    end
end
function PatrolAhead(group)
    if not group or not group:IsAlive() then
        MESSAGE:New("Unable to set up patrol: escort group is invalid or not alive.", 20):ToAll()
        return
    end
    local escortGroup = escortGroups[group:GetName()]
    if escortGroup then
        local clientHeading = group:GetHeading()
        local PatrolAheadAuftrag = AUFTRAG:NewCAPGROUP(group, 25000, 550, clientHeading, 15, 15, 0, 3, {"Air"}, 40)
        escortGroup:AddMission(PatrolAheadAuftrag)
		PatrolAheadAuftrag:SetMissionSpeed(550)		
        local currentMission = escortGroup:GetMissionCurrent()
        if currentMission then
		currentMission:__Cancel(5)
        end        
        MESSAGE:New("Escort is setting up a patrol ahead at 10 NM\n\nAI might take their time", 20):ToGroup(group)
    else
        MESSAGE:New("No active escort found.", 20):ToGroup(group)
    end
end
function RaceTrackOnNose(group)
    local escortGroup = escortGroups[group:GetName()]
    if escortGroup then
        local clientCoord = group:GetPointVec3()
        local clientHeading = group:GetHeading()
		
        local RaceTrackOnNoseAuftrag = AUFTRAG:NewPATROL_RACETRACK(clientCoord, 25000, 370, clientHeading, 20)
        escortGroup:AddMission(RaceTrackOnNoseAuftrag)
        RaceTrackOnNoseAuftrag:SetMissionSpeed(600)
        local currentMission = escortGroup:GetMissionCurrent()
        if currentMission then
		currentMission:__Cancel(5)
        end
        
       MESSAGE:New("Escort is setting up a 20 NM racetrack at heading " .. clientHeading, 20):ToGroup(group)
    else
        MESSAGE:New("No active escort found.", 10):ToGroup(group)
    end
end
function RaceTrackLeftToRight(group)
    local escortGroup = escortGroups[group:GetName()]
    if escortGroup then
        local clientCoord = group:GetPointVec3()
        local clientHeading = group:GetHeading()
        local headingLeftToRight = (clientHeading - 90) % 360
		
        local RaceTrackLeftToRightAuftrag = AUFTRAG:NewPATROL_RACETRACK(clientCoord, 25000, 370, headingLeftToRight, 20)
        escortGroup:AddMission(RaceTrackLeftToRightAuftrag)
        RaceTrackLeftToRightAuftrag:SetMissionSpeed(600)
        local currentMission = escortGroup:GetMissionCurrent()
        if currentMission then
		currentMission:__Cancel(5)
        end
        
        MESSAGE:New("Escort is setting up a 20 NM racetrack at heading " .. headingLeftToRight, 20):ToGroup(group)
    else
        MESSAGE:New("No active escort found.", 20):ToGroup(group)
    end
end
function RaceTrackRightToLeft(group)
    local escortGroup = escortGroups[group:GetName()]
    if escortGroup then
        local clientCoord = group:GetPointVec3()
        local clientHeading = group:GetHeading()
        local headingRightToLeft = (clientHeading + 90) % 360
        local RaceTrackRightToLeftAuftrag = AUFTRAG:NewPATROL_RACETRACK(clientCoord, 25000, 370, headingRightToLeft, 20)
        escortGroup:AddMission(RaceTrackRightToLeftAuftrag)
        RaceTrackRightToLeftAuftrag:SetMissionSpeed(600)
        
        local currentMission = escortGroup:GetMissionCurrent()
        if currentMission then
		currentMission:__Cancel(5)
        end
        MESSAGE:New("Escort is setting up a 20 NM racetrack at heading " .. headingRightToLeft, 20):ToGroup(group)
    else
        MESSAGE:New("No active escort found.", 20):ToGroup(group)
    end
end
function EscortRejoin(group)
    local escortGroup = escortGroups[group:GetName()]
    if escortGroup then
    
		local clientCoord = group:GetPointVec3()
        local escortAuftrag = AUFTRAG:NewESCORT(group, {x=-100, y=3048, z=300}, 40, {"Air"})
        escortGroup:AddMission(escortAuftrag)
        escortAuftrag:SetMissionSpeed(600)
        local currentMission = escortGroup:GetMissionCurrent()
        if currentMission then
		currentMission:__Cancel(5)
        end
        MESSAGE:New("Escort is rejoining your formation.", 20):ToGroup(group)
    else
        MESSAGE:New("No active escort found.", 10):ToGroup(group)
    end
end
function EscortAbort(group)
    local escortGroup = escortGroups[group:GetName()]
    if escortGroup then
                
        escortGroup:CancelAllMissions()
        MESSAGE:New("Escort is RTB", 20):ToGroup(group)
    else
        MESSAGE:New("No active escort found.", 10):ToGroup(group)
    end
end
function static:OnEventTakeoff(EventData)
    if not EventData.IniUnit or not EventData.IniPlayerName then
        return
    end
    --if EventData.IniPlayerName == "timmeys" then
        --return
    --end
    local playerUnit = EventData.IniUnit
    local playerGroup = playerUnit:GetGroup()
    local PGName = playerGroup:GetName()
    local playerType = playerUnit:GetTypeName()

    if playerType == "F-15ESE" or playerType == "A-10C_2" or playerType == "Hercules" then
        spawnedGroups[PGName] = spawnedGroups[PGName] or {
            playerName = EventData.IniPlayerName,
            escortGroups = {},
            menuEscortRequest = nil,
            escortSpawnCount = 1
        }

        MESSAGE:New("Escort is available, " .. EventData.IniPlayerName .. ".", 10, ""):ToUnit(playerUnit)
        AddEscortRequestMenu(playerGroup)
        menuEscortRequest[PGName] = spawnedGroups[PGName].menuEscortRequest

    end
end
function static:OnEventPilotDead(EventData)
    if EventData.IniUnit and EventData.IniPlayerName then
        local playerUnit = EventData.IniUnit
        local playerGroup = playerUnit:GetGroup()

        if playerGroup then
            local groupName = playerGroup:GetName()
            local escortGroup = escortGroups[groupName]

            if escortGroup then
                escortGroup:Destroy()
                escortGroups[groupName] = nil
            end
        end
    end
end
function static:OnEventLand(EventData)
    if EventData.id == EVENTS.Land and EventData.IniUnit then
        local landedUnit = EventData.IniUnit
        local group = landedUnit:GetGroup()
        if group then
            local groupName = group:GetName()

            if string.sub(groupName, 1, 6) == "f16cap" or string.sub(groupName, 1, 4) == "sead" or string.sub(groupName, 1, 3) == "cas" then
                local filteredGroup = SET_GROUP:New():FilterPrefixes("f16cap", "sead", "cas"):FilterAlive():FilterOnce()
                SCHEDULER:New(nil, function()
                    filteredGroup:ForEachGroupAlive(function(GROUP)
                        local units = GROUP:GetUnits()
                        if units then
                            for _, unit in ipairs(units) do
                                local speedInKMH = unit:GetVelocityKMH()
                                if speedInKMH < 120 then
                                    unit:Destroy()
                                end
                            end
                        else
                            env.info("No valid units found in the group: " .. GROUP:GetName())
                        end
                    end)
                end, {}, 5)
            end

            if EventData.IniPlayerName then
                local escortGroup = escortGroups[groupName]
                if escortGroup then
                    escortGroup:Destroy()
                    escortGroups[groupName] = nil
                    RemoveEscortMenu(group)
                end
            end
        else
            env.info("OnEventLand: Group is nil for landed unit.")
        end
    end
end
function static:OnEventPlayerLeaveUnit(EventData)
    BASE:I("OnEventPlayerLeaveUnit called")

    if EventData.id == EVENTS.PlayerLeaveUnit or EventData.id == EVENTS.PilotDead then
        if EventData.IniUnit and EventData.IniPlayerName then
            local playerUnit = EventData.IniUnit
            local playerGroup = playerUnit:GetGroup()
            if playerGroup then
                local groupName = playerGroup:GetName()
                local escortGroup = escortGroups[groupName]
                if escortGroup then
                    escortGroup:Destroy()
                    escortGroups[groupName] = nil
                    BASE:I("Escort group for " .. groupName .. " has been destroyed because the player left the unit.")
                end
            end

            local playerName = EventData.IniPlayerName
            BASE:I("Player leaving unit: " .. playerName)

            if globalCallsignAssignments[playerName] then
                local callsignInfo = globalCallsignAssignments[playerName]
                local zoneName = callsignInfo.zoneName
                BASE:I("Player had assignment: " .. callsignInfo.callsign .. " in zone " .. zoneName)

                releaseSlot(playerName, zoneName)
                globalCallsignAssignments[playerName] = nil
            else
                BASE:I("No global assignment found for player: " .. playerName)
            end
        else
            BASE:I("IniPlayerName is nil. Player might have disconnected without a proper event.")

            local clientSet = SET_CLIENT:New():FilterCategories("plane"):FilterCategories("helicopter"):FilterCoalitions("blue"):FilterAlive():FilterOnce()

            for playerName, callsignInfo in pairs(globalCallsignAssignments) do
                local isPlayerAlive = false

                clientSet:ForEachClient(function(client)
                    if client:GetPlayerName() == playerName then
                        isPlayerAlive = true
                    end
                end)

                if not isPlayerAlive then
                    local zoneName = callsignInfo.zoneName
                    BASE:I("Removing dead or disconnected player: " .. playerName .. " from zone " .. zoneName)
                    releaseSlot(playerName, zoneName)
                    globalCallsignAssignments[playerName] = nil
                end
            end
        end
    else
        BASE:I("Event ID does not match PlayerLeaveUnit or PilotDead")
    end
end


---- End Escort ----
AIGroups = {
  sead = {},
  f16cap = {},
  cas = {},
  decoy = {}
}

destroyMenuHandles = {
  sead = nil,
  f16cap = nil,
  cas = nil,
  decoy = nil
}

function anyGroupAlive(tName)
  if not AIGroups[tName] then return false end
  for gName,_ in pairs(AIGroups[tName]) do
    local g = Group.getByName(gName)
    if g and g:isExist() then return true end
  end
  return false
end

function destroySeadGroups()
  for gName,_ in pairs(AIGroups.sead) do
    local g = Group.getByName(gName)
    if g and g:isExist() then g:destroy() end
  end
  if destroyMenuHandles.sead then
    MESSAGE:New("SEAD GROUP DESTROYED OR KILLED IN ACTION", 15):ToAll()
    trigger.action.setUserFlag("sead", false)
    missionCommands.removeItemForCoalition(coalition.side.BLUE, destroyMenuHandles.sead)
    destroyMenuHandles.sead = nil
  end
end

function destroydecoyGroups()
  for gName,_ in pairs(AIGroups.decoy) do
    local g = Group.getByName(gName)
    if g and g:isExist() then g:destroy() end
  end
  if destroyMenuHandles.decoy then
    MESSAGE:New("DECOY GROUP DESTROYED OR KILLED IN ACTION", 15):ToAll()
    trigger.action.setUserFlag("decoy", false)
    missionCommands.removeItemForCoalition(coalition.side.BLUE, destroyMenuHandles.decoy)
    destroyMenuHandles.decoy = nil
  end
end

function destroyF16capGroups()
  for gName,_ in pairs(AIGroups.f16cap) do
    local g = Group.getByName(gName)
    if g and g:isExist() then g:destroy() end
  end
  if destroyMenuHandles.f16cap then
    MESSAGE:New("CAP GROUP DESTROYED OR KILLED IN ACTION", 15):ToAll()
    trigger.action.setUserFlag("cap", false)
    missionCommands.removeItemForCoalition(coalition.side.BLUE, destroyMenuHandles.f16cap)
    destroyMenuHandles.f16cap = nil
  end
end

function destroyCasGroups()
  for gName,_ in pairs(AIGroups.cas) do
    local g = Group.getByName(gName)
    if g and g:isExist() then g:destroy() end
  end
  if destroyMenuHandles.cas then
    MESSAGE:New("CAS GROUP DESTROYED OR KILLED IN ACTION", 15):ToAll()
    trigger.action.setUserFlag("cas", false)
    missionCommands.removeItemForCoalition(coalition.side.BLUE, destroyMenuHandles.cas)
    destroyMenuHandles.cas = nil
  end
end

function ensureSeadMenu()
  if not destroyMenuHandles.sead and anyGroupAlive("sead") and trigger.misc.getUserFlag("sead") == 0 then
    trigger.action.setUserFlag("sead", true)
    SCHEDULER:New(nil, function()
      destroyMenuHandles.sead = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Destroy SEAD Group", nil, destroySeadGroups)
    end, {}, 30)
  end
end

function ensureDecoyMenu()
  if not destroyMenuHandles.decoy and anyGroupAlive("decoy") and trigger.misc.getUserFlag("decoy") == 0 then
    trigger.action.setUserFlag("decoy", true)
    SCHEDULER:New(nil, function()
      destroyMenuHandles.decoy = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Destroy Decoy Group", nil, destroydecoyGroups)
    end, {}, 30)
  end
end

function ensureF16capMenu()
  if not destroyMenuHandles.f16cap and anyGroupAlive("f16cap") and trigger.misc.getUserFlag("cap") == 0 then
    trigger.action.setUserFlag("cap", true)
    SCHEDULER:New(nil, function()
      destroyMenuHandles.f16cap = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Destroy CAP Group", nil, destroyF16capGroups)
    end, {}, 30)
  end
end

function ensureCasMenu()
  if not destroyMenuHandles.cas and anyGroupAlive("cas") and trigger.misc.getUserFlag("cas") == 0 then
    trigger.action.setUserFlag("cas", true)
    SCHEDULER:New(nil, function()
      destroyMenuHandles.cas = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Destroy CAS Group", nil, destroyCasGroups)
    end, {}, 30)
  end
end

function static:OnEventEngineStartup(EventData)
  if not EventData or not EventData.IniGroup then return end
  local gName = EventData.IniGroup:GetName()
  if string.find(gName, "sead") then
    AIGroups.sead[gName] = true
    ensureSeadMenu()
  elseif string.find(gName, "f16cap") then
    AIGroups.f16cap[gName] = true
    ensureF16capMenu()
  elseif string.find(gName, "cas") then
    AIGroups.cas[gName] = true
    ensureCasMenu()
  elseif string.find(gName, "decoy") then
    AIGroups.decoy[gName] = true
    ensureDecoyMenu()
  end
end


static:HandleEvent(EVENTS.Shot, static.OnEventShot)
static:HandleEvent(EVENTS.Land, static.OnEventLand)
static:HandleEvent(EVENTS.PlayerEnterAircraft, static.onPlayerSpawn)
static:HandleEvent(EVENTS.BaseCaptured, static.onBaseCapture)
static:HandleEvent(EVENTS.PlayerLeaveUnit, static.OnEventPlayerLeaveUnit)
static:HandleEvent(EVENTS.Takeoff, static.OnEventTakeoff)
static:HandleEvent(EVENTS.PilotDead, static.OnEventPilotDead)
static:HandleEvent(EVENTS.EngineStartup, static.OnEventEngineStartup)

_SETTINGS:SetPlayerMenuOff()
_SETTINGS:SetA2G_BR()
_SETTINGS:SetA2A_BULLS()
_SETTINGS:SetImperial()
BASE:TraceOnOff( false )

BASE:I("Loading completed for Leka's special all in one script handler")