# TODO

1. Update @WelcomeMessage_Caucasus.lua to newest version and change it to match germany

2. Check all AI missoins 

3. update atis freq

99. Get my sanity back


# Notes


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



## Errors from MP Testing:

```Log
2025-10-18 15:44:39.251 INFO    SCRIPTING (Main): Error in SCHEDULER function:[string "l10n/DEFAULT/DynamicTasking.lua"]:159: bad argument #2 to 'format' (string expected, got nil)
2025-10-18 15:44:39.251 INFO    SCRIPTING (Main): stack traceback:
	[string "l10n/DEFAULT/Moose.lua"]:13514: in function <[string "l10n/DEFAULT/Moose.lua"]:13511>
	[C]: in function 'format'
	[string "l10n/DEFAULT/DynamicTasking.lua"]:159: in function <[string "l10n/DEFAULT/DynamicTasking.lua"]:158>
	(tail call): ?
	[C]: in function 'xpcall'
	[string "l10n/DEFAULT/Moose.lua"]:13894: in function 'onEvent'
	[string "Scripts/World/EventHandlers.lua"]:13: in function <[string "Scripts/World/EventHandlers.lua"]:11>
```

```Log
2025-10-18 15:42:16.901 ERROR   SCRIPTING (Main): Mission script error: [string "l10n/DEFAULT/DynamicTasking.lua"]:658: attempt to call method 'GetImpactCoordinate' (a nil value)
stack traceback:
	[C]: in function 'GetImpactCoordinate'
	[string "l10n/DEFAULT/DynamicTasking.lua"]:658: in function 'impactFunc'
	[string "l10n/DEFAULT/Moose.lua"]:66032: in function <[string "l10n/DEFAULT/Moose.lua"]:65915>
2025-10-18 15:42:18.942 WARNING LOG (10936): 1 duplicate message(s) skipped.
```

```Log
2025-10-18 15:23:29.174 INFO    SCRIPTING (Main): Error in SCHEDULER function:[string "l10n/DEFAULT/DynamicTasking.lua"]:597: attempt to index local 'killerObject' (a nil value)
2025-10-18 15:23:29.174 INFO    SCRIPTING (Main): stack traceback:
	[string "l10n/DEFAULT/Moose.lua"]:13514: in function <[string "l10n/DEFAULT/Moose.lua"]:13511>
	[string "l10n/DEFAULT/DynamicTasking.lua"]:597: in function <[string "l10n/DEFAULT/DynamicTasking.lua"]:567>
	(tail call): ?
	[C]: in function 'xpcall'
	[string "l10n/DEFAULT/Moose.lua"]:13927: in function 'onEvent'
	[string "Scripts/World/EventHandlers.lua"]:13: in function <[string "Scripts/World/EventHandlers.lua"]:11>
```

```Log
2025-10-18 15:19:06.229 INFO    SCRIPTING (Main): Error in timer function: [string "l10n/DEFAULT/zoneCommander_moose.lua"]:2316: attempt to index global 'AWACS_CFG' (a nil value)
2025-10-18 15:19:06.229 INFO    SCRIPTING (Main): stack traceback:
	[string "l10n/DEFAULT/Moose.lua"]:12062: in function <[string "l10n/DEFAULT/Moose.lua"]:12059>
	[string "l10n/DEFAULT/zoneCommander_moose.lua"]:2316: in function '_computeAwacsStationWithZone'
	[string "l10n/DEFAULT/zoneCommander_moose.lua"]:2419: in function <[string "l10n/DEFAULT/zoneCommander_moose.lua"]:2416>
	(tail call): ?
	[C]: in function 'xpcall'
	[string "l10n/DEFAULT/Moose.lua"]:12115: in function <[string "l10n/DEFAULT/Moose.lua"]:12051>
```














