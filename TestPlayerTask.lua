DIGII_GROUND_PLAYER_TAKS = {
  ClassName = "DIGII_GROUND_PLAYER_TAKS"
}


-- Settings
_SETTINGS:SetPlayerMenuOn()
_SETTINGS:SetImperial()
_SETTINGS:SetA2G_BR()

-- Set up A2G task controller for the blue side named "82nd Airborne"
local taskmanager = PLAYERTASKCONTROLLER:New("82nd Airborne",coalition.side.BLUE,PLAYERTASKCONTROLLER.Type.A2GS)

-- Set the Info Task menu to be available
taskmanager:EnableTaskInfoMenu()

-- Set the menu to be called Eagle Eye
taskmanager:SetMenuName("A2G Mission")

-- Menu options:
-- Don't show the nfo Task menu when a player has joined a task.
-- Limit menu entries to top-5 per category
-- Hold menu refresh at least 45 seconds, when player has no task
taskmanager:SetMenuOptions(false,5,45)

-- Set option to use the full custom player callsign after the # on the group name.
-- If not available, call out the call sign and major flight number only.
taskmanager:SetCallSignOptions(true,true)

-- Set up using SRS
local hereSRSPath = "C:\\Program Files\\DCS-SimpleRadio-Standalone" -- location of the SRS installation folder, not the double \
local hereSRSPort = 5002 -- SRS server listening to port 5002

-- Set controller to use radio 130 and 255 AM, female voice, GB english, use "Microsoft Hazel" as voice pack (must be installed on your machine), volume 70%.
taskmanager:SetSRS({130.25,255.25},{radio.modulation.AM,radio.modulation.AM},hereSRSPath,"female","en-GB",hereSRSPort,"en-US-Wavenet-G",0.7, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\googlekey.json")

-- Controller will announce itself under these broadcast frequencies, handy to use cold-start frequencies here of your aircraft
taskmanager:SetSRSBroadcast({127.5,305},{radio.modulation.AM,radio.modulation.AM})

-- Set target radius
taskmanager:SetTargetRadius(1300)

-- auto-add map markers when tasks are added
function taskmanager:OnAfterTaskAdded(From,Event,To,Task)
  --local task = Task -- Ops.PlayerTask#PLAYERTASK
  --local coord = task.Target:GetCoordinate()
  --local taskID = string.format("Task ID #%03d | Type: %s | Threat: %d",task.PlayerTaskNr,task.Type,task.Target:GetThreatLevelMax())
  --local mark = MARKER:New(coord,taskID)
  --mark:ReadWrite()
  --mark:ToCoalition(taskmanager.Coalition)
end

----
local function ScanForObjectsInZone(zone)
  local zoneRadius = ZONE:FindByName(zone):GetRadius()

  local targetZone = ZONE:New(zone)
  local ttargetCord = targetZone:GetCoordinate()

  local foundUnits,foundStatics,foundScenery,scanedUnits,scanedStatics = ttargetCord:ScanObjects(zoneRadius + 200, true, true, false)

  return scanedUnits, scanedStatics
end

-----
local function FilterGroundUnitsByAttribute(unitList)
  if unitList == nil then return {}, {} end

  local GroundNormal = {}
  local GroundAA = {}

  local group = nil
  local attribute = nil
  for _,unit in pairs(unitList) do
    group = unit:GetGroup()
    attribute = group:GetAttribute()

    if (attribute == GROUP.Attribute.GROUND_AAA or attribute == GROUP.Attribute.GROUND_SAM) then
      table.insert(GroundAA, unit)
    else
      table.insert(GroundNormal, unit)
    end
  end

  return GroundNormal, GroundAA
end

-- [INTERNAL] Create Sead Task
local function _CreateSeadTask(unitList, zone, wp)
  local SEADTarget = TARGET:New()

  for _,unit in pairs(unitList) do
    SEADTarget:AddObject(unit)
  end

  local newtask = PLAYERTASK:New(AUFTRAG.Type.SEAD,SEADTarget,true,99,"Suppression of Enemy Air Defenses")

  local name = nil
  local freeText = nil
  if (wp == nil or wp == '') then
      name = 'SEAD AT: ' ..zone
      freeText = 'Clear the Area ('..zone..') of all Enemy Air Defenses!'
  else
      name = 'SEAD AT: ' ..zone.. ' at WP: ' ..wp
      freeText = 'Clear the Area ('..zone..') at WP:' ..wp.. ' of all Enemy Air Defenses!'
  end
  
  newtask:SetMenuName(name) -- name for the menu entry
  newtask:AddFreetext(freeText)

  taskmanager:AddPlayerTaskToQueue(newtask)
end

-- [INTERNAL] Craete CAS Task
local function _CreateCASTask(unitList, zone, wp)
  local GROUNDTarget = TARGET:New()

  for _,unit in pairs(unitList) do
        GROUNDTarget:AddObject(unit)
  end

  local newtask = PLAYERTASK:New(AUFTRAG.Type.CAS,GROUNDTarget,true,99,"Close Air Support")
  
  local name = nil
  local freeText = nil
  if (wp == nil or wp == '') then
      name = 'Attack ' ..zone
      freeText = 'Clear the Area ('..zone..') from all enemy Forces!'
  else
      name = 'Attack ' ..zone.. ' at WP: ' ..wp
      freeText = 'Clear the Area ('..zone..') at WP:' ..wp.. ' from all enemy Forces!'
  end
  
  newtask:SetMenuName(name) -- name for the menu entry
  newtask:AddFreetext(freeText)

  taskmanager:AddPlayerTaskToQueue(newtask)
end

-- [INTERNAL] Create BAI Task
local function _CreateBAITask(unitList, zone, wp)
  local GROUNDTarget = TARGET:New()

  for _,unit in pairs(unitList) do
    GROUNDTarget:AddObject(unit)
  end

  local newtask = PLAYERTASK:New(AUFTRAG.Type.BAI,GROUNDTarget,true,99,"Battle Air Interdiction")
  
  local name = nil
  local freeText = nil
  if (wp == nil or wp == '') then
      name = 'BAI Attack ' ..zone
      freeText = 'Clear the Area ('..zone..') from all enemy Forces!'
  else
      name = 'BAI Attack ' ..zone.. ' at WP: ' ..wp
      freeText = 'Clear the Area ('..zone..') at WP:' ..wp.. ' from all enemy Forces!'
  end
  
  newtask:SetMenuName(name) -- name for the menu entry
  newtask:AddFreetext(freeText)

  taskmanager:AddPlayerTaskToQueue(newtask)
end

-- Create a new CAS Main Task
function DIGII_GROUND_PLAYER_TAKS:NEW_ATTACK_TASK(zone, wp)

  local scanedUnits, scanedStatics = ScanForObjectsInZone(zone)

  if (scanedUnits) then

    local GroundTargets, AATargets = {}, {}

    GroundTargets, AATargets = FilterGroundUnitsByAttribute(scanedUnits)

    if AATargets then _CreateSeadTask(AATargets, zone, wp) end

    if (scanedStatics) then
      for _,v in pairs(scanedStatics) do
          table.insert(GroundTargets, STATIC:Find(v))
      end
    end

    if GroundTargets then _CreateCASTask(GroundTargets, zone, wp) end
  end
end

-- Create a new DEAD Main Task
function DIGII_GROUND_PLAYER_TAKS:NEW_SEAD_TASK(zone, wp)
  local scanedUnits, scanedStatics = ScanForObjectsInZone(zone)

  _CreateSeadTask(scanedUnits, zone, wp)
end

-- Create a new BAI Main Task
function DIGII_GROUND_PLAYER_TAKS:NEW_BAI_TASK(zone, wp)
  local scanedUnits, scanedStatics = ScanForObjectsInZone(zone)

  if (scanedStatics) then
    for _,v in pairs(scanedStatics) do
      table.insert(scanedUnits, STATIC:Find(v))
    end
  end

  _CreateBAITask(scanedUnits, zone, wp)
end

-- Create a new CAPTURE Main Task
function DIGII_GROUND_PLAYER_TAKS:NEW_CAPTURE_TAKS(zone, wp)

  if (zone == nil) then return end
  
  local opsZone = OPSZONE:New(ZONE:FindByName(zone), coalition.side.NEUTRAL)
  
  local newtask = PLAYERTASK:New(AUFTRAG.Type.CAPTUREZONE,opsZone,true,99,"Capture the zone")
  
  local name = nil
  local freeText = nil
  if (wp == nil or wp == '') then
      name = 'Capture ' ..zone
      freeText = zone ..' is neutral. Capture it by delivering supplies!'
  else
      name = 'Capture ' ..zone.. ' at WP: ' ..wp
      freeText = zone ..' at WP:' ..wp.. ' is neutral. Capture it by delivering supplies!'
  end
  
  newtask:SetMenuName(name) -- name for the menu entry
  newtask:AddFreetext(freeText)

  taskmanager:AddPlayerTaskToQueue(newtask)
end