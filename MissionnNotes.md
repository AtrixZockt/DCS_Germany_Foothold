# TODO

1. Update Dynamic missions to use other Menu system (`sub1 = MENU_GROUP:New(self.group, "More",  self.menu.atc.root)`)

2. Check all AI missoins 

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














