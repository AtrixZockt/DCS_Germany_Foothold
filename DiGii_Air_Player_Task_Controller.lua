Blue_DetectionSetGroup = SET_GROUP:New()
Blue_DetectionSetGroup:FilterPrefixes( { "BLUE EWR" } )
Blue_DetectionSetGroup:FilterOnce()

BlueIntel = INTEL:New(Blue_DetectionSetGroup, "blue", "Intel")
BlueIntel:AddAgent(GROUP:FindByName("Blue AWACS"))
BlueIntel:AddAgent(GROUP:FindByName("Blue AWACS-1"))
BlueIntel:SetFilterCategory({Unit.Category.AIRPLANE, Unit.Category.HELICOPTER})
BlueIntel:FilterCategoryGroup({Unit.Category.AIRPLANE, Unit.Category.HELICOPTER})
BlueIntel:SetClusterAnalysis(false, false)
BlueIntel:SetVerbosity(2)
BlueIntel:__Start(2)


function BlueIntel:OnAfterNewContact(From, Event, To, Contact)
  DynamicTasking:GenerateA2AMission(Contact)
end