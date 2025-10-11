-- =================================================================================================
--
-- DYNAMIC TASKING AND XP FRAMEWORK v14.7 (Zone-based CAS Kills)
-- Mission list is now organized into sub-menus by task type.
-- CAS missions now require a number of kills of appropriate types within a zone.
--
-- =================================================================================================

-- Wrapper table to hold all framework functions and data.
DynamicTasking = {}

-- Main configuration table
DynamicTasking.Config = {
    MaxMissions = 20,
    XP_CAS = 100,
    XP_SEAD = 150,
    XP_STRIKE = 250,
    XP_RUNWAY = 200,
    XP_CAPTURE = 300,
    XP_INTERCEPT = 125,
    MenuRefreshRate = 90,
}

-- Runtime data tables
DynamicTasking.ActiveMissions = {}
DynamicTasking.PlayerAssignments = {} -- Stores [playerName] = missionCode for quick lookup
DynamicTasking.PlayerXP = {}
DynamicTasking.GroupMenus = {}
DynamicTasking.AssignedTargets = {} -- Tracks targets assigned to active non-CAS missions.

--- Generates a random, 3-digit numerical join code.
function DynamicTasking:GenerateCode()
    local code
    repeat
        code = string.format("%03d", math.random(1, 999))
    until self.ActiveMissions[code] == nil
    return code
end

--- Scans a ground zone and correctly sorts units into mission pools.
function DynamicTasking:GenerateA2GMissionForZone(zone)
    if #self.ActiveMissions >= self.Config.MaxMissions then return end
    local zoneObject = ZONE:FindByName(zone.zone)
    if not zoneObject then return end

    local enemyGroupsInZone = SET_GROUP:New():FilterZones({zoneObject}):FilterCoalitions("red"):FilterOnce()
    
    local sead_pool, cas_pool, strike_pool_groups = {}, {}, {}
    
    if enemyGroupsInZone:Count() > 0 then
        enemyGroupsInZone:ForEach(function(group)
            -- Check if the group itself is assigned (for SEAD/STRIKE)
            local groupName = group:GetName()
            if group:GetSize() > 0 and not self.AssignedTargets[groupName] then
                local firstUnit = group:GetUnit(1)
                if firstUnit and firstUnit:IsAlive() then
                    if firstUnit:IsGround() and (
                       firstUnit:HasAttribute("SAM SR") or
                       firstUnit:HasAttribute("SAM TR") or
                       firstUnit:HasAttribute("SAM LR") or
                       firstUnit:HasAttribute("SAM MR")
                    ) then
                        table.insert(sead_pool, group)
                    elseif firstUnit:HasAttribute("SAM elements") then
                        table.insert(strike_pool_groups, group)
                    -- For CAS, units are checked individually, not the whole group
                    elseif firstUnit:HasAttribute("Tanks") 
                        or firstUnit:HasAttribute("IFV") 
                        or firstUnit:HasAttribute("APC") 
                        or firstUnit:HasAttribute("Infantry") 
                        or firstUnit:HasAttribute("MANPADS")
                        or firstUnit:HasAttribute("Air Defence vehicles")
                        or firstUnit:HasAttribute("AAA")
                    then
                        table.insert(cas_pool, group) -- CAS pool collects all potential CAS targets
                    end
                end
            end
        end)
    end

    local strike_pool_statics = {}
    SET_STATIC:New():FilterZones({zoneObject}):FilterCoalitions("red"):FilterOnce():ForEach(function(staticObject)
        -- Check if the static itself is assigned (for STRIKE)
        local staticName = staticObject:GetName()
        if staticObject:IsAlive() and not self.AssignedTargets[staticName] then
            local typeName = staticObject:GetTypeName()
            if typeName == "Command Post" or typeName:find("Bunker") or typeName:find("Depot") or typeName:find("Warehouse") then
                table.insert(strike_pool_statics, staticObject)
            end
        end
    end)

    if #sead_pool > 0 and #self.ActiveMissions < self.Config.MaxMissions then
        local targetGroup = sead_pool[math.random(1, #sead_pool)]
        self:CreateMission("SEAD", targetGroup, "Destroy "..targetGroup:GetUnit(1):GetTypeName().." in "..zone.zone, self.Config.XP_SEAD, targetGroup:GetSize(), zone.zone)
    end

    if #strike_pool_groups > 0 and #self.ActiveMissions < self.Config.MaxMissions then
        local targetGroup = strike_pool_groups[math.random(1, #strike_pool_groups)]
        self:CreateMission("STRIKE", targetGroup, "Destroy "..targetGroup:GetUnit(1):GetTypeName().." in "..zone.zone, self.Config.XP_STRIKE, targetGroup:GetSize(), zone.zone)
    end
    
    if #strike_pool_statics > 0 and #self.ActiveMissions < self.Config.MaxMissions then
        local targetStatic = strike_pool_statics[math.random(1, #strike_pool_statics)]
        self:CreateMission("STRIKE", targetStatic, "Destroy "..targetStatic:GetTypeName().." in "..zone.zone, self.Config.XP_STRIKE, 1, zone.zone)
    end

    -- Create a single CAS mission for all suitable targets in the zone
    local totalCasUnitsInZone = 0
    local casTargetUnits = {} -- New table for unit names
    if #cas_pool > 0 then
        for _, group in ipairs(cas_pool) do
            for _, unit in ipairs(group:GetUnits()) do
                if unit and unit:IsAlive() then
                    local unitName = unit:GetName()
                    if not self.AssignedTargets[unitName] then -- Check if unit is already assigned to any mission
                        totalCasUnitsInZone = totalCasUnitsInZone + 1
                        casTargetUnits[unitName] = true -- Store unit name as key for fast lookup
                    end
                end
            end
        end
    end

    if totalCasUnitsInZone > 0 and #self.ActiveMissions < self.Config.MaxMissions then
        local description = string.format("Destroy %d enemy ground units in %s", totalCasUnitsInZone, zone.zone)
        -- For CAS, targetIdentifier is the zone name, requiredKills is totalCasUnitsInZone
        self:CreateMission("CAS", zone.zone, description, self.Config.XP_CAS, totalCasUnitsInZone, zone.zone, casTargetUnits)
    end
end

--- Creates a mission to capture a neutral zone.
function DynamicTasking:GenerateCaptureMission(zone)
    if not zone or zone.side ~= 0 then return end
    if #self.ActiveMissions >= self.Config.MaxMissions then return end
    local zoneObject = ZONE:FindByName(zone.zone)
    if not zoneObject then return end
    self:CreateMission("CAPTURE", zoneObject, "Capture "..zone.zone.." with logistics", self.Config.XP_CAPTURE, 1, zone.zone)
end

--- Creates a new player-joinable A2A mission.
function DynamicTasking:GenerateA2AMission(contact)
    if #self.ActiveMissions >= self.Config.MaxMissions then return end
    local groupName = contact.groupname
    local enemyGroup = GROUP:FindByName(groupName)
    if not enemyGroup or not enemyGroup:IsAlive() then return end
    enemyGroup:HandleEvent( EVENTS.Crash, self.A2AMissionEventCrashOrDead )
    enemyGroup:HandleEvent( EVENTS.UnitLost, self.A2AMissionEventCrashOrDead )
    enemyGroup:HandleEvent( EVENTS.RemoveUnit, self.A2AMissionEventCrashOrDead )
    enemyGroup:HandleEvent( EVENTS.Land, self.A2AMissionEventCrashOrDead )
    enemyGroup:HandleEvent( EVENTS.Dead, self.A2AMissionEventCrashOrDead )
    
    self:CreateMission("INTERCEPT", enemyGroup, "Intercept and destroy "..contact.platform.. " (" ..contact.typename.. ")", self.Config.XP_INTERCEPT, enemyGroup:GetSize())
    env.info("DynamicTasking:A2AMissionEventCrashOrDead - Event fired before: " ..enemyGroup)
end

function DynamicTasking:A2AMissionEventCrashOrDead(eventData)
    env.info(string.format("DynamicTasking:A2AMissionEventCrashOrDead - Event fired: TgtGroup: %s, TgtUnit: %s, TgtGroupName: %s", eventData.TgtGroup, eventData.TgtUnit, eventData.TgtGroupName))
end

--- Creates a new player-joinable Runway Attack mission.
function DynamicTasking:GenerateRunwayAttackMission(airbaseName, requiredHits)
    -- Check constraints before creating the mission
    local runwayMissionCount = 0
    local isTargetAlreadyActive = false
    for code, mission in pairs(self.ActiveMissions) do
        if mission.type == "RUNWAY" then
            runwayMissionCount = runwayMissionCount + 1
            if mission.zoneName == airbaseName then
                isTargetAlreadyActive = true
                break
            end
        end
    end

    if runwayMissionCount >= 2 then
        env.info("DynamicTasking: Max runway missions (2) already active. Cannot create new one.")
        return false
    end

    if isTargetAlreadyActive then
        env.info("DynamicTasking: Runway mission for " .. airbaseName .. " already exists. Cannot create duplicate.")
        return false
    end

    if #self.ActiveMissions >= self.Config.MaxMissions then return end
    local airbase = AIRBASE:FindByName(airbaseName)
    if not airbase then
        env.error("DynamicTasking:GenerateRunwayAttackMission - Airbase not found: " .. airbaseName)
        return
    end

    -- For simplicity, let's target the first runway. You could extend this to randomly pick one.
    local runways = airbase:GetRunways()
    local runway = nil
    if runways[0] ~= nil then
        runway = runways[0]
    else
        runway = runways[1]
    end

    if not runway then
        env.error("DynamicTasking:GenerateRunwayAttackMission - No runways found for airbase: " .. airbaseName)
        return
    end

    env.info("DynamicTasking:GenerateRunwayAttackMission - Runway found: " ..runway.zone:GetName().. " Runway name: " ..runway.name)

    self:CreateMission("RUNWAY", runway, "Destroy runway " .. runway.name .. " at " .. airbaseName, self.Config.XP_RUNWAY, requiredHits or 3, airbaseName)
    return true -- Mission successfully created
end

--- Generic internal mission creation function.
-- For CAS, targetIdentifier is the zoneName string. For others, it's a MOOSE object.
-- This function was previously modified to include an immediate menu refresh.
function DynamicTasking:CreateMission(type, targetIdentifier, description, xpValue, requiredKills, zoneName, targetUnits)
    local mission = {
        joinCode = self:GenerateCode(), type = type, description = description, xpValue = xpValue,
        assignedPlayers = {}, 
        requiredKills = requiredKills,
        zoneName = zoneName or (targetIdentifier and targetIdentifier.zone) or "N/A",
        killCount = 0,      -- Used for CAS missions
        killedUnits = {},   -- Used for CAS to track unique kills
        bombHits = 0        -- Used for RUNWAY missions
    }

    if type == "CAS" then
        mission.targetObject = nil -- No specific MOOSE object for CAS target; it's zone-based.
        mission.targetUnits = targetUnits or {} -- Store the list of target units for this CAS mission

        -- Assign individual CAS units to self.AssignedTargets
        for unitName, _ in pairs(mission.targetUnits) do
            env.info(string.format("DynamicTasking:CreateMission - CAS Mission %s: Assigning target unit '%s'.", mission.joinCode, unitName))
            self.AssignedTargets[unitName] = mission.joinCode
        end
    elseif type == "RUNWAY" then
        mission.targetObject = targetIdentifier -- This is a runway table from the AIRBASE object
        if targetIdentifier and targetIdentifier.zone then
            self.AssignedTargets[targetIdentifier.zone:GetName()] = mission.joinCode
        end
    else
        mission.targetObject = targetIdentifier -- This is a MOOSE GROUP, STATIC, ZONE, or TARGET object
        mission.initialUnitCount = (targetIdentifier.GetSize and targetIdentifier:GetSize()) or 1

        -- NEW: Logic for SEAD primary target
        if type == "SEAD" and targetIdentifier.ClassName == "GROUP" then
            local primaryRadarUnit = nil
            -- Prioritize Track Radar (SAM TR) as the primary target
            local unitsInGroup = targetIdentifier:GetUnits()
            for _, unit in ipairs(unitsInGroup) do
                if unit:HasAttribute("SAM TR") then
                    primaryRadarUnit = unit
                    break -- Stop iterating, found primary
                end
            end
            -- If no SAM TR, look for LR, MR, SR
            if not primaryRadarUnit then
                -- Iterate through the units again to find other SAM types
                -- (A single loop with multiple checks could be slightly more efficient,
                -- but this matches the original logic flow for clarity)
                for _, unit in ipairs(unitsInGroup) do
                    if unit:HasAttribute("SAM LR") or unit:HasAttribute("SAM MR") or unit:HasAttribute("SAM SR") then
                        primaryRadarUnit = unit
                        break
                    end
                end
            end

            if primaryRadarUnit then
                mission.primaryRadarUnit = primaryRadarUnit
                mission.requiredKills = 1 -- Only one unit (the radar) needs to be destroyed
                env.info(string.format("DynamicTasking:CreateMission - SEAD Mission %s: Primary radar unit set to '%s'.", mission.joinCode, primaryRadarUnit:GetName()))
            else
                -- Fallback if no specific radar unit is found (shouldn't happen if it passed SEAD pool filter)
                env.warn(string.format("DynamicTasking:CreateMission - SEAD Mission %s: No specific primary radar unit found. Falling back to group destruction.", mission.joinCode))
            end
        end

        -- Keep AssignedTargets for non-CAS missions if they target specific groups/statics
        -- Assign the target entity to self.AssignedTargets
        if targetIdentifier and (targetIdentifier.ClassName == "GROUP" or targetIdentifier.ClassName == "STATIC") then
            env.info(string.format("DynamicTasking:CreateMission - Non-CAS Mission %s (%s): Assigning target '%s' (Class=%s, InitialUnits=%d).", mission.joinCode, type, targetIdentifier:GetName(), targetIdentifier.ClassName, mission.initialUnitCount))
            self.AssignedTargets[targetIdentifier:GetName()] = mission.joinCode
        elseif targetIdentifier and targetIdentifier.ClassName == "TARGET" then
            -- If TARGET missions are to be tracked, iterate through their constituent groups/statics
            -- For now, assuming TARGET missions are not explicitly tracked in AssignedTargets for simplicity
            -- If they were, this block would need to iterate and assign each sub-target.
            -- Example: for _, group in pairs(targetIdentifier:GetObjects()) do self.AssignedTargets[group:GetName()] = mission.joinCode end
        end
    end

    self.ActiveMissions[mission.joinCode] = mission
    MESSAGE:New(string.format("New Mission Available: [%s - %s] %s", type, mission.joinCode, description), 30, "Tasking Update"):ToAll()
    self:UpdateAllPlayerMenus() -- Immediate refresh after mission creation
end

--- Central function to complete a mission by its code.
function DynamicTasking:CompleteMission(missionCode, objectiveMet)
    local mission = self.ActiveMissions[missionCode]
    if not mission then return end

    if objectiveMet and #mission.assignedPlayers > 0 then
        local playerList = table.concat(mission.assignedPlayers, ", ")
        local messageText = string.format("Objective Complete! %s. Players %s awarded %d XP.", mission.description, playerList, mission.xpValue)
        MESSAGE:New(messageText, 30, "Mission Accomplished"):ToAll()
        for _, playerName in pairs(mission.assignedPlayers) do
            if not self.PlayerXP[playerName] then self.PlayerXP[playerName] = {} end
            if not self.PlayerXP[playerName]["XP"] then self.PlayerXP[playerName]["XP"] = 0 end
            self.PlayerXP[playerName]["XP"] = self.PlayerXP[playerName]["XP"] + mission.xpValue
            -- Unassign player from this mission
            if self.PlayerAssignments[playerName] == missionCode then
                self.PlayerAssignments[playerName] = nil
            end
        end
    elseif objectiveMet and #mission.assignedPlayers == 0 then -- Objective met but no one assigned
        MESSAGE:New(string.format("Objective Complete! %s. No players were assigned to receive XP.", mission.description), 30, "Objective Met"):ToAll()
    end
    
    -- Clear AssignedTargets for the completed mission
    if mission.type ~= "CAS" and mission.targetObject then
        local targetObject = mission.targetObject
        if (targetObject.ClassName == "GROUP" or targetObject.ClassName == "STATIC") then
            self.AssignedTargets[targetObject:GetName()] = nil
        elseif targetObject.ClassName == "TARGET" then
            -- If TARGET missions were tracked, clear their constituent groups/statics
            -- Example: for _, group in pairs(targetObject:GetObjects()) do self.AssignedTargets[group:GetName()] = nil end
        end
    elseif mission.type == "CAS" then
        -- Clear all initial CAS units from AssignedTargets
        for unitName, _ in pairs(mission.targetUnits) do
            self.AssignedTargets[unitName] = nil
        end
    elseif mission.type == "RUNWAY" then
        -- Clear runway zone from AssignedTargets
        if mission.targetObject and mission.targetObject.zone then
            self.AssignedTargets[mission.targetObject.zone:GetName()] = nil
        end
    end

    self.ActiveMissions[missionCode] = nil
end

--- Allows a player to leave their currently joined mission.
function DynamicTasking:LeaveMission(playerName, unitObject)
    local currentAssignedMissionCode = self.PlayerAssignments[playerName]
    if not currentAssignedMissionCode then
        MESSAGE:New("You are not currently assigned to any mission.", 15):ToUnit(unitObject)
        return
    end

    local mission = self.ActiveMissions[currentAssignedMissionCode]
    if mission then
        -- Remove player from mission's assigned list
        for i, pName in ipairs(mission.assignedPlayers) do
            if pName == playerName then
                table.remove(mission.assignedPlayers, i)
                break
            end
        end
        self.PlayerAssignments[playerName] = nil
        MESSAGE:New(string.format("You have left mission [%s - %s].", mission.type, mission.joinCode), 20):ToUnit(unitObject)
    end
end

--- The scheduler that checks for mission completion.
function DynamicTasking:MissionMonitor()
    env.info("DynamicTasking:MissionMonitor - Checking active missions.")
    local missionsToComplete = {}

    for code, mission in pairs(self.ActiveMissions) do
        local isComplete = false
        local objectiveMet = true
        env.info(string.format("DynamicTasking:MissionMonitor - Processing mission: [%s - %s] %s", mission.type, mission.joinCode, mission.description))

        if mission.type == "CAPTURE" then -- CAPTURE uses a MOOSE ZONE object as targetObject
            if not mission.targetObject then 
                isComplete = true; objectiveMet = false; 
            else
                local zone = mission.targetObject
                env.info(string.format("DynamicTasking:MissionMonitor - CAPTURE Mission %s: Zone '%s' current side: %s.", mission.joinCode, zone:GetName(), tostring(zone.side)))
                if zone and zone.side == 2 then -- Assuming player coalition is BLUE (side 2)
                    isComplete = true
                elseif zone and zone.side == 1 then -- Zone captured by RED (side 1)
                    isComplete = true; objectiveMet = false
                    MESSAGE:New(string.format("Capture mission for %s failed. Zone was captured by the enemy.", mission.zoneName), 20, "Mission Failed"):ToAll()
                end
            end
        
        elseif mission.type == "SEAD" and mission.primaryRadarUnit and not mission.primaryRadarUnit:IsAlive() then
            isComplete = true
            objectiveMet = true
            env.info(string.format("DynamicTasking:MissionMonitor - SEAD Mission %s: Primary radar unit '%s' destroyed.", mission.joinCode, mission.primaryRadarUnit:GetName()))
        
        elseif mission.type == "CAS" and (mission.killCount or 0) >= mission.requiredKills then
            isComplete = true
            env.info(string.format("DynamicTasking:MissionMonitor - CAS Mission %s progress: %d/%d kills.", mission.joinCode, (mission.killCount or 0), mission.requiredKills))
        elseif mission.type == "RUNWAY" and (mission.bombHits or 0) >= mission.requiredKills then
            isComplete = true
            env.info(string.format("DynamicTasking:MissionMonitor - RUNWAY Mission %s progress: %d/%d hits.", mission.joinCode, (mission.bombHits or 0), mission.requiredKills))
        
        elseif mission.type ~= "CAS" and mission.type ~= "CAPTURE" and mission.type ~= "RUNWAY" and (not mission.targetObject or not mission.targetObject:IsAlive()) then
            isComplete = true
            objectiveMet = not mission.targetObject -- if targetObject is nil, it's a failure.
            local targetName = mission.targetObject and mission.targetObject:GetName() or "N/A"
            local targetAlive = mission.targetObject and mission.targetObject:IsAlive()
            local initialUnits = mission.initialUnitCount or 1
            local currentAliveUnits = (mission.targetObject and mission.targetObject.CountAliveUnits and mission.targetObject:CountAliveUnits()) or (targetAlive and 1 or 0)

            env.info(string.format("DynamicTasking:MissionMonitor - Non-CAS/CAPTURE Mission %s (%s) target '%s' alive: %s. Initial units: %d, Current alive: %d", mission.joinCode, mission.type, targetName, tostring(targetAlive), initialUnits, currentAliveUnits))
            if isComplete then
                env.info(string.format("DynamicTasking:MissionMonitor - Mission %s (%s) marked complete. Objective met: %s", mission.joinCode, mission.type, tostring(objectiveMet)))
            end
        end

        if isComplete then
            table.insert(missionsToComplete, {code = code, met = objectiveMet})
        end
    end
    
    for _, m in ipairs(missionsToComplete) do
        self:CompleteMission(m.code, m.met)
    end
end

--- Handles the logic of joining a mission
function DynamicTasking:JoinMission(playerName, unitObject, mission)
    -- Check if player is already assigned to ANY mission
    local currentAssignedMissionCode = self.PlayerAssignments[playerName]
    if currentAssignedMissionCode then
        local currentAssignedMission = self.ActiveMissions[currentAssignedMissionCode]
        if currentAssignedMission and currentAssignedMission.joinCode ~= mission.joinCode then
            MESSAGE:New(string.format("You are already assigned to mission [%s - %s]. Please leave or complete it before joining another.",
                currentAssignedMission.type, currentAssignedMission.joinCode), 20):ToUnit(unitObject)
            return
        elseif not currentAssignedMission then -- Ghost assignment, mission might have been completed/removed
            self.PlayerAssignments[playerName] = nil -- Clear ghost assignment
            MESSAGE:New("Your previous mission has been completed or removed. You are now free to join a new one.", 20):ToUnit(unitObject)
        end
    end

    -- Check if player is already assigned to THIS specific mission
    for _, assignedPlayer in pairs(mission.assignedPlayers) do
        if assignedPlayer == playerName then
            MESSAGE:New("You are already assigned to this mission.", 15):ToUnit(unitObject)
            return
        end
    end

    table.insert(mission.assignedPlayers, playerName)
    self.PlayerAssignments[playerName] = mission.joinCode

    env.info("Mission joined: " ..self.PlayerAssignments[playerName])

    MESSAGE:New(string.format("You have joined mission [%s - %s]. Good luck.", mission.type, mission.joinCode), 20):ToUnit(unitObject)

    local unitGroup = unitObject:GetGroup()
    if unitGroup then
        local groupName = unitGroup:GetName()
        if groupName then
            self:BuildRadioMenuForGroup(groupName)
        end
    end
end

--- MODIFIED: Build and display a filtered list of missions as a single text message.
-- @param playerGroup (MOOSE GROUP object) The group to send the message to.
-- @param missionType (string) The type of mission to display (e.g., "CAS", "SEAD").
function DynamicTasking:DisplayMissionList(playerGroup, missionType)
    local messageParts = { string.format("--- AVAILABLE %s MISSIONS ---\n", missionType) }
    local hasMissions = false
    
    for code, mission in pairs(self.ActiveMissions) do
        if mission.type == missionType then
            hasMissions = true
            local playersString = "None"
            if #mission.assignedPlayers > 0 then
                playersString = table.concat(mission.assignedPlayers, "\n  - ")
                playersString = "\n  - " .. playersString
            end
            table.insert(messageParts, "----------------------------------------\n")
            table.insert(messageParts, string.format("ID: %s\n", mission.joinCode))
            table.insert(messageParts, string.format("TASK: %s\n", mission.type))
            table.insert(messageParts, string.format("Zone: %s\n", mission.zoneName))
            table.insert(messageParts, string.format("Description:\n  %s\n", mission.description))
            table.insert(messageParts, string.format("Assigned Players: %s\n", playersString))
        end
    end
    
    if not hasMissions then 
        table.insert(messageParts, string.format("No %s missions available at this time.", missionType))
    else
        table.insert(messageParts, "----------------------------------------\n")
    end
    
    local message = table.concat(messageParts)
    if playerGroup and playerGroup:IsAlive() then 
        MESSAGE:New(message, 90, "Available Tasking"):ToGroup(playerGroup) 
    end
end

--- Displays the details of the player's currently joined mission.
function DynamicTasking:DisplayCurrentMission(playerGroup)
    local unitObject = playerGroup:GetUnit(1)
    if not (unitObject and unitObject:IsAlive()) then return end
    local playerName = unitObject:GetPlayerName()
    if not playerName then return end

    local foundMission = nil
    for code, mission in pairs(self.ActiveMissions) do
        for _, assignedPlayer in pairs(mission.assignedPlayers) do
            if assignedPlayer == playerName then
                foundMission = mission; break
            end
        end
        if foundMission then break end
    end

    local messageParts = {}
    if foundMission then
        local playersString = "None"
        if #foundMission.assignedPlayers > 0 then
             playersString = table.concat(foundMission.assignedPlayers, "\n  - ")
             playersString = "\n  - " .. playersString
        end
        table.insert(messageParts, "--- MY CURRENT MISSION ---\n")
        table.insert(messageParts, "----------------------------------------\n")
        table.insert(messageParts, string.format("ID: %s\n", foundMission.joinCode))
        table.insert(messageParts, string.format("TASK: %s\n", foundMission.type))
        table.insert(messageParts, string.format("Zone: %s\n", foundMission.zoneName))
        table.insert(messageParts, string.format("Description:\n  %s\n", foundMission.description))
        
        -- Add progress display based on mission type
        if foundMission.type == "CAS" then
            table.insert(messageParts, string.format("Progress: %d/%d units destroyed.\n", (foundMission.killCount or 0), foundMission.requiredKills))
        elseif foundMission.type == "SEAD" or foundMission.type == "STRIKE" or foundMission.type == "INTERCEPT" then
            if foundMission.targetObject and foundMission.targetObject:IsAlive() then
                local currentCount = 0
                if foundMission.targetObject.GetSize then -- It's a GROUP
                    currentCount = foundMission.targetObject:GetSize()
                else -- It's a STATIC
                    currentCount = 1
                end
                local kills = (foundMission.initialUnitCount or 0) - currentCount
                table.insert(messageParts, string.format("Progress: %d/%d units destroyed.\n", kills, foundMission.initialUnitCount))
            else
                table.insert(messageParts, "Progress: Target destroyed.\n")
            end
        elseif foundMission.type == "CAPTURE" then
            local zone = foundMission.targetObject
            local coalitionName = (zone.side == 1 and "Red") or (zone.side == 2 and "Blue") or "Neutral"
            table.insert(messageParts, string.format("Progress: Zone is currently held by %s.\n", coalitionName))
        end

        table.insert(messageParts, string.format("Assigned Players: %s\n", playersString))
        table.insert(messageParts, "----------------------------------------\n")
    else
        table.insert(messageParts, "You are not currently assigned to any mission.")
    end
    local message = table.concat(messageParts)
    MESSAGE:New(message, 60, "Current Mission"):ToGroup(playerGroup)
end

--- Event handler for unit kills, to track CAS mission progress.
function DynamicTasking:OnUnitKilled(event)
    local victimObject = event.TgtUnit
    local killerObject = event.IniUnit

    local victimName = victimObject and victimObject:GetName() or "N/A"
    local killerPlayerName = killerObject and (killerObject:GetPlayerName() or (killerObject:GetGroup() and killerObject:GetGroup():GetPlayerName())) or "N/A"
    local killerUnitName = killerObject and killerObject:GetName() or "N/A"

    env.info(string.format("DynamicTasking:OnUnitKilled - Victim: %s, Killer: %s (Player: %s)", victimName, killerUnitName, killerPlayerName))

    if not victimObject then
        env.info("DynamicTasking:OnUnitKilled: Victim object is nil. Exiting.")
        return
    end

    -- Check if the victim is part of any active mission's assigned targets (for non-CAS missions)
    local assignedMissionCode = DynamicTasking.AssignedTargets[victimName]
    if assignedMissionCode then
        local mission = DynamicTasking.ActiveMissions[assignedMissionCode]
        if mission and mission.type ~= "CAS" then
            env.info(string.format("DynamicTasking:OnUnitKilled - Unit '%s' is a target for mission [%s - %s]. This is a non-CAS mission.", victimName, mission.type, mission.joinCode))
            if mission.targetObject and mission.targetObject.CountAliveUnits then
                env.info(string.format("DynamicTasking:OnUnitKilled - Mission '%s' target group '%s' current alive units: %d", mission.joinCode, mission.targetObject:GetName(), mission.targetObject:CountAliveUnits()))
            end
        end
    end

    local victimName = victimObject:GetName()
    if not victimName then return end

    local killerPlayerName = killerObject:GetPlayerName()
    if not killerPlayerName and killerObject:GetGroup() and killerObject:GetGroup():GetPlayerName() then
        killerPlayerName = killerObject:GetGroup():GetPlayerName()
    end

    for code, mission in pairs(DynamicTasking.ActiveMissions) do
        if mission.type == "CAS" then
            -- NEW: Check if the victim's name is in our target list for this mission.
            if mission.targetUnits and mission.targetUnits[victimName] then
                env.info("OnUnitKilled: Victim " .. victimName .. " is a valid target for CAS mission " .. code)
                
                if not mission.killedUnits[victimName] then
                    mission.killCount = (mission.killCount or 0) + 1
                    mission.killedUnits[victimName] = true
                    
                    local killerDisplayName = "an allied force" -- Default
                    if killerPlayerName then
                        killerDisplayName = killerPlayerName
                    elseif killerObject:IsAlive() then
                        local killerCoalition = killerObject:GetCoalition()
                        if killerCoalition == coalition.side.BLUE then -- Assuming players are BLUE
                            killerDisplayName = "Blue forces"
                        elseif killerCoalition == coalition.side.RED then
                            killerDisplayName = "Red forces"
                        end
                    end
                else
                    env.info("OnUnitKilled: Victim " .. victimName .. " already counted as killed for this mission.")
                end
            end
        end
    end
end

--- Event handler for weapon shots, to track bombs for runway attack missions.
function DynamicTasking:OnWeaponShot(event)
    local killerObject = event.IniUnit
    if not killerObject then return end

    local killerPlayerName = killerObject:GetPlayerName()
    if not killerPlayerName then return end

    local assignedMissionCode = DynamicTasking.PlayerAssignments[killerPlayerName]
    if not assignedMissionCode then return end

    local mission = DynamicTasking.ActiveMissions[assignedMissionCode]
    if not mission or mission.type ~= "RUNWAY" then return end

    local weapon = WEAPON:New(event.Weapon)
    if weapon:IsBomb() then
        env.info(string.format("DynamicTasking:OnWeaponShot - Tracking bomb for player %s for RUNWAY mission %s", killerPlayerName, mission.joinCode))
        weapon:StartTrack()
        weapon:SetFuncImpact(DynamicTasking.OnBombImpact, DynamicTasking, mission.joinCode)
    end
end

--- Callback for when a tracked bomb impacts.
function DynamicTasking:OnBombImpact(weapon, missionCode)
    local mission = DynamicTasking.ActiveMissions[missionCode]
    if not mission or mission.type ~= "RUNWAY" then return end

    local impactCoord = weapon:GetImpactCoordinate()
    if mission.targetObject.zone:IsCoordinateInZone(impactCoord) then
        mission.bombHits = (mission.bombHits or 0) + 1
        env.info(string.format("DynamicTasking:OnBombImpact - Runway hit for mission %s! Total hits: %d/%d", mission.joinCode, mission.bombHits, mission.requiredKills))
    end
end

--- REWRITTEN: Builds the F10 radio menu with organized sub-menus.
function DynamicTasking:BuildRadioMenuForGroup(groupName)
    local playerGroup = GROUP:FindByName(groupName)
    if not playerGroup or playerGroup:GetSize() == 0 then return end
    local groupID = playerGroup:GetID()
    if self.GroupMenus[groupID] then self.GroupMenus[groupID]:Remove() end
    local mainMenu = MENU_GROUP:New(playerGroup, "Dynamic Missions")
    self.GroupMenus[groupID] = mainMenu
    
    -- 1. Create the "Show Missions" parent menu.
    local showMissionMenu = MENU_GROUP:New(playerGroup, "Show Active Missions", mainMenu)
    
    -- 2. Find what types of missions are currently available.
    local availableTypes = {}
    for _, mission in pairs(self.ActiveMissions) do
        availableTypes[mission.type] = true
    end
    
    -- 3. Create a sub-menu for each available type.
    if next(availableTypes) == nil then -- Check if availableTypes is empty
        MENU_GROUP:New(playerGroup, "No mission types available.", showMissionMenu)
    else
        for type, _ in pairs(availableTypes) do
            local typeMenuText = string.format("%s Missions", type)
            -- The action calls our modified DisplayMissionList function with the specific type.
            MENU_GROUP_COMMAND:New(playerGroup, typeMenuText, showMissionMenu, function() self:DisplayMissionList(playerGroup, type) end)
        end
    end
    
    -- 4. Create the "Join" menu as before.
    local joinMissionMenu = MENU_GROUP:New(playerGroup, "Join Active Mission", mainMenu)
    local hasMissionsToJoin = false
    for code, mission in pairs(self.ActiveMissions) do
        hasMissionsToJoin = true
        local menuText = string.format("[%s - %s] %s", mission.type, mission.joinCode, mission.description)
        local action = function()
            local unitObject = playerGroup:GetUnit(1)
            if not (unitObject and unitObject:IsAlive()) then return end
            local playerName = unitObject:GetPlayerName()
            if playerName then
                self:JoinMission(playerName, unitObject, mission)
            end
        end
        MENU_GROUP_COMMAND:New(playerGroup, menuText, joinMissionMenu, action)
    end
    if not hasMissionsToJoin then
        MENU_GROUP:New(playerGroup, "No missions currently available to join.", joinMissionMenu)
    end
    
    -- 5. Add the "My Current Mission" command.
    MENU_GROUP_COMMAND:New(playerGroup, "My Current Mission", mainMenu, function() self:DisplayCurrentMission(playerGroup) end)

    -- 6. Add "Leave Mission" command if player is assigned to one
    local unitObject = playerGroup:GetUnit(1)
    if unitObject and unitObject:IsAlive() then
        local playerName = unitObject:GetPlayerName()
        if self.PlayerAssignments then env.info("LEAVE MISSION: player assignment: " ..tostring(self.PlayerAssignments[playerName])) end
        if playerName and self.PlayerAssignments and self.PlayerAssignments[playerName] then
            MENU_GROUP_COMMAND:New(playerGroup, "Leave Current Mission", mainMenu, function() self:LeaveMission(playerName, unitObject) end)
        end
    else
        if not unitObject then env.info("LEAVE MISSION: UnitObj is nil") end
        if unitObject then env.info("LEAVE MISSION: is unit alive: " ..unitObject:IsAlive()) end
    end
end

--- Automatically refreshes menus for all active players by rebuilding them.
function DynamicTasking:UpdateAllPlayerMenus()
    local activePlayerGroups = {}
    local playersBlue = coalition.getPlayers(coalition.side.BLUE)
    local playersRed = coalition.getPlayers(coalition.side.RED) -- Add if you have red players

    local allPlayers = {}
    for _, p in ipairs(playersBlue) do table.insert(allPlayers, p) end
    for _, p in ipairs(playersRed) do table.insert(allPlayers, p) end

    for _, unitData in ipairs(allPlayers) do
        if unitData then
            local unitName = unitData:getName()
            if type(unitName) == "string" and unitName ~= "" then
                local unitObj = UNIT:FindByName(unitName)
                if unitObj then
                    local isUnitAlive = unitObj:IsAlive()
                    if isUnitAlive then
                        local groupObj = unitObj:GetGroup()
                        if groupObj then
                            activePlayerGroups[groupObj:GetName()] = true
                        end
                    end
                end
            end
        end
    end

    for groupName, _ in pairs(activePlayerGroups) do
        self:BuildRadioMenuForGroup(groupName)
    end
end

--- Event handler for player leaving unit, to clear their mission assignment.
function DynamicTasking:OnPlayerLeaveUnit(event)
    local unitObject = event.IniUnit
    local playerName = unitObject:GetPlayerName() -- Get player name even if unit is no longer alive

    if playerName then
        local currentAssignedMissionCode = DynamicTasking.PlayerAssignments[playerName]
        if currentAssignedMissionCode then
            local mission = DynamicTasking.ActiveMissions[currentAssignedMissionCode]
            if mission then
                -- Remove player from mission's assigned list
                for i, pName in ipairs(mission.assignedPlayers) do
                    if pName == playerName then
                        table.remove(mission.assignedPlayers, i)
                        break
                    end
                end
                env.info(string.format("OnPlayerLeaveUnit: Removed %s from mission [%s - %s].", playerName, mission.type, mission.joinCode))
            end
            DynamicTasking.PlayerAssignments[playerName] = nil -- Clear player's overall assignment
            env.info(string.format("OnPlayerLeaveUnit: Cleared player assignment for %s.", playerName))
        end
    end
end

--- Persistence Functions
function DynamicTasking:LoadPersistentXP(mainState)
    if mainState and mainState.PlayerXP then self.PlayerXP=mainState.PlayerXP; MESSAGE:New("Dynamic Tasking: Loaded persistent Player XP data.",15):ToAll() end
end
function DynamicTasking:SavePersistentXP(stateToSave)
    if stateToSave then stateToSave.PlayerXP=self.PlayerXP end; return stateToSave
end

--- Main start function.
function DynamicTasking:Start()
    SCHEDULER:New(self, self.MissionMonitor, {}, 20, 15) -- Check missions every 15s, start after 20s
    SCHEDULER:New(self, self.UpdateAllPlayerMenus, {}, self.Config.MenuRefreshRate, 30) -- Refresh menus, start after 30s
    _EVENTDISPATCHER:HandleEvent(EVENTS.Kill, self.OnUnitKilled, self) -- Register kill event handler
    _EVENTDISPATCHER:HandleEvent(EVENTS.PlayerLeaveUnit, self.OnPlayerLeaveUnit, self)
    _EVENTDISPATCHER:HandleEvent(EVENTS.Shot, self.OnWeaponShot, self)
    
    MESSAGE:New("Dynamic Tasking Framework Initialized.", 15):ToAll()
end

-- Example of how to use the framework:
-- DynamicTasking:Start()
-- DynamicTasking:GenerateA2GMissionForZone({zone = "ZoneName1", side = 1}) -- Example for a red zone
-- DynamicTasking:GenerateCaptureMission({zone = "NeutralZone", side = 0})
-- DynamicTasking:GenerateA2AMission("EnemyBomberGroup")

-- To integrate with persistence:
-- local mainState = UTILS.LoadState()
-- DynamicTasking:LoadPersistentXP(mainState)
-- -- At mission end or periodically:
-- -- local stateToSave = {}
-- -- DynamicTasking:SavePersistentXP(stateToSave)
-- -- UTILS.SaveState(stateToSave)
