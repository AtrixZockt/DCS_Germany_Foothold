BASE:I("CTLD : is loading.")

local my_ctld = CTLD:New(coalition.side.BLUE,{"CH.47", "UH.1H", "Hercules", "8MT", "Bronco.OV", "UH.60L", "Mi.24P", "OH58D"},"Lufttransportbrigade I")
local herccargo = CTLD_HERCULES:New("blue", "Hercules Test", my_ctld)
my_ctld.useprefix = true
my_ctld.dropcratesanywhere = true
my_ctld.forcehoverload = false
my_ctld.enableHercules = true
my_ctld.CrateDistance = 65
my_ctld.maximumHoverHeight = 20
my_ctld.minimumHoverHeight = 3
my_ctld.smokedistance = 5000
my_ctld.HercMinAngels = 155 -- for troop/cargo drop via chute in meters, ca 470 ft
my_ctld.HercMaxAngels = 2000 -- for troop/cargo drop via chute in meters, ca 6000 ft
my_ctld.HercMaxSpeed = 103 -- 77mps or 270kph or 150kn
my_ctld.dropAsCargoCrate = true
my_ctld.allowcratepickupagain = true
my_ctld.nobuildinloadzones = true
my_ctld.movecratesbeforebuild = false
my_ctld.movetroopstowpzone = true
my_ctld.enableChinhookGCLoading = true
my_ctld.hoverautoloading = false
my_ctld.enableslingload = true
my_ctld.ChinookTroopCircleRadius = 5
my_ctld.usesubcats = true
my_ctld.pilotmustopendoors = true
my_ctld.TroopUnloadDistGroundHook = 15
my_ctld.enableChinookGCLoading = true
my_ctld.buildtime = 30
my_ctld.showstockinmenuitems = false
my_ctld.basetype = "uh1h_cargo"
my_ctld.RadioSoundFC3 = "beaconsilent.ogg"
my_ctld:__Start(5)

my_ctld:AddTroopsCargo("technician Solider",{"CTLD_TROOPS_Engineers"},CTLD_CARGO.Enum.ENGINEERS,1,80,2)
my_ctld:AddCratesCargo("ATGM Mephisto(2 cr)",{"CTLD_CARGO_Mephisto"}, CTLD_CARGO.Enum.VEHICLE, 2, 1500,5, "ANTI TANK")
my_ctld:AddCratesCargo("ATGM Humvee(2 cr)",{"CTLD_CARGO_HMMWV"},CTLD_CARGO.Enum.VEHICLE,2,1000,5, "ANTI TANK")
my_ctld:AddCratesCargo("ATGM Bradly(2 cr)",{"CTLD_CARGO_Bradly"},CTLD_CARGO.Enum.VEHICLE,2,1500,5, "ANTI TANK")
my_ctld:AddCratesCargo("L118 (1 cr)",{"CTLD_CARGO_L118"},CTLD_CARGO.Enum.VEHICLE,1,700,5, "Support")
my_ctld:AddCratesCargo("Ammo Truck(2 cr)",{"CTLD_CARGO_AmmoTruck"},CTLD_CARGO.Enum.VEHICLE,2,800,5, "Support")
my_ctld:AddTroopsCargo("Squad 8",{"CTLD_TROOPS_ATS"},CTLD_CARGO.Enum.TROOPS,8,80,5)
my_ctld:AddTroopsCargo("Platoon 16",{"CTLD_TROOPS_Platon16"},CTLD_CARGO.Enum.TROOPS,16,80,5)
my_ctld:AddTroopsCargo("Platoon 32",{"CTLD_TROOPS_Platon1"},CTLD_CARGO.Enum.TROOPS,32,80,5)
my_ctld:AddTroopsCargo("Anti-Air Soldiers",{"CTLD_TROOPS_AA"},CTLD_CARGO.Enum.TROOPS,5,80,5)
my_ctld:AddTroopsCargo("Mortar Squad",{"CTLD_TROOPS_MRS"},CTLD_CARGO.Enum.TROOPS,6,80,5)
my_ctld:AddCratesCargo("Linebacker(2 cr)",{"CTLD_CARGO_Linebacker"},CTLD_CARGO.Enum.VEHICLE,2,1500,5, "SAM/AAA")
--my_ctld:AddCratesCargo("Tank Abrahams(5 cr)",{"CTLD_CARGO_TANK"},CTLD_CARGO.Enum.VEHICLE,5,1600,1, "ANTI TANK")
my_ctld:AddCratesCargo("Vulcan (2 cr)",{"CTLD_CARGO_Vulcan"}, CTLD_CARGO.Enum.VEHICLE, 2, 1500,5, "SAM/AAA")
my_ctld:AddCratesCargo("HAWK Site (4 cr)",{"CTLD_CARGO_HAWKSite"},CTLD_CARGO.Enum.VEHICLE,4,1900,5, "SAM/AAA")
my_ctld:AddCratesCargo("Nasam Site(4 cr)",{"CTLD_CARGO_NasamsSite"},CTLD_CARGO.Enum.VEHICLE,4,1900,5, "SAM/AAA")
my_ctld:AddCratesCargo("FARP (3 cr)",{"CTLD_TROOP_FOB"},CTLD_CARGO.Enum.FOB,3,1500,9)

-- How many of the units loaded from the save file should be spawned next time?
-- Oldest will be deleted first.
local MAX_AT_SPAWN = {

    ["Squad 8"] = 0,
    ["Platoon 16"] = 0,
    ["Platoon 32"] = 0,
    ["Anti-Air Soldiers"] = 1,
    ["Mortar Squad"] = 1,
    ["Ammo Truck(2 cr)"] = 2,
    ["Linebacker(2 cr)"] = 1,
    ["Vulcan (2 cr)"] = 1,
    ["HAWK Site (4 cr)"] = 1,
    ["Nasam Site(4 cr)"] = 1,
    ["technician Solider"] = 1,
    ["ATGM Mephisto(2 cr)"] = 2,
    ["ATGM Humvee(2 cr)"] = 2,
    ["ATGM Bradly(2 cr)"] = 2,
    ["Tank Abrahams(5 cr)"] = 0,
    ["L118 (1 cr)"] = 1,
}
-- How many farps do you want to load? 
-- Oldest will not be spawned if the number is exceded.
local MAX_SAVED_FARPS      = 2

-- ZONES


--my_ctld:AddCTLDZone("DropZone",CTLD.CargoZoneType.DROP,SMOKECOLOR.Orange,true,false)
my_ctld:AddCTLDZone("LHA Tarawa",CTLD.CargoZoneType.SHIP,SMOKECOLOR.Blue,true,false,240,20)
my_ctld:AddCTLDZone("CVN-72",CTLD.CargoZoneType.SHIP,SMOKECOLOR.Blue,true,false,240,20)
my_ctld:AddCTLDZone("CVN-73",CTLD.CargoZoneType.SHIP,SMOKECOLOR.Blue,true,false,240,20)

for _, zoneObj in ipairs(bc:getZones()) do
    local zoneName = zoneObj.zone
    if (not zoneName:lower():find("hidden")) and (not zoneName:find("Red Carrier"))
      and (not zoneName:find("Blue Carrier")) then
        my_ctld:AddCTLDZone(zoneName, CTLD.CargoZoneType.LOAD, SMOKECOLOR.Green, false, false)
        my_ctld:AddCTLDZone(zoneName, CTLD.CargoZoneType.MOVE, SMOKECOLOR.Green, true, false)
    end
end

function addCTLDZonesForBlueControlled(zoneName)
    if zoneName then
        local zoneObj = bc:getZoneByName(zoneName)
        if zoneObj and not zoneName:lower():find("hidden") and not zoneName:lower():find("dropzone") then
            if zoneObj.wasBlue then
                --env.info("Activating LOAD for zone: " .. tostring(zoneName))
                my_ctld:ActivateZone(zoneName, CTLD.CargoZoneType.LOAD)
                my_ctld:DeactivateZone(zoneName, CTLD.CargoZoneType.MOVE)
            else
                --env.info("Activating MOVE for zone: " .. tostring(zoneName))
                my_ctld:DeactivateZone(zoneName, CTLD.CargoZoneType.LOAD)
                my_ctld:ActivateZone(zoneName, CTLD.CargoZoneType.MOVE)
            end
        end
    else
        for _, zoneObj in ipairs(bc:getZones()) do
            local zName = zoneObj.zone
            if not zName:lower():find("hidden") and not zName:lower():find("dropzone") then
                if zoneObj.wasBlue then
                    --BASE:I("Activating LOAD for zone: " .. tostring(zName))
                    my_ctld:ActivateZone(zName, CTLD.CargoZoneType.LOAD)
                    my_ctld:DeactivateZone(zName, CTLD.CargoZoneType.MOVE)
                else
                    --BASE:I("Activating MOVE for zone: " .. tostring(zName))
                    my_ctld:DeactivateZone(zName, CTLD.CargoZoneType.LOAD)
                    my_ctld:ActivateZone(zName, CTLD.CargoZoneType.MOVE)
                end
            end
        end
    end
end

local scheduler = SCHEDULER:New(nil, function()
    addCTLDZonesForBlueControlled()
end, {}, 5)


my_ctld:SetUnitCapabilities("SA342Mistral", false, true, 0, 2, 10, 400)
my_ctld:SetUnitCapabilities("SA342L", false, true, 0, 2, 10, 400)
my_ctld:SetUnitCapabilities("SA342M", false, true, 0, 2, 10, 400)
my_ctld:SetUnitCapabilities("SA342Minigun", false, true, 0, 2, 10, 400)
my_ctld:SetUnitCapabilities("UH-1H", true, true, 1, 8, 15, 800)
my_ctld:SetUnitCapabilities("Mi-8MT", true, true, 2, 16, 15, 6000)
my_ctld:SetUnitCapabilities("Mi-8MTV2", true, true, 2, 18, 15, 6000)
my_ctld:SetUnitCapabilities("Ka-50", false, false, 0, 0, 15, 400)
my_ctld:SetUnitCapabilities("Mi-24P", true, true, 2, 8, 15, 1000)
my_ctld:SetUnitCapabilities("Mi-24V", true, true, 2, 8, 15, 1000)
my_ctld:SetUnitCapabilities("Hercules", true, true, 8, 20, 15, 20000)
my_ctld:SetUnitCapabilities("UH-60L", true, true, 2, 20, 16, 3500)
my_ctld:SetUnitCapabilities("AH-64D_BLK_II", false, false, 0, 0, 15, 400)
my_ctld:SetUnitCapabilities("CH-47Fbl1", true, true, 5, 32, 20, 10800)
my_ctld:SetUnitCapabilities("OH58D", false, false, 0, 0, 14, 400)


local TroopUnits = {}
local GroundUnits = {}
deployedTroopsSet = SET_GROUP:New()
zoneCaptureInfo = {}
deployedTroops = {}

     local FARPFreq = 129
     local FARPName = 1

     local FARPClearnames = {
       [1]="London",
       [2]="Dallas",
       [3]="Paris",
       [4]="Moscow",
       [5]="Berlin",
       [6]="Rome",
       [7]="Madrid",
       [8]="Warsaw",
       [9]="Dublin",
       [10]="Perth",
       }
local BuiltFARPCoordinates = {}
local SpawnedFARPsFromSave = 0

function BuildAFARP(Coordinate, stamp)
  local isFromSave = (stamp ~= nil)
  if isFromSave then
    if SpawnedFARPsFromSave >= MAX_SAVED_FARPS then
      return
    else
      SpawnedFARPsFromSave = SpawnedFARPsFromSave + 1
     
    end
  end

  local coord          = Coordinate
  local FarpNameNumber = ((FARPName - 1) % 10) + 1
  local FName          = FARPClearnames[FarpNameNumber]

  FARPFreq = FARPFreq + 1
  FARPName = FARPName + 1
  FName    = FName .. " FAT COW " .. tostring(FARPFreq) .. "AM"

  ZONE_RADIUS:New(FName, coord:GetVec2(), 150, false)
  UTILS.SpawnFARPAndFunctionalStatics(FName, coord, ENUMS.FARPType.INVISIBLE, my_ctld.coalition, country.id.USA, FarpNameNumber, FARPFreq, radio.modulation.AM, nil, nil, nil, 6000, 6000)
  
  my_ctld:AddCTLDZone(FName, CTLD.CargoZoneType.LOAD, SMOKECOLOR.Blue, true, false)
  MESSAGE:New(string.format("FARP %s in operation!", FName), 15, "CTLD"):ToBlue()
  my_ctld:RemoveStockCrates("CTLD_TROOP_FOB", 1)

  table.insert(BuiltFARPCoordinates,{name=FName,coord=Coordinate,timestamp=stamp or timer.getTime()})
end
function my_ctld:OnAfterCratesBuild(From, Event, To, Group, Unit, Vehicle)

    local currentTime = timer.getTime()
    local groupName   = Vehicle:GetName() or "unknown"

    if string.find(groupName,"CTLD_TROOP_FOB",1,true) then
        local Coord = Vehicle:GetCoordinate()
        Vehicle:Destroy(false)
        BuildAFARP(Coord)
        return
    end

    if not Group then return end

    local cargoName, stock = "unknown", 0

    for _, cargoData in pairs(self.Cargo_Crates) do
        if cargoData.Templates then
            local templateName = type(cargoData.Templates) == "table" and cargoData.Templates[1] or cargoData.Templates
            if string.find(groupName, templateName, 1, true) then
                if cargoData.CargoType == CTLD_CARGO.Enum.VEHICLE then
                    cargoName = cargoData:GetName()
                    stock     = cargoData:GetStock()
                end
                break
            end
        end
    end

    local maxTimestamp = 0
    for _, group in ipairs(GroundUnits) do
        if group.CargoName == cargoName and group.Timestamp > maxTimestamp then
            maxTimestamp = group.Timestamp
        end
    end

    local cargoObject      = self:_FindCratesCargoObject(cargoName)
    local currentStock     = cargoObject and cargoObject:GetStock() or 0
    local newTimestamp     = (maxTimestamp > 0) and (maxTimestamp + currentTime) or currentTime
    local configuredMax    = cargoObject and cargoObject:GetStock0() or 999
    self:I(string.format("OnAfterCratesBuild: cargoName=%s, stock0=%d, currentStock=%d", cargoName, configuredMax, currentStock))

    local groupExists = false
    for _, group in ipairs(GroundUnits) do
        if group.groupName == groupName then
            group.Timestamp = newTimestamp
            group.Stock     = currentStock
            groupExists     = true
            break
        end
    end

    if not groupExists then
        table.insert(GroundUnits, {
            groupName  = groupName,
            Timestamp  = newTimestamp,
            CargoName  = cargoName,
            Stock      = currentStock
        })
    end

    for _, g in ipairs(GroundUnits) do
        if g.CargoName == cargoName then
            g.Stock = currentStock
        end
    end

    if configuredMax > 1 then
        local oldestUnitIndex = nil
        local oldestTimestamp = math.huge
        for i, group in ipairs(GroundUnits) do
            if group.CargoName == cargoName
               and group.Timestamp < newTimestamp
               and group.Stock <= 1
            then
                if group.Timestamp < oldestTimestamp then
                    oldestTimestamp = group.Timestamp
                    oldestUnitIndex = i
                end
            end
        end

        if oldestUnitIndex then
            local oldestUnit = GroundUnits[oldestUnitIndex]
                                                       
            my_ctld:AddStockCrates(oldestUnit.CargoName, 1)
            local dcsGroup = GROUP:FindByName(oldestUnit.groupName)
            if dcsGroup and dcsGroup:IsAlive() then
                dcsGroup:Destroy()
            end
            table.remove(GroundUnits, oldestUnitIndex)
        end
    end
end

if lfs then
local FarpFileName = "DiGii_Foothold_CA_CTLD_FARPS.csv"

function SaveFARPS()
  local path = my_ctld.filepath
  local filename = FarpFileName
  local data = "FARP COORDINATES\n"

  local function sortingfunction(d1,d2)
   return d1.timestamp > d2.timestamp
  end
    
  table.sort(BuiltFARPCoordinates,sortingfunction)

  local counter = 0
  
  for _,_coord in pairs(BuiltFARPCoordinates) do
    local FName = _coord.name
    local coord = _coord.coord -- Core.Point#COORDINATE
    local AFB = STATIC:FindByName(FName,false)
    if AFB and AFB:IsAlive() then
      counter = counter + 1 -- increase counter
      local vec2 = coord:GetVec2() -- { x = self.x, y = self.z }
      data = data .. string.format("%f;%f;\n",vec2.x,vec2.y)
      if counter == FARPStock then break end -- stop creating data when we reached the ceiling
    end
  end
  
  if UTILS.SaveToFile(path,filename,data) then
    --BASE:I("***** FARP Positions saved successfully!")
  else
    BASE:E("***** ERROR Saving FARP Positions!")
  end
  
end
 
function LoadFARPS()
  local path = my_ctld.filepath
  local filename = FarpFileName
  local okay,data = UTILS.LoadFromFile(path,filename)
  local stamp = 0
  if okay then
    BASE:I("***** FARP Positions loaded successfully!")
    -- remove header
    table.remove(data, 1)
    for _,_entry in pairs(data) do
      local dataset = UTILS.Split(_entry,";")
      local x = tonumber(dataset[1])
      local y = tonumber(dataset[2])
      
      local coord = COORDINATE:NewFromVec2({x=x,y=y})
      stamp = stamp + 1
      BuildAFARP(coord,stamp)
    end
  else
    BASE:E("***** ERROR Loading FARP Positions!")
  end
end

local LoadFARPTimer = TIMER:New(LoadFARPS)
LoadFARPTimer:Start(5)

local SaveFARPTimer = TIMER:New(SaveFARPS)
SaveFARPTimer:Start(30,300)

my_ctld.enableLoadSave = true -- allow auto-saving and loading of files
my_ctld.saveinterval = 300 -- save every 10 minutes
my_ctld.filename = "DiGii_FootHold_CA_CTLD_Save.csv" -- example filename
my_ctld.filepath = lfs.writedir() .. "Missions\\Saves" -- example path
my_ctld.eventoninject = true -- fire OnAfterCratesBuild and OnAfterTroopsDeployed events when loading (uses Inject functions)
my_ctld.useprecisecoordloads = true -- Instead if slightly varyiing the group position, try to maintain it as is

function resetSaveFileAndFarp()
  -- 1) Overwrite the CTLD save file with empty data:
  local path     = my_ctld.filepath
  local fileName = my_ctld.filename
  if lfs and path then
    fileName = path .. "\\" .. fileName
  end
  local f = assert(io.open(fileName, "wb"))
  f:write("")
  f:close()
  
  -- 2) Overwrite the FARPs file with empty data too:
  local farpFile = FarpFileName
  if lfs and path then
    farpFile = path .. "\\" .. farpFile
  end
  local f2 = assert(io.open(farpFile, "wb"))
  f2:write("")
  f2:close()

  BuiltFARPCoordinates = {}
end

else
    MESSAGE:New("CTLD will not Save/load. Please, De-Sanitize DCS missionscripting.lua.\n\nfunctionality disabled.", 300):ToAll()
end

my_ctld:__Load(10)

function my_ctld:OnAfterLoaded(From, Event, To, LoadedGroups)
  self:I("***** Groups Loaded! *****")
  for i, _table in ipairs(LoadedGroups) do
    local groupName = _table.Group:GetName() or "unknown"
    local timeStamp = _table.TimeStamp or timer.getTime()
    local cargoName = tostring(_table.CargoName)
    local crateObject = self:_FindCratesCargoObject(cargoName)
    if crateObject then
      local currentStock = crateObject:GetStock() or 0
      local maxCrateThreshold = MAX_AT_SPAWN[cargoName] or 1
      table.insert(GroundUnits, {
        groupName  = groupName,
        Timestamp  = timeStamp,
        Group      = _table.Group,
        CargoName  = cargoName,
        Stock      = currentStock
      })
    end
    local troopObject = self:_FindTroopsCargoObject(cargoName)
    if troopObject then
      local currentStock = troopObject:GetStock() or 0
      local maxTroopThreshold = MAX_AT_SPAWN[cargoName] or 3
      table.insert(TroopUnits, {
        groupName  = groupName,
        Timestamp  = timeStamp,
        Group      = _table.Group,
        CargoName  = cargoName,
        Stock      = currentStock
      })
    end
  end

  local cratesByName = {}
  for _, crateData in ipairs(GroundUnits) do
    local cName = crateData.CargoName
    cratesByName[cName] = cratesByName[cName] or {}
    table.insert(cratesByName[cName], crateData)
  end

  for cargoName, groupList in pairs(cratesByName) do
    table.sort(groupList, function(a, b) return a.Timestamp < b.Timestamp end)
    local maxAllowed = MAX_AT_SPAWN[cargoName] or 0
    local totalFound = #groupList
    local excess     = totalFound - maxAllowed
    if excess > 0 then
      for i=1, excess do
        local oldest = groupList[i]
        local oldestGroupName = oldest.groupName
        local dcsGroup = GROUP:FindByName(oldestGroupName)
        if dcsGroup and dcsGroup:IsAlive() then
          dcsGroup:Destroy()
        end
        my_ctld:AddStockCrates(oldest.CargoName, 1)
        for idx, gu in ipairs(GroundUnits) do
          if gu.groupName == oldestGroupName then
            table.remove(GroundUnits, idx)
            break
          end
        end
      end
    end
  end

  local troopsByName = {}
  for _, troopData in ipairs(TroopUnits) do
    local tName = troopData.CargoName
    troopsByName[tName] = troopsByName[tName] or {}
    table.insert(troopsByName[tName], troopData)
  end

  for cargoName, groupList in pairs(troopsByName) do
    table.sort(groupList, function(a, b) return a.Timestamp < b.Timestamp end)
    local maxAllowed = MAX_AT_SPAWN[cargoName] or 0
    local totalFound = #groupList
    local excess     = totalFound - maxAllowed
    if excess > 0 then
      for i=1, excess do
        local oldest = groupList[i]
        local oldestGroupName = oldest.groupName
        local dcsGroup = GROUP:FindByName(oldestGroupName)
        if dcsGroup and dcsGroup:IsAlive() then
          dcsGroup:Destroy()
        end
        my_ctld:AddStockTroops(oldest.CargoName, 1)
        for idx, tu in ipairs(TroopUnits) do
          if tu.groupName == oldestGroupName then
            table.remove(TroopUnits, idx)
            break
          end
        end
      end
    end
  end

  if self.Spawned_Cargo then
    for i=#self.Spawned_Cargo,1,-1 do
      local c=self.Spawned_Cargo[i]
      local s=c:GetPositionable()
      if s and s:IsAlive() then
        s:Destroy(false)
      end
      table.remove(self.Spawned_Cargo,i)
    end
  end
  for uName,ld in pairs(self.Loaded_Cargo) do
    if ld and ld.Cargo then
      local newC={}
      local cNum=0
      for _,cg in ipairs(ld.Cargo) do
        local tp=cg:GetType()
        if tp==CTLD_CARGO.Enum.TROOPS or tp==CTLD_CARGO.Enum.ENGINEERS then
          table.insert(newC,cg)
        end
      end
      ld.Cargo=newC
      ld.Cratesloaded=cNum
      self.Loaded_Cargo[uName]=ld
    end
  end
end


zoneSet = SET_ZONE:New()
for _, zoneObj in ipairs(bc:getZones()) do
  local mooseZone = ZONE:New(zoneObj.zone)
  zoneSet:AddZone(mooseZone)
end

function playRandomSound(Group, soundCategory)
    local sounds = {
        unload = {
            "troops_unload_everybody_off.ogg",
            "troops_unload_get_off.ogg",
            "troops_unload_here_we_go.ogg",
            "troops_unload_moving_out.ogg",
            "troops_unload_thanks.ogg"
        },
        loading = {
            "troops_load_to_action.ogg",
            "troops_load_ready.ogg",
            "troops_load_ao.ogg",
        }
    }
    local selectedSounds = sounds[soundCategory]
    if selectedSounds then
        local randomIndex = math.random(1, #selectedSounds)
        local selectedSound = selectedSounds[randomIndex]
        local sound = USERSOUND:New(selectedSound)
        sound:ToGroup(Group)
    end
end

function my_ctld:OnAfterTroopsPickedUp(From, Event, To, Group, Unit, Cargo)
    if Group and Group:IsAlive() then
        playRandomSound(Group, "loading")
        else
        return
    end
end
function my_ctld:OnAfterTroopsExtracted(From, Event, To, Group, Unit, Troops, Troopname)
     if Group and Group:IsAlive() then
        playRandomSound(Group, "loading")
        else
        return
    end
end
function my_ctld:OnAfterTroopsDeployed(From, Event, To, Group, Unit, Troops)
    if not Group then return end

    local troopGroup = Troops
    if troopGroup and troopGroup:IsAlive() then
        local troopGroupName = troopGroup:GetName()
        local currentTime = timer.getTime()
        
        deployedTroops[troopGroupName] = troopGroup
        deployedTroopsSet:AddGroup(troopGroup)
        zoneSet:Trigger(deployedTroopsSet)

        if Group and Group:IsAlive() then
            playRandomSound(Group, "unload")
        else
            return
        end

        local cargoName, stock = "unknown", 0

        for _, cargoData in pairs(self.Cargo_Troops) do
            if cargoData.Templates then
                local templateName = type(cargoData.Templates) == "table" 
                                     and cargoData.Templates[1] 
                                     or cargoData.Templates
                if string.find(troopGroupName, templateName, 1, true) then
                    if cargoData.CargoType == CTLD_CARGO.Enum.TROOPS then
                        cargoName = cargoData:GetName()
                        stock = cargoData:GetStock()
                    end
                    break
                end
            end
        end
        local maxTimestamp = 0
        for _, group in ipairs(TroopUnits) do
            if group.CargoName == cargoName then
                if group.Timestamp > maxTimestamp then
                    maxTimestamp = group.Timestamp
                end
            end
        end
        local newTimestamp = maxTimestamp > 0 and (maxTimestamp + currentTime) or currentTime

        local groupExists = false
        for _, group in ipairs(TroopUnits) do
            if group.groupName == troopGroupName then
                group.Timestamp = newTimestamp
                group.Stock = stock
                groupExists = true
                break
            end
        end
        if not groupExists then
            table.insert(TroopUnits, {
                groupName = troopGroupName,
                Timestamp = newTimestamp,
                CargoName = cargoName,
                Stock = stock
            })
        end
        for _, g in ipairs(TroopUnits) do
            if g.CargoName == cargoName then
                g.Stock = stock
            end
        end

        local oldestUnit = nil
        local oldestTimestamp = math.huge
        for _, group in ipairs(TroopUnits) do
            if group.CargoName == cargoName
               and group.Timestamp < newTimestamp
               and group.Stock <= 1
            then
                if group.Timestamp < oldestTimestamp then
                    oldestTimestamp = group.Timestamp
                    oldestUnit = group
                end
            end
        end
        if oldestUnit then
            my_ctld:AddStockTroops(oldestUnit.CargoName, 1)
            local dcsGroup = GROUP:FindByName(oldestUnit.groupName)
            if dcsGroup and dcsGroup:IsAlive() then
                dcsGroup:Destroy()
            end
            for i, group in ipairs(TroopUnits) do
                if group.groupName == oldestUnit.groupName then
                    table.remove(TroopUnits, i)
                    break
                end
            end
        end
        local currentZones = {}
        for _, zC in ipairs(bc:getZones()) do
            local missionZoneName = zC.zone
            local zone = ZONE:FindByName(missionZoneName)
            if troopGroup:IsPartlyOrCompletelyInZone(zone) then
                local zoneName = zone:GetName()
                table.insert(currentZones, {zoneName = zoneName, zoneObject = zC})
            end
        end

        for _, zoneData in ipairs(currentZones) do
            local currentZone = zoneData.zoneObject
            local zoneName = zoneData.zoneName

            if not currentZone then
                zoneCaptureInfo[troopGroupName] = { troopGroup = troopGroup, zoneName = zoneName }
                return
            end
            if currentZone.side == 2 then
                zoneCaptureInfo[troopGroupName] = { troopGroup = troopGroup, zoneName = zoneName }
                timer.scheduleFunction(function()
                    CaptureZoneIfNeutral()
                end, {}, timer.getTime() + 2)
                return
            end

            if currentZone.side == 1 then
                zoneCaptureInfo[troopGroupName] = { troopGroup = troopGroup, zoneName = zoneName }
                return
            end

            if currentZone.side == 0 then
                zoneCaptureInfo[troopGroupName] = { troopGroup = troopGroup, zoneName = zoneName }
                timer.scheduleFunction(function()
                    CaptureZoneIfNeutral()
                end, {}, timer.getTime() + 2)
            end
        end
    end
end
function zoneSet:OnAfterEnteredZone(From, Event, To, EnteredGroup, Zone)
    local troopGroup = EnteredGroup
    if troopGroup and troopGroup:IsAlive() then
        local troopGroupName = troopGroup:GetName()
        local zoneName = Zone:GetName()

        local currentZone = bc:getZoneByName(zoneName)

        if currentZone and currentZone.side == 2 then
            zoneCaptureInfo[troopGroupName] = { troopGroup = troopGroup, zoneName = zoneName }
            timer.scheduleFunction(function()
                CaptureZoneIfNeutral()
            end, {}, timer.getTime() + 10)
            return
        end
        if currentZone and currentZone.side == 1 then
            zoneCaptureInfo[troopGroupName] = { troopGroup = troopGroup, zoneName = zoneName }
            return
        end
        if currentZone and currentZone.side == 0 then
            zoneCaptureInfo[troopGroupName] = { troopGroup = troopGroup, zoneName = zoneName }
            timer.scheduleFunction(function()
                CaptureZoneIfNeutral()
            end, {}, timer.getTime() + 10)
        end
    end
end
function CaptureZoneIfNeutral()
    if next(zoneCaptureInfo) == nil then
        return
    end

    local troopGroupNames = {}
    for troopGroupName in pairs(zoneCaptureInfo) do
        table.insert(troopGroupNames, troopGroupName)
    end

    local function processNextGroup(index)
        if index > #troopGroupNames then
            return
        end

        local troopGroupName = troopGroupNames[index]
        local captureData = zoneCaptureInfo[troopGroupName]

        if captureData then
            local zoneName = captureData.zoneName
            local troopGroup = captureData.troopGroup
            local currentZone = bc:getZoneByName(zoneName)

            if not currentZone then
                return
            end
            if troopGroup and troopGroup:IsAlive() then
                if currentZone.side == 0 then
                timer.scheduleFunction(function()
                    currentZone:capture(2)
                    troopGroup:Destroy()
                end, {}, timer.getTime() + 5)
                elseif currentZone.wasBlue then
                timer.scheduleFunction(function()
                    currentZone:upgrade()
                    troopGroup:Destroy()
                end, {}, timer.getTime() + 5)
                elseif not currentZone.active then
                    troopGroup:Destroy()
                end
                deployedTroops[troopGroupName] = nil
                        deployedTroopsSet:RemoveGroupsByName(troopGroupName)
                    end
                end
        timer.scheduleFunction(function()
            processNextGroup(index + 1)
        end, {}, timer.getTime() + 3)
    end

    processNextGroup(1)
end

local function RefillMissingWithCountTable()
  local countTable = my_ctld:_CountStockPlusInHeloPlusAliveGroups()
  --BASE:I("**** CountStockPlusAliveGroups ****")
  --UTILS.PrintTableToLog(countTable,1)
  --BASE:I("**** CountStockPlusAliveGroups ****")
  for cargoName, info in pairs(countTable) do
    local stock0 = info.Stock0 or 0
    local sum    = info.Sum or 0
    local needed = stock0 - sum

    if needed > 0 then
      local isTroop  = my_ctld:_FindTroopsCargoObject(cargoName)  ~= nil
      local isCrates = my_ctld:_FindCratesCargoObject(cargoName) ~= nil

      if isTroop then
        my_ctld:AddStockTroops(cargoName, needed)
        env.info(string.format("[Refill] TROOPS '%s': sum=%d < stock0=%d => +%d stock added.",
          cargoName, sum, stock0, needed))
      elseif isCrates then
        my_ctld:AddStockCrates(cargoName, needed)
        env.info(string.format("[Refill] CRATES '%s': sum=%d < stock0=%d => +%d stock added.",
          cargoName, sum, stock0, needed))
      else
        env.info(string.format("[Refill] Cargo '%s' not found in Troops or Crates, cannot refill automatically.", cargoName))
      end
    end

    if sum > stock0 then
      local cargoObj = my_ctld:_FindCratesCargoObject(cargoName)
      if cargoObj then
        local oldStock = cargoObj.Stock or 0
        if oldStock > 0 then
          local difference = sum - stock0
          local newStock   = oldStock - difference
          if newStock < 0 then
            newStock = 0
          end
          cargoObj.Stock = newStock
        end
      end
    end
  end
end

TIMER:New(RefillMissingWithCountTable):Start(15, 30)

BASE:I("CTLD script initialized")