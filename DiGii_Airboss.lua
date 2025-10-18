-- S-3B Recovery Tanker spawning on carrier.
local tanker = RECOVERYTANKER:New(UNIT:FindByName("USS Abraham Lincoln"), "Texaco Group")
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

-- Rescue Helo with home base Lake Erie. Has to be a global object!
local rescuehelo=RESCUEHELO:New("USS Abraham Lincoln", "Rescue Helo")
rescuehelo:SetHomeBase(AIRBASE:FindByName("Lake Erie"))
rescuehelo:SetModex(42)
rescuehelo:__Start(1)


-- Create AIRBOSS object.
local AirbossStennis=AIRBOSS:New("USS Abraham Lincoln")

AirbossStennis:SetTACAN(73, "X", "LCN")

AirbossStennis:EnableSRS("C:\\Program Files\\DCS-SimpleRadio-Standalone\\ExternalAudio", 5002, "en-US", "male", "en-US-Wavenet-J", "C:\\Program Files\\DCS-SimpleRadio-Standalone\\googlekey.json")

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

-- Start airboss class.
AirbossStennis:Start()

--- Function called when recovery tanker is started.
function tanker:OnAfterStart(From,Event,To)

  -- Set recovery tanker.
  AirbossStennis:SetRecoveryTanker(tanker)  


  -- Use tanker as radio relay unit for LSO transmissions.
  AirbossStennis:SetRadioRelayLSO(self:GetUnitName())
  
end

--- Function called when rescue helo is started.
function rescuehelo:OnAfterStart(From,Event,To)
  -- Use rescue helo as radio relay for Marshal.
  AirbossStennis:SetRadioRelayMarshal(self:GetUnitName())
end