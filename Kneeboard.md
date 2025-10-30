# Foothold Germany Mission Kneeboard

## 1. Mission Briefing

Welcome to Operation Foothold Germany. This is a dynamic campaign where your actions will directly impact the frontline. The objective is to capture and hold strategic zones, pushing back enemy forces. Work with your allies to secure victory.

**SRS (Simple Radio Standalone) is required for this mission.**

## 2. Communication

### General Frequencies

| Callsign | Frequency   | Modulation | Notes                               |
| :--- | :--- | :--- | :--- |
| Darkstar   | 251.500 MHz | AM         | GCI/AWACS ([Skyeye Script](https://github.com/dharmab/skyeye)) |

### Carrier Information

| Carrier Name        | TACAN | ICLS | Notes                               |
| :------------------ | :---- | :--- | :---------------------------------- |
| George Washington   | 73X   | 13   | CVN-73, Callsign "Washington"       |
| Abraham Lincoln     | 72X   | 12   | CVN-72, Callsign "Lincoln"          |
| Forrestal           | 59X   | 9    | CVN-59, Callsign "Forrestal"        |
| John C. Stennis     | 74X   | 14   | CVN-74, Callsign "Stennis"          |

### JTAC

| Callsign    | Frequency   | Modulation | Notes             |
| :---------- | :---------- | :--------- | :---------------- |
| Springfield | 241.000 MHz | AM         | JTAC 9-Line (Reaper Drone) |
| Uzi         | 31.000 MHz  | FM         | JTAC 9-Line (Reaper Drone) |

### Airbase TACAN

| Airbase | TACAN | Notes |
| :--- | :--- | :--- |
| Hamburg | 13X | Custom TACAN, not available by default |

### Airbase Frequencies

This mission uses a custom ATC script that is accessible via the F10 radio menu. The script uses the same frequencies as the default ATC, which can be found on the F10 map. All ATC communications are broadcast over SRS.

| Airbase                 | ATIS        | Tower 1     | Tower 2     |
| :---------------------- | :---------- | :---------- | :---------- |
| Hamburg                 | 126.950 AM  | 126.850 AM  | 252.350 AM  |
| Luneburg                | 136.600 AM  | 136.500 AM  | 254.550 AM  |
| Bremen                  | 118.550 AM  | 118.450 AM  | 251.100 AM  |
| Fassberg                | 122.200 AM  | 122.100 AM  | 251.000 AM  |
| Northeim                | 134.700 AM  | 134.600 AM  | 254.650 AM  |
| Braunschweig            | 120.150 AM  | 120.050 AM  | 250.350 AM  |
| Hannover                | 120.300 AM  | 120.200 AM  | 252.450 AM  |
| Gutersloh               | 252.300 AM  | 122.100 AM  | 252.200 AM  |
| Obermehler Schlotheim   | 123.000 AM  | 122.900 AM  | 252.050 AM  |
| Fritzlar                | 126.600 AM  | 126.500 AM  | 251.350 AM  |
| Frankfurt               | 127.400 AM  | -           | -           |

## 3. Logistics & Support (F10 Menu)

You can request support and manage logistics via the F10 radio menu. This costs command resources.

| Action                      | Cost  | Description                                                              |
| :-------------------------- | :---- | :----------------------------------------------------------------------- |
| Resupply Friendly Zone      | 200   | Delivers a single supply crate to a friendly zone to repair/build defenses. |
| Fully Upgrade Friendly Zone | 1000  | Fully upgrades and repairs a friendly zone.                            |
| Dynamic CAP                 | 500   | Spawns a friendly CAP flight to patrol a chosen area.                    |
| Dynamic Tanker (Drogue)     | 0     | Spawns a tanker with drogue refueling baskets.                           |
| Dynamic Tanker (Boom)       | 0     | Spawns a tanker with a refueling boom.                                   |
| Dynamic CAS                 | 500   | Spawns a CAS flight to attack a chosen enemy zone.                       |
| Dynamic Decoy               | 300   | Spawns a decoy flight to draw enemy attention.                           |
| Dynamic SEAD                | 500   | Spawns a SEAD flight to suppress enemy air defenses.                     |
| Dynamic Bomb Run            | 500   | Spawns a bomber flight to attack a chosen enemy zone.                    |
| Jtac 9line AM               | 0     | Deploys a reaper drone over a zone for JTAC (241.00 AM).                 |
| Jtac 9line FM               | 0     | Deploys a reaper drone over a zone for JTAC (31.00 FM).                  |
| Smoke Markers               | 20    | Marks targets in a zone with red smoke.                                  |
| Intel on Enemy Zone         | 150   | Provides intel on an enemy zone for 1 hour.                              |
| Emergency Capture           | 500   | Captures a neutral zone.                                                 |

## 4. Mission Objectives

The main objective is to capture all enemy zones.

*   **Capturing Zones:** To capture a zone, you must destroy all enemy ground units within its borders. Once a zone is clear of enemy presence, friendly ground forces will automatically be dispatched to capture it.
*   **Logistics:** You can help the war effort by transporting supplies with helicopters (e.g., UH-1H, Mi-8) or cargo planes (e.g., C-130). Pick up supplies from friendly bases and drop them at friendly or neutral zones.
*   **Frontline:** The frontline is dynamic and will shift based on which zones are captured.

## 5. Zones & Waypoints

| Zone Name             | Waypoint |
| :-------------------- | :------- |
| Hamburg               | 1        |
| Hamburg FARP          | 2        |
| Luneburg              | 3        |
| Rotenburg Farp        | 4        |
| Bremen                | 5        |
| Fassberg              | 6        |
| Northeim              | 7        |
| Parsau FARP           | 8        |
| Braunschweig          | 9        |
| Hannover              | 10       |
| SAM Liebenau          | 11       |
| Hameln FARP           | 12       |
| Quarry                | 13       |
| Gutersloh             | 14       |
| SAM Paderborn         | 15       |
| Obermehler Schlotheim | 16       |
| Fritzlar              | 17       |
| SAM Frielendorf       | 18       |
| Laubach FARP          | 19       |
| Frankfurt             | 20       |