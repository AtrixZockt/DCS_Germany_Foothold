-- Wrapper table to hold all framework functions and data.
DIGIIAIRBOSS = {}

function DIGIIAIRBOSS:Start()
  -- S-3B Recovery Tanker spawning on carrier.
  local tanker = RECOVERYTANKER:New(UNIT:FindByName("CVN-72"), "Texaco Group")
  tanker:SetTakeoffAir()
  tanker:SetRadio(250)
  tanker:SetModex(511)
  tanker:SetTACAN(37, "SHL")
  tanker:SetAltitude(12000) --Sets Orbit Altitude
  tanker:SetSpeed(300) --Sets speed to 300 knots TAS (~249 KIAS at 12000ft)

  tanker:SetCallsign(CALLSIGN.Tanker.Shell, 3)

  --RECOVERYTANKER.uncontrolledac if true, use an uncontrolled tanker group already present in the mission.
  tanker.uncontrolledac = true

  tanker:__Start(30)

  local tankerNorth = RECOVERYTANKER:New(UNIT:FindByName("CVN-74"), "Texaco Group North")
  tankerNorth:SetTakeoffAir()
  tankerNorth:SetRadio(250)
  tankerNorth:SetModex(511)
  tankerNorth:SetTACAN(36, "SHLNorth")
  tankerNorth:SetAltitude(12000) --Sets Orbit Altitude
  tankerNorth:SetSpeed(300) --Sets speed to 300 knots TAS (~249 KIAS at 12000ft)

  tankerNorth:SetCallsign(CALLSIGN.Tanker.Shell, 3)

  --RECOVERYTANKER.uncontrolledac if true, use an uncontrolled tanker group already present in the mission.
  tankerNorth.uncontrolledac = true

  tankerNorth:__Start(30)

  -- Rescue Helo with home base Lake Erie. Has to be a global object!
  local rescuehelo=RESCUEHELO:New("CVN-72", "Rescue Helo")
  rescuehelo:SetHomeBase(AIRBASE:FindByName("Lake Erie"))
  rescuehelo:SetModex(42)
  rescuehelo:__Start(1)

  local rescueheloNorth=RESCUEHELO:New("CVN-74", "Rescue Helo North")
  rescueheloNorth:SetHomeBase(AIRBASE:FindByName("Lake Erie North"))
  rescueheloNorth:SetModex(42)
  rescueheloNorth:__Start(1)


  -- Create AIRBOSS object.
  local AirbossLincoln=AIRBOSS:New("CVN-72")
  -- Add recovery windows:
  -- Case I from 6 to 10 am.
  local window1=AirbossLincoln:AddRecoveryWindow( "6:00", "10:00", 1, nil, true, 25)
  -- Case II with +15 degrees holding offset from 15:00 for 60 min.
  local window2=AirbossLincoln:AddRecoveryWindow("15:00", "16:00", 2,  15, true, 23)
  -- Case III with +30 degrees holding offset from 2100 to 2200.
  local window3=AirbossLincoln:AddRecoveryWindow("21:00", "22:00", 3,  30, true, 21)

  -- Set folder of airboss sound files within miz file.
  AirbossLincoln:SetSoundfilesFolder("Airboss Soundfiles/")

  -- Single carrier menu optimization.
  AirbossLincoln:SetMenuSingleCarrier()

  -- Skipper menu.
  AirbossLincoln:SetMenuRecovery(30, 20, false)

  -- Start airboss class.
  --AirbossLincoln:Start()

  --- Function called when recovery tanker is started.
  function tanker:OnAfterStart(From,Event,To)

    -- Set recovery tanker.
    AirbossLincoln:SetRecoveryTanker(tanker)  


    -- Use tanker as radio relay unit for LSO transmissions.
    AirbossLincoln:SetRadioRelayLSO(self:GetUnitName())
    
  end

  --- Function called when rescue helo is started.
  function rescuehelo:OnAfterStart(From,Event,To)
    -- Use rescue helo as radio relay for Marshal.
    AirbossLincoln:SetRadioRelayMarshal(self:GetUnitName())
  end

  -- Create AIRBOSS object.
  local AirbossStennis=AIRBOSS:New("CVN-74")
  -- Add recovery windows:
  -- Case I from 6 to 10 am.
  local window1=AirbossStennis:AddRecoveryWindow( "6:00", "10:00", 1, nil, true, 25)
  -- Case II with +15 degrees holding offset from 15:00 for 60 min.
  local window2=AirbossStennis:AddRecoveryWindow("15:00", "16:00", 2,  15, true, 23)
  -- Case III with +30 degrees holding offset from 2100 to 2200.
  local window3=AirbossStennis:AddRecoveryWindow("21:00", "22:00", 3,  30, true, 21)

  -- Set folder of airboss sound files within miz file.
  AirbossStennis:SetSoundfilesFolder("Airboss Soundfiles/")

  -- Single carrier menu optimization.
  AirbossStennis:SetMenuSingleCarrier()

  -- Skipper menu.
  AirbossStennis:SetMenuRecovery(30, 20, false)

  --- Function called when recovery tanker is started.
  function tankerNorth:OnAfterStart(From,Event,To)

    -- Set recovery tanker.
    AirbossStennis:SetRecoveryTanker(tankerNorth)  


    -- Use tanker as radio relay unit for LSO transmissions.
    AirbossStennis:SetRadioRelayLSO(self:GetUnitName())
    
  end

  --- Function called when rescue helo is started.
  function rescueheloNorth:OnAfterStart(From,Event,To)
    -- Use rescue helo as radio relay for Marshal.
    AirbossStennis:SetRadioRelayMarshal(self:GetUnitName())
  end
end