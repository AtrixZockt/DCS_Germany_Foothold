# TODO

1. Reenable ATC Park guard + test AI and add code from old ZoneCommander if needed (flightControl:SetFlightStatus(flightGroup, FLIGHTCONTROL.FlightStatus.READYTX))
2. Remove all env.info related to luneburg 

3. Check why units dont spawn as group (local sp = SPAWN:NewFromTemplate(tpl, resolved, self.name, true):InitUnControlled( true ))
4. Check all AI missoins 
5. maybe move `_testGiveMission` back into onSpawnCommand


99. Get my sanity back


# Notes

## AI Tasking

1. CAS Mission
- Not designed for Bombs (For bombs use Ground Attack Missoin)
- Run Script on Waypoint from which the attack should start:
``` lua
--BattleCommander:engageZone(tgtzone, groupname, expendAmmount=Optional, weapon=Optional)

local gr = ...
bc:engageZone('Frankfurt',gr:getName())
```

2. Ground Attack Mission
- Designed for use with bombs for CarpetBombing
- Run script on Waypoint from which the attack should start:
```lua
--BattleCommander:carpetBombRandomUnitInZone(tgtzone, groupname)

local gr = ...
bc:carpetBombRandomUnitInZone('Fritzlar', gr:getName())
```

3. CAP Mission
- No custom script
- Waypoint settings:
    - Start Enroute Task: Search Then Engage (Only Air)
    - Perform Task: Barrier Combat Air Patrol (Racetrack) - Use second to last point



## ZC moose
1. Script settings
- Era = 'Coldwar' (add CAP_Template_CW, DynamicCas_Template_CW, DynamicDecoy_Template, DynamicSead_Template_CW, DynamicBomber_Template_CW, DynamicStructure_Template_CW)
- CreditLosewhenKilled = false
- UseStatics = true
- SplashDamage = false
- ShowKills=false
- StoreLimit = false
- CTLDCost = true
- RankingSystem = false
- -- cap config (( internal ))

function getCapLimit(numPlayers)
    numPlayers = numPlayers or getBluePlayersCount()
    if numPlayers == 0 then
        return 4
    elseif numPlayers == 1 then
        return 6
    elseif numPlayers == 2 then
        return 10
    elseif numPlayers == 3 then
        return 12
    elseif numPlayers == 4 then
        return 14
    elseif numPlayers == 5 then
        return 16
    elseif numPlayers == 6 then
        return 18
    else
        return 99999
    end
end




SPAWN:ParkAtAirbase


FLIGHTGROUP:onafterElementEngineOn













