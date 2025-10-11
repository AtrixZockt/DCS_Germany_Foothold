static = STATIC:FindByName("EventMan", true)

airbaseStatics = {
	["Quarry"] = {"Farpalphaammo", "Farpalphafuel", "Farpalphatent1", "Farpalphatent2", "Farpalphatent3", "Farpalphatent4", "Farpalphacommand", "Farpalphawind"}
	    
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
        else
            BASE:I("IniPlayerName is nil. Player might have disconnected without a proper event.")
        end
    else
        BASE:I("Event ID does not match PlayerLeaveUnit or PilotDead")
    end
end


---- End Escort ----
---
---
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


function ensureSeadMenu()
  if not destroyMenuHandles.sead and anyGroupAlive("sead") and trigger.misc.getUserFlag("sead") == 0 then
    trigger.action.setUserFlag("sead", true)
    SCHEDULER:New(nil, function()
      destroyMenuHandles.sead = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Destroy SEAD Group", nil, destroySeadGroups)
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


function static:OnEventEngineStartup(EventData)
  if not EventData or not EventData.IniGroup then return end
  local gName = EventData.IniGroup:GetName()
  if string.find(gName, "sead") then
    AIGroups.sead[gName] = true
    ensureSeadMenu()
  elseif string.find(gName, "f16cap") then
    AIGroups.f16cap[gName] = true
    ensureF16capMenu()
  end
end

---
static:HandleEvent(EVENTS.Land, static.OnEventLand)
static:HandleEvent(EVENTS.PlayerLeaveUnit, static.OnEventPlayerLeaveUnit)
static:HandleEvent(EVENTS.Takeoff, static.OnEventTakeoff)
static:HandleEvent(EVENTS.PilotDead, static.OnEventPilotDead)
static:HandleEvent(EVENTS.EngineStartup, static.OnEventEngineStartup)

_SETTINGS:SetPlayerMenuOff()
_SETTINGS:SetA2G_BR()
_SETTINGS:SetA2A_BULLS()
_SETTINGS:SetImperial()