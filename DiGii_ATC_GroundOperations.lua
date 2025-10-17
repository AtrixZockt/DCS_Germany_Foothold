atisHamburg=ATIS:New("Hamburg", 126.950, radio.modulation.AM)
atisHamburg:SetRadioRelayUnitName("RR Hamburg")
atisHamburg:Start()

atisLuneburg=ATIS:New("Luneburg", 136.6, radio.modulation.AM)
atisLuneburg:SetRadioRelayUnitName("RR Luneburg")
atisLuneburg:Start()

atisBremen=ATIS:New("Bremen", 118.550, radio.modulation.AM)
atisBremen:SetRadioRelayUnitName("RR Bremen")
atisBremen:Start()

atisFassberg=ATIS:New("Fassberg", 122.2, radio.modulation.AM)
atisFassberg:SetRadioRelayUnitName("RR Fassberg")
atisFassberg:Start()

atisNortheim=ATIS:New("Northeim", 134.7, radio.modulation.AM)
atisNortheim:SetRadioRelayUnitName("RR Northeim")
atisNortheim:Start()

atisBraunschweig=ATIS:New("Braunschweig", 120.15, radio.modulation.AM)
atisBraunschweig:SetRadioRelayUnitName("RR Braunschweig")
atisBraunschweig:Start()

atisHannover=ATIS:New("Hannover", 120.3, radio.modulation.AM)
atisHannover:SetRadioRelayUnitName("RR Hannover")
atisHannover:Start()

atisGutersloh=ATIS:New("Gutersloh", 252.3, radio.modulation.AM)
atisGutersloh:SetRadioRelayUnitName("RR Gutersloh")
atisGutersloh:Start()

atisObermehler_Schlotheim=ATIS:New("Obermehler Schlotheim", 123, radio.modulation.AM)
atisObermehler_Schlotheim:SetRadioRelayUnitName("RR Obermehler_Schlotheim")
atisObermehler_Schlotheim:Start()

atisFritzlar=ATIS:New("Fritzlar", 126.6, radio.modulation.AM)
atisFritzlar:SetRadioRelayUnitName("RR Fritzlar")
atisFritzlar:Start()

atisFrankfurt=ATIS:New("Frankfurt", 127.4, radio.modulation.AM)
atisFrankfurt:SetRadioRelayUnitName("RR Frankfurt")
atisFrankfurt:Start()




local Hamburg2 = AIRBASE:FindByName(AIRBASE.GermanyCW.Hamburg)
Hamburg2:SetRadioSilentMode(true)
local Hamburg=FLIGHTCONTROL:New(AIRBASE.GermanyCW.Hamburg, {126.850, 252.350}, {radio.modulation.AM, radio.modulation.AM}, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\ExternalAudio", 5002, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\googlekey.json")

Hamburg:SetLimitTaxi(99, false, 99)
Hamburg:SetSpeedLimitTaxi(30)
Hamburg:SetLimitLanding(2, 99)
Hamburg:SetRadioOnlyIfPlayers(true)
Hamburg:SetRunwayRepairtime(1)
Hamburg:SetVerbosity(2)
Hamburg:SetSRSTower('male', 'en-GB', "en-US-Wavenet-J")
Hamburg:SetSRSPilot('male', 'en-GB', "en-US-Wavenet-I")
Hamburg:SetATIS(atisHamburg)
Hamburg:Start()

local Bremen2 = AIRBASE:FindByName(AIRBASE.GermanyCW.Bremen)
Bremen2:SetRadioSilentMode(true)
local Bremen=FLIGHTCONTROL:New(AIRBASE.GermanyCW.Bremen, {118.450, 251.100}, {radio.modulation.AM, radio.modulation.AM}, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\ExternalAudio", 5002, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\googlekey.json")

Bremen:SetSRSTower('male', 'en-GB', "en-US-Wavenet-J")
Bremen:SetSRSPilot('male', 'en-GB', "en-US-Wavenet-I")
Bremen:SetATIS(atisBremen)
Bremen:Start()

local Luneburg2 = AIRBASE:FindByName(AIRBASE.GermanyCW.Lueneburg)
Luneburg2:SetRadioSilentMode(true)
local Luneburg=FLIGHTCONTROL:New(AIRBASE.GermanyCW.Lueneburg, {136.5, 254.550}, {radio.modulation.AM, radio.modulation.AM}, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\ExternalAudio", 5002, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\googlekey.json")

Luneburg:SetSRSTower('male', 'en-GB', "en-US-Wavenet-J")
Luneburg:SetSRSPilot('male', 'en-GB', "en-US-Wavenet-I")
Luneburg:SetATIS(atisLuneburg)
Luneburg:Start()

local Fassberg2 = AIRBASE:FindByName(AIRBASE.GermanyCW.Fassberg)
Fassberg2:SetRadioSilentMode(true)
local Fassberg=FLIGHTCONTROL:New(AIRBASE.GermanyCW.Fassberg, {122.1, 251.0}, {radio.modulation.AM, radio.modulation.AM}, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\ExternalAudio", 5002, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\googlekey.json")

Fassberg:SetSRSTower('male', 'en-GB', "en-US-Wavenet-J")
Fassberg:SetSRSPilot('male', 'en-GB', "en-US-Wavenet-I")
Fassberg:SetATIS(atisFassberg)
Fassberg:Start()

local Northeim2 = AIRBASE:FindByName(AIRBASE.GermanyCW.Northeim)
Northeim2:SetRadioSilentMode(true)
local Northeim=FLIGHTCONTROL:New(AIRBASE.GermanyCW.Northeim, {134.6, 254.650}, {radio.modulation.AM, radio.modulation.AM}, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\ExternalAudio", 5002, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\googlekey.json")

Northeim:SetSRSTower('male', 'en-GB', "en-US-Wavenet-J")
Northeim:SetSRSPilot('male', 'en-GB', "en-US-Wavenet-I")
Northeim:SetATIS(atisNortheim)
Northeim:Start()

local Braunschweig2 = AIRBASE:FindByName(AIRBASE.GermanyCW.Braunschweig)
Braunschweig2:SetRadioSilentMode(true)
local Braunschweig=FLIGHTCONTROL:New(AIRBASE.GermanyCW.Braunschweig, {120.05, 250.350}, {radio.modulation.AM, radio.modulation.AM}, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\ExternalAudio", 5002, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\googlekey.json")

Braunschweig:SetSRSTower('male', 'en-GB', "en-US-Wavenet-J")
Braunschweig:SetSRSPilot('male', 'en-GB', "en-US-Wavenet-I")
Braunschweig:SetATIS(atisBraunschweig)
Braunschweig:Start()

local Hannover2 = AIRBASE:FindByName(AIRBASE.GermanyCW.Hannover)
Hannover2:SetRadioSilentMode(true)
local Hannover=FLIGHTCONTROL:New(AIRBASE.GermanyCW.Hannover, {120.2, 252.450}, {radio.modulation.AM, radio.modulation.AM}, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\ExternalAudio", 5002, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\googlekey.json")

Hannover:SetSRSTower('male', 'en-GB', "en-US-Wavenet-J")
Hannover:SetSRSPilot('male', 'en-GB', "en-US-Wavenet-I")
Hannover:SetATIS(atisHannover)
Hannover:Start()

local Guetersloh2 = AIRBASE:FindByName(AIRBASE.GermanyCW.Guetersloh)
Guetersloh2:SetRadioSilentMode(true)
local Guetersloh=FLIGHTCONTROL:New(AIRBASE.GermanyCW.Guetersloh, {122.1, 252.2}, {radio.modulation.AM, radio.modulation.AM}, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\ExternalAudio", 5002, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\googlekey.json")

Guetersloh:SetSRSTower('male', 'en-GB', "en-US-Wavenet-J")
Guetersloh:SetSRSPilot('male', 'en-GB', "en-US-Wavenet-I")
Guetersloh:SetATIS(atisGutersloh)
Guetersloh:Start()

local Obermehler_Schlotheim2 = AIRBASE:FindByName(AIRBASE.GermanyCW.Obermehler_Schlotheim)
Obermehler_Schlotheim2:SetRadioSilentMode(true)
local Obermehler_Schlotheim=FLIGHTCONTROL:New(AIRBASE.GermanyCW.Obermehler_Schlotheim, {122.9, 252.05}, {radio.modulation.AM, radio.modulation.AM}, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\ExternalAudio", 5002, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\googlekey.json")

Obermehler_Schlotheim:SetSRSTower('male', 'en-GB', "en-US-Wavenet-J")
Obermehler_Schlotheim:SetSRSPilot('male', 'en-GB', "en-US-Wavenet-I")
Obermehler_Schlotheim:SetATIS(atisObermehler_Schlotheim)
Obermehler_Schlotheim:Start()

local Fritzlar2 = AIRBASE:FindByName(AIRBASE.GermanyCW.Fritzlar)
Fritzlar2:SetRadioSilentMode(true)
local Fritzlar=FLIGHTCONTROL:New(AIRBASE.GermanyCW.Fritzlar, {126.5, 251.350}, {radio.modulation.AM, radio.modulation.AM}, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\ExternalAudio", 5002, "C:\\Program Files\\DCS-SimpleRadio-Standalone\\googlekey.json")

Fritzlar:SetSRSTower('male', 'en-GB', "en-US-Wavenet-J")
Fritzlar:SetSRSPilot('male', 'en-GB', "en-US-Wavenet-I")
Fritzlar:SetATIS(atisFritzlar)
Fritzlar:Start()