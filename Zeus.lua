env.info("ZEUS START: is loading.")

SupportHandler = EVENTHANDLER:New()

function randomnumberZEUS()
	local rngz = math.random(1,1000)
	return rngz
end

function spv(groupName, coord)
  local RngNumZEUS = randomnumberZEUS()
	group = SPAWN:NewWithAlias(groupName, groupName .. RngNumZEUS)
    --:InitRepeatOnLanding()
	group:SpawnFromVec2(coord:GetVec2())
end

function handleSpawnRequest(text, coord)
    local unitList = {
		--red      
	    "SA-8",
        "SA-9",
        "SA-13",
        "SA-15",
        "SA-19",
        "Soldier",
        "Truck",
        "Shilka",
        "Igla",
        "Igla-S",
		"RPG",
		"BMP2",
		"Tank",
		"BTR80",
        --blue
        "JTAC9lineam",
		"JTAC9linefm",
		"Tankm1",
		
    }
    
    for i_unit = 1, #unitList do
        if text == "-create " .. unitList[i_unit]:lower() then
			spv(unitList[i_unit], coord)
			--trigger.action.outText( "" .. unitList[i_unit] .. " on your MAP MARKER succesfully CREATED.", 10)
			--trigger.action.outSound( "BD_00007 single beep.ogg")
			env.info("" .. unitList[i_unit] .. " on your MAP MARKER succesfully CREATED.")
		end
	end   
end

function handleDebugRequest(text, coord)

end

local destroyZoneCount = 0
function handleDestroyRequest(text, coord)
    local destroyZoneName = string.format("destroy %d", destroyZoneCount)
    local zoneRadiusToDestroy = ZONE_RADIUS:New(destroyZoneName, coord:GetVec2(), 500)
    destroyZoneCount = destroyZoneCount + 1
	--trigger.action.outText("UNIT(S) on your MAP MARKER succesfully DESTROYED.", 10)
    local function destroyUnit(unit)
        unit:Destroy()
        return true
    end

    zoneRadiusToDestroy:SearchZone( destroyUnit , Object.Category.UNIT)
end

local destroyVehicleZoneCount = 0
function handleDestroyVehicleRequest(text, coord)
    local destroyZoneName = string.format("destroy %d", destroyVehicleZoneCount)
    local zoneRadiusToDestroy = ZONE_RADIUS:New(destroyZoneName, coord:GetVec2(), 1000)
    destroyVehicleZoneCount = destroyVehicleZoneCount + 1
	--trigger.action.outText("UNIT(S) on your MAP MARKER succesfully DESTROYED.", 10)
    local function destroyUnit(unit)
        unit:Destroy()
        return true
    end

    zoneRadiusToDestroy:SearchZone( destroyUnit , Object.Category.UNIT)
end

local destroyZoneCount = 0
function handleClearRequest(text, coord)
    local destroyZoneName = string.format("destroy %d", destroyZoneCount)
    local zoneRadiusToDestroy = ZONE_RADIUS:New(destroyZoneName, coord:GetVec2(), 6500)
    destroyZoneCount = destroyZoneCount + 1
    --trigger.action.outText("UNIT(S) on your MAP MARKER succesfully DESTROYED.", 10)
    local function destroyUnit(unit)
        unit:Destroy()
        return true
    end

    zoneRadiusToDestroy:SearchZone( destroyUnit , Object.Category.UNIT)
end

function handleExplodeRequest(text, coord)
    -- Default explosion parameters
    local power = 100 -- Default to 100 kg TNT
    local delay = 0 -- Default no delay

    -- Parse the power and optional delay from the command (e.g., "-explode 150 5" or "-explode 150")
    local explodeParams = {string.match(text, "-explode (%d+) ?(%d*)")}
    
    if #explodeParams >= 1 then
        power = tonumber(explodeParams[1])
    end
    if #explodeParams == 2 and explodeParams[2] ~= "" then
        delay = tonumber(explodeParams[2])
    end

    coord:Explosion(power, delay)
end

function handleSmokeRequest(text, coord)
    local smokeColor = "red"

    local smokeParams = {string.match(text, "-smoke (%a+)")}

    if #smokeParams >= 1 then
        smokeColor = smokeParams[1]:lower()
    end


    if smokeColor == "red" then
        coord:SmokeRed()
    elseif smokeColor == "blue" then
        coord:SmokeBlue()
    elseif smokeColor == "green" then
        coord:SmokeGreen()
    elseif smokeColor == "orange" then
        coord:SmokeOrange()
    elseif smokeColor == "white" then
        coord:SmokeWhite()
    else
        coord:SmokeRed()
    end
end


function markRemoved(Event)
    if Event.text ~= nil and Event.text:lower():find("-") then 
        local text = Event.text:lower()
        
        local vec3 = {y = Event.pos.y, x = Event.pos.x, z = Event.pos.z}
        local coord = COORDINATE:NewFromVec3(vec3)
        coord.y = coord:GetLandHeight()

        if text:find("-create") then
            handleSpawnRequest(text, coord)
        elseif text:find("-static") then
            handleStaticRequest(text, coord)
        elseif text:find("-debug") then
            handleDebugRequest(text, coord)
        elseif text:find("-destroy1") then
            handleDestroyRequest(text, coord)
        elseif text:find("-destroy2") then
            handleDestroyVehicleRequest(text, coord)
        elseif text:find("-destroy3") then
            handleClearRequest(text, coord)
        elseif text:find("-explode") then
            handleExplodeRequest(text, coord)
        elseif text:find("-smoke") then
            handleSmokeRequest(text, coord)
        end
    end
end

function SupportHandler:onEvent(Event)
    if Event.id == world.event.S_EVENT_MARK_ADDED then
        -- env.info(string.format("BTI: Support got event ADDED id %s idx %s coalition %s group %s text %s", Event.id, Event.idx, Event.coalition, Event.groupID, Event.text))
    elseif Event.id == world.event.S_EVENT_MARK_CHANGE then
        -- env.info(string.format("BTI: Support got event CHANGE id %s idx %s coalition %s group %s text %s", Event.id, Event.idx, Event.coalition, Event.groupID, Event.text))
    elseif Event.id == world.event.S_EVENT_MARK_REMOVED then
        -- env.info(string.format("BTI: Support got event REMOVED id %s idx %s coalition %s group %s text %s", Event.id, Event.idx, Event.coalition, Event.groupID, Event.text))
        markRemoved(Event)
    end
end

world.addEventHandler(SupportHandler)


env.info("ZEUS START: is completed!")