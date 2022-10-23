--#region Variables

local vehicleClassNames = {
    [0] = GetLabelText('VEH_CLASS_0'), -- Compacts
    [1] = GetLabelText('VEH_CLASS_1'), -- Sedans
    [2] = GetLabelText('VEH_CLASS_2'), -- SUVs
    [3] = GetLabelText('VEH_CLASS_3'), -- Coupes
    [4] = GetLabelText('VEH_CLASS_4'), -- Muscle
    [5] = GetLabelText('VEH_CLASS_5'), -- Sports Classics
    [6] = GetLabelText('VEH_CLASS_6'), -- Sports
    [7] = GetLabelText('VEH_CLASS_7'), -- Super
    [8] = GetLabelText('VEH_CLASS_8'), -- Motorcycles
    [9] = GetLabelText('VEH_CLASS_9'), -- Offroad
    [10] = GetLabelText('VEH_CLASS_10'), -- Industrial
    [11] = GetLabelText('VEH_CLASS_11'), -- Utility
    [12] = GetLabelText('VEH_CLASS_12'), -- Vans
    [13] = GetLabelText('VEH_CLASS_13'), -- Cycles
    [14] = GetLabelText('VEH_CLASS_14'), -- Boats
    [15] = GetLabelText('VEH_CLASS_15'), -- Helicopters
    [16] = GetLabelText('VEH_CLASS_16'), -- Planes
    [17] = GetLabelText('VEH_CLASS_17'), -- Service
    [18] = GetLabelText('VEH_CLASS_18'), -- Emergency
    [19] = GetLabelText('VEH_CLASS_19'), -- Military
    [20] = GetLabelText('VEH_CLASS_20'), -- Commercial
    [21] = GetLabelText('VEH_CLASS_21'), -- Trains
    [22] = GetLabelText('VEH_CLASS_22'), -- Open Wheel
    [69] = 'Misc' -- For any other vehicles that haven't got a class set for some reason.
}

local vehicleDoorBoneNames = {
    [0] = 'door_dside_f',
    [1] = 'door_pside_f',
    [2] = 'door_dside_r',
    [3] = 'door_pside_r',
    [4] = 'bonnet',
    [5] = 'boot'
}

local vehicleModTypes = {
    [0] = {nil, 'Spoilers'},
    [1] = {nil, 'Front Bumper'},
    [2] = {nil, 'Rear Bumper'},
    [3] = {nil, 'Side Skirt'},
    [4] = {nil, 'Exhaust'},
    [5] = {nil, 'Chassis'},
    [6] = {nil, 'Grille'},
    [7] = {nil, 'Hood'},
    [8] = {nil, 'Fender'},
    [9] = {nil, 'Right Fender'},
    [10] = {nil, 'Roof'},
    [11] = {'CMOD_MOD_ENG', 'Engine'},
    [12] = {'CMOD_MOD_BRA', 'Brakes'},
    [13] = {'CMOD_MOD_TRN', 'Transmission'},
    [14] = {'CMOD_MOD_HRN', 'Horns'},
    [15] = {'CMOD_MOD_SUS', 'Suspension'},
    [16] = {'CMOD_MOD_ARM', 'Armor'},
    [23] = {'CMOD_WHE0_0', 'Front Wheel'},
    [24] = {'CMOD_WHE0_1', 'Rear Wheel'},
    [25] = {'CMM_MOD_S0', 'Plate Holder'},
    [26] = {'CMM_MOD_S1', 'Vanity Plates'},
    [27] = {'CMM_MOD_S2', 'Trim Design'},
    [28] = {'CMM_MOD_S3', 'Ornaments'},
    [29] = {'CMM_MOD_S4', 'Dashboard'},
    [30] = {'CMM_MOD_S5', 'Dial Design'},
    [31] = {'CMM_MOD_S6', 'Door Speakers'},
    [32] = {'CMM_MOD_S7', 'Seats'},
    [33] = {'CMM_MOD_S8', 'Steering Wheels'},
    [34] = {'CMM_MOD_S9', 'Column Shifter Levers'},
    [35] = {'CMM_MOD_S10', 'Plaques'},
    [36] = {'CMM_MOD_S11', 'Speakers'},
    [37] = {'CMM_MOD_S12', 'Trunk'},
    [38] = {'CMM_MOD_S13', 'Hydraulics'},
    [39] = {'CMM_MOD_S14', 'Engine Block'},
    [40] = {'CMM_MOD_S15', 'Air Filter'},
    [41] = {'CMM_MOD_S16', 'Struts'},
    [42] = {'CMM_MOD_S17', 'Arch Cover'},
    [43] = {'CMM_MOD_S18', 'Aerials'},
    [44] = {'CMM_MOD_S19', 'Trim'},
    [45] = {'CMM_MOD_S20', 'Tank'},
    [46] = {'CMM_MOD_S21', 'Windows'},
    [47] = {'CMM_MOD_S22', 'Mod 47'},
    [48] = {'CMM_MOD_S23', 'Livery'}
}

local vehicleHornNames = {
    [-1] = {'CMOD_HRN_0', 'Stock Horn'},
    [0] = {'CMOD_HRN_TRK','Truck Horn'},
    [1] = {'CMOD_HRN_COP', 'Cop Horn'},
    [2] = {'CMOD_HRN_CLO', 'Clown Horn'},
    [3] = {'CMOD_HRN_MUS1', 'Musical Horn 1'},
    [4] = {'CMOD_HRN_MUS2', 'Musical Horn 2'},
    [5] = {'CMOD_HRN_MUS3', 'Musical Horn 3'},
    [6] = {'CMOD_HRN_MUS4', 'Musical Horn 4'},
    [7] = {'CMOD_HRN_MUS5', 'Musical Horn 5'},
    [8] = {'CMOD_HRN_SAD', 'Sad Trombone'},
    [9] = {'HORN_CLAS1', 'Classical Horn 1'},
    [10] = {'HORN_CLAS2', 'Classical Horn 2'},
    [11] = {'HORN_CLAS3', 'Classical Horn 3'},
    [12] = {'HORN_CLAS4', 'Classical Horn 4'},
    [13] = {'HORN_CLAS5', 'Classical Horn 5'},
    [14] = {'HORN_CLAS6', 'Classical Horn 6'},
    [15] = {'HORN_CLAS7', 'Classical Horn 7'},
    [16] = {'HORN_CNOTE_C0', 'Scale Do'},
    [17] = {'HORN_CNOTE_D0', 'Scale Re'},
    [18] = {'HORN_CNOTE_E0', 'Scale Mi'},
    [19] = {'HORN_CNOTE_F0', 'Scale Fa'},
    [20] = {'HORN_CNOTE_G0', 'Scale Sol'},
    [21] = {'HORN_CNOTE_A0', 'Scale La'},
    [22] = {'HORN_CNOTE_B0', 'Scale Ti'},
    [23] = {'HORN_CNOTE_C1', 'Scale Do (High)'},
    [24] = {'HORN_HIPS1', 'Jazz Horn 1'},
    [25] = {'HORN_HIPS2', 'Jazz Horn 2'},
    [26] = {'HORN_HIPS3', 'Jazz Horn 3'},
    [27] = {'HORN_HIPS4', 'Jazz Horn Loop'},
    [28] = {'HORN_INDI_1', 'Star Spangled Banner 1'},
    [29] = {'HORN_INDI_2', 'Star Spangled Banner 2'},
    [30] = {'HORN_INDI_3', 'Star Spangled Banner 3'},
    [31] = {'HORN_INDI_4', 'Star Spangled Banner 4'},
    [32] = {'HORN_LUXE2', 'Classical Horn Loop 1'},
    [33] = {'HORN_LUXE1', 'Classical Horn 8'},
    [34] = {'HORN_LUXE3', 'Classical Horn Loop 2'},
    [35] = {'HORN_LUXE2', 'Classical Horn Loop 1'},
    [36] = {'HORN_LUXE1', 'Classical Horn 8'},
    [37] = {'HORN_LUXE3', 'Classical Horn Loop 2'},
    [38] = {'HORN_HWEEN1', 'Halloween Loop 1'},
    [39] = {'HORN_HWEEN1', 'Halloween Loop 1'},
    [40] = {'HORN_HWEEN2', 'Halloween Loop 2'},
    [41] = {'HORN_HWEEN2', 'Halloween Loop 2'},
    [42] = {'HORN_LOWRDER1', 'San Andreas Loop'},
    [43] = {'HORN_LOWRDER1', 'San Andreas Loop'},
    [44] = {'HORN_LOWRDER2', 'Liberty City Loop'},
    [45] = {'HORN_LOWRDER2', 'Liberty City Loop'},
    [46] = {'HORN_XM15_1', 'Festive Loop 1'},
    [47] = {'HORN_XM15_2', 'Festive Loop 2'},
    [48] = {'HORN_XM15_3', 'Festive Loop 3'}
}

local vehicleWheelTypes = {
    [0] = 'Sports',
    [1] = 'Muscle',
    [2] = 'Lowrider',
    [3] = 'SUV',
    [4] = 'Offroad',
    [5] = 'Tuner',
    [6] = 'Bike Wheels',
    [7] = 'High End',
    [8] = 'Benny\'s Original',
    [9] = 'Benny\' Bespoke',
    [10] = 'Open Wheel',
    [11] = 'Street',
    [12] = 'Track'
}

local vehicleXenonColors = {
    [-1] = 'Default',
    [0] = 'White',
    [1] = 'Blue',
    [2] = 'Electric Blue',
    [3] = 'Mint Green',
    [4] = 'Lime Green',
    [5] = 'Yellow',
    [6] = 'Golden Shower',
    [7] = 'Orange',
    [8] = 'Red',
    [9] = 'Pony Pink',
    [10] = 'Hot Pink',
    [11] = 'Purple',
    [12] = 'Blacklight'
}

local vehicleTireSmokeColors = {
    {'Red', vec3(244, 65, 65)},
    {'Orange', vec3(244, 167, 66)},
    {'Yellow', vec3(244, 217, 65)},
    {'Gold', vec3(181, 120, 0)},
    {'Light Green', vec3(158, 255, 84)},
    {'Dark Green', vec3(44, 94, 5)},
    {'Light Blue', vec3(65, 211, 244)},
    {'Dark Blue', vec3(24, 54, 163)},
    {'Purple', vec3(108, 24, 192)},
    {'Pink', vec3(192, 24, 172)},
    {'Black', vec3(1, 1, 1)}
}

local vehicleWindowTints = {
    {0, 'None'},
    {4, 'Stock'},
    {5, 'Limo'},
    {3, 'Light Smoke'},
    {2, 'Dark Smoke'},
    {1, 'Pure Black'},
    {6, 'Green'}
}

if GetLabelText('veh_color_taxi_yellow') == 'NULL' then
    AddTextEntry('veh_color_taxi_yellow', ('Taxi %s'):format(GetLabelText('IEC_T20_2')))
end

if GetLabelText('veh_color_off_white') == 'NULL' then
    AddTextEntry('veh_color_off_white', 'Off White')
end

if GetLabelText('VERY_DARK_BLUE') == 'NULL' then
    AddTextEntry('VERY_DARK_BLUE', 'Very Dark Blue')
end

local vehicleClassicColors = {
    {0, GetLabelText('BLACK')},
    {1, GetLabelText('GRAPHITE')},
    {2, GetLabelText('BLACK_STEEL')},
    {3, GetLabelText('DARK_SILVER')},
    {4, GetLabelText('SILVER')},
    {5, GetLabelText('BLUE_SILVER')},
    {6, GetLabelText('ROLLED_STEEL')},
    {7, GetLabelText('SHADOW_SILVER')},
    {8, GetLabelText('STONE_SILVER')},
    {9, GetLabelText('MIDNIGHT_SILVER')},
    {10, GetLabelText('CAST_IRON_SIL')},
    {11, GetLabelText('ANTHR_BLACK')},

    {27, GetLabelText('RED')},
    {28, GetLabelText('TORINO_RED')},
    {29, GetLabelText('FORMULA_RED')},
    {30, GetLabelText('BLAZE_RED')},
    {31, GetLabelText('GRACE_RED')},
    {32, GetLabelText('GARNET_RED')},
    {33, GetLabelText('SUNSET_RED')},
    {34, GetLabelText('CABERNET_RED')},
    {35, GetLabelText('CANDY_RED')},
    {36, GetLabelText('SUNRISE_ORANGE')},
    {37, GetLabelText('GOLD')},
    {38, GetLabelText('ORANGE')},

    {49, GetLabelText('DARK_GREEN')},
    {50, GetLabelText('RACING_GREEN')},
    {51, GetLabelText('SEA_GREEN')},
    {52, GetLabelText('OLIVE_GREEN')},
    {53, GetLabelText('BRIGHT_GREEN')},
    {54, GetLabelText('PETROL_GREEN')},

    {61, GetLabelText('GALAXY_BLUE')},
    {62, GetLabelText('DARK_BLUE')},
    {63, GetLabelText('SAXON_BLUE')},
    {64, GetLabelText('BLUE')},
    {65, GetLabelText('MARINER_BLUE')},
    {66, GetLabelText('HARBOR_BLUE')},
    {67, GetLabelText('DIAMOND_BLUE')},
    {68, GetLabelText('SURF_BLUE')},
    {69, GetLabelText('NAUTICAL_BLUE')},
    {70, GetLabelText('ULTRA_BLUE')},
    {71, GetLabelText('PURPLE')},
    {72, GetLabelText('SPIN_PURPLE')},
    {73, GetLabelText('RACING_BLUE')},
    {74, GetLabelText('LIGHT_BLUE')},

    {88, GetLabelText('YELLOW')},
    {89, GetLabelText('RACE_YELLOW')},
    {90, GetLabelText('BRONZE')},
    {91, GetLabelText('FLUR_YELLOW')},
    {92, GetLabelText('LIME_GREEN')},

    {94, GetLabelText('UMBER_BROWN')},
    {95, GetLabelText('CREEK_BROWN')},
    {96, GetLabelText('CHOCOLATE_BROWN')},
    {97, GetLabelText('MAPLE_BROWN')},
    {98, GetLabelText('SADDLE_BROWN')},
    {99, GetLabelText('STRAW_BROWN')},
    {100, GetLabelText('MOSS_BROWN')},
    {101, GetLabelText('BISON_BROWN')},
    {102, GetLabelText('WOODBEECH_BROWN')},
    {103, GetLabelText('BEECHWOOD_BROWN')},
    {104, GetLabelText('SIENNA_BROWN')},
    {105, GetLabelText('SANDY_BROWN')},
    {106, GetLabelText('BLEECHED_BROWN')},
    {107, GetLabelText('CREAM')},

    {111, GetLabelText('WHITE')},
    {112, GetLabelText('FROST_WHITE')},

    {135, GetLabelText('HOT PINK')},
    {136, GetLabelText('SALMON_PINK')},
    {137, GetLabelText('PINK')},
    {138, GetLabelText('BRIGHT_ORANGE')},

    {141, GetLabelText('MIDNIGHT_BLUE')},
    {142, GetLabelText('MIGHT_PURPLE')},
    {143, GetLabelText('WINE_RED')},

    {145, GetLabelText('BRIGHT_PURPLE')},
    {146, GetLabelText('VERY_DARK_BLUE')},
    {147, GetLabelText('BLACK_GRAPHITE')},

    {150, GetLabelText('LAVA_RED')},
}

local vehicleClassicColorsArray = {}

for i = 1, #vehicleClassicColors do
    vehicleClassicColorsArray[i] = vehicleClassicColors[i][2]
end

local vehicleMatteColors = {
    {12, GetLabelText('BLACK')},
    {13, GetLabelText('GREY')},
    {14, GetLabelText('LIGHT_GREY')},

    {39, GetLabelText('RED')},
    {40, GetLabelText('DARK_RED')},
    {41, GetLabelText('ORANGE')},
    {42, GetLabelText('YELLOW')},

    {55, GetLabelText('LIME_GREEN')},

    {82, GetLabelText('DARK_BLUE')},
    {83, GetLabelText('BLUE')},
    {84, GetLabelText('MIDNIGHT_BLUE')},

    {128, GetLabelText('GREEN')},

    {148, GetLabelText('Purple')},
    {149, GetLabelText('MIGHT_PURPLE')},

    {151, GetLabelText('MATTE_FOR')},
    {152, GetLabelText('MATTE_OD')},
    {153, GetLabelText('MATTE_DIRT')},
    {154, GetLabelText('MATTE_DESERT')},
    {155, GetLabelText('MATTE_FOIL')},
}

local vehicleMatteColorsArray = {}

for i = 1, #vehicleMatteColors do
    vehicleMatteColorsArray[i] = vehicleMatteColors[i][2]
end

local vehicleMetalColors = {
    {117, GetLabelText('BR_STEEL')},
    {118, GetLabelText('BR BLACK_STEEL')},
    {119, GetLabelText('BR_ALUMINIUM')},

    {158, GetLabelText('GOLD_P')},
    {159, GetLabelText('GOLD_S')},
}

local vehicleMetalColorsArray = {}

for i = 1, #vehicleMetalColors do
    vehicleMetalColorsArray[i] = vehicleMetalColors[i][2]
end

local vehicleUtilColors = {
    {15, GetLabelText('BLACK')},
    {16, GetLabelText('FMMC_COL1_1')},
    {17, GetLabelText('DARK_SILVER')},
    {18, GetLabelText('SILVER')},
    {19, GetLabelText('BLACK_STEEL')},
    {20, GetLabelText('SHADOW_SILVER')},

    {43, GetLabelText('DARK_RED')},
    {44, GetLabelText('RED')},
    {45, GetLabelText('GARNET_RED')},

    {56, GetLabelText('DARK_GREEN')},
    {57, GetLabelText('GREEN')},

    {75, GetLabelText('DARK_BLUE')},
    {76, GetLabelText('MIDNIGHT_BLUE')},
    {77, GetLabelText('SAXON_BLUE')},
    {78, GetLabelText('NAUTICAL_BLUE')},
    {79, GetLabelText('BLUE')},
    {80, GetLabelText('FMMC_COL1_13')},
    {81, GetLabelText('BRIGHT_PURPLE')},

    {93, GetLabelText('STRAW_BROWN')},

    {108, GetLabelText('UMBER_BROWN')},
    {109, GetLabelText('MOSS_BROWN')},
    {110, GetLabelText('SANDY_BROWN')},

    {122, GetLabelText('veh_color_off_white')},

    {125, GetLabelText('BRIGHT_GREEN')},

    {127, GetLabelText('HARBOR_BLUE')},

    {134, GetLabelText('FROST_WHITE')},

    {139, GetLabelText('LIME_GREEN')},
    {140, GetLabelText('ULTRA_BLUE')},

    {144, GetLabelText('GREY')},

    {157, GetLabelText('LIGHT_BLUE')},

    {160, GetLabelText('YELLOW')},
}

local vehicleUtilColorsArray = {}

for i = 1, #vehicleUtilColors do
    vehicleUtilColorsArray[i] = vehicleUtilColors[i][2]
end

local vehicleWornColors = {
    {21, GetLabelText('BLACK')},
    {22, GetLabelText('GRAPHITE')},
    {23, GetLabelText('LIGHT_GREY')},
    {24, GetLabelText('SILVER')},
    {25, GetLabelText('BLUE_SILVER')},
    {26, GetLabelText('SHADOW_SILVER')},

    {46, GetLabelText('RED')},
    {47, GetLabelText('SALMON_PINK')},
    {48, GetLabelText('DARK_RED')},

    {58, GetLabelText('DARK_GREEN')},
    {59, GetLabelText('GREEN')},
    {60, GetLabelText('SEA_GREEN')},

    {85, GetLabelText('DARK_BLUE')},
    {86, GetLabelText('BLUE')},
    {87, GetLabelText('LIGHT_BLUE')},

    {113, GetLabelText('SANDY_BROWN')},
    {114, GetLabelText('BISON_BROWN')},
    {115, GetLabelText('CREEK_BROWN')},
    {116, GetLabelText('BLEECHED_BROWN')},

    {121, GetLabelText('veh_color_off_white')},

    {123, GetLabelText('ORANGE')},
    {124, GetLabelText('SUNRISE_ORANGE')},

    {126, GetLabelText('veh_color_taxi_yellow')},

    {129, GetLabelText('RACING_GREEN')},
    {130, GetLabelText('ORANGE')},
    {131, GetLabelText('WHITE')},
    {132, GetLabelText('FROST_WHITE')},
    {133, GetLabelText('OLIVE_GREEN')},
}

local vehicleWornColorsArray = {}

for i = 1, #vehicleWornColors do
    vehicleWornColorsArray[i] = vehicleWornColors[i][2]
end

local vehicleWheelColors = {
    {156, 'Default Alloy'},
    table.unpack(vehicleClassicColors)
}

local vehicleWheelColorsArray = {}

for i = 1, #vehicleWheelColors do
    vehicleWheelColorsArray[i] = vehicleWheelColors[i][2]
end

local rgbValuesArray = {}

for i = 1, 256 do
    rgbValuesArray[i] = i - 1
end

local vehicleNeonLightColors = {
    {0, GetLabelText('CMOD_NEONCOL_0'), vec3(222, 222, 255)},
    {1, GetLabelText('CMOD_NEONCOL_1'), vec3(2, 21, 255)},
    {2, GetLabelText('CMOD_NEONCOL_2'), vec3(3, 83, 255)},
    {3, GetLabelText('CMOD_NEONCOL_3'), vec3(0, 255, 140)},
    {4, GetLabelText('CMOD_NEONCOL_4'), vec3(94, 255, 1)},
    {5, GetLabelText('CMOD_NEONCOL_5'), vec3(255, 255, 0)},
    {6, GetLabelText('CMOD_NEONCOL_6'), vec3(255, 150, 0)},
    {7, GetLabelText('CMOD_NEONCOL_7'), vec3(255, 62, 0)},
    {8, GetLabelText('CMOD_NEONCOL_8'), vec3(255, 1, 1)},
    {9, GetLabelText('CMOD_NEONCOL_9'), vec3(255, 50, 100)},
    {10, GetLabelText('CMOD_NEONCOL_10'), vec3(255, 5, 190)},
    {11, GetLabelText('CMOD_NEONCOL_11'), vec3(35, 1, 255)},
    {12, GetLabelText('CMOD_NEONCOL_12'), vec3(15, 3, 255)},
}

local vehicleNeonLightColorsArray = {}

for i = 1, #vehicleNeonLightColors do
    vehicleNeonLightColorsArray[i] = vehicleNeonLightColors[i][2]
end

local vehicleLicensePlates = {
    {3, GetLabelText('CMOD_PLA_0')},
    {0, GetLabelText('CMOD_PLA_1')},
    {4, GetLabelText('CMOD_PLA_2')},
    {2, GetLabelText('CMOD_PLA_3')},
    {1, GetLabelText('CMOD_PLA_4')},
    {5, 'North Yankton'}
}

local vehicleLicensePlatesArray = {}

for i = 1, #vehicleLicensePlates do
    vehicleLicensePlatesArray[i] = vehicleLicensePlates[i][2]
end

local vehicleRadioStations = {}

vehicleRadioStations[1] = {'OFF', GetLabelText('RADIO_OFF')}

for i = 0, 23 do
    vehicleRadioStations[i + 2] = {GetRadioStationName(i), GetLabelText(GetRadioStationName(i))}
end

local vehicleRadioStationsArray = {}

for i = 1, #vehicleRadioStations do
    vehicleRadioStationsArray[i] = vehicleRadioStations[i][2]
end

local vehicleDoors = {
    'Left Front Door',
    'Right Front Door',
    'Left Rear Door',
    'Right Rear Door',
    'Hood',
    'Trunk',
    'Extra Door (#1)',
    'Extra Door (#2)'
}

local vehicleModsMenuData = {}
local spawnInVehicle = true -- Teleport into the vehicle you're spawning
local replacePreviousVehicle = true -- Replace the previous vehicle you were in when spawning a new vehicle
local vehicleGodMode = false
local vehicleInvincible = false
local vehicleEngineDamage = false
local vehicleVisualDamage = false
local vehicleStrongWheels = false
local vehicleRampDamage = false
local vehicleAutoRepair = false
local vehicleNeverDirty = false
local vehicleDirtLevelSetter = 0
local vehicleUseCustomXenonColor = false
local vehicleUseCustomTireSmokeColor = false
local vehicleUseCustomNeonColor = false
local vehicleRemoveDoors = false
local vehicleUseBikeSeatbelt = false
local vehicleUseTorqueMultiplier = false
local vehicleUsePowerMultiplier = false
local vehicleTorqueMultiplier = 2
local vehiclePowerMultiplier = 2
local disablePlaneTurbulence = false
local vehicleFrozen = false
local vehicleFrozenRPM = 0
local vehicleFrozenSpeed = 0
local vehicleEngineAlwaysOn = false
local vehicleInfiniteFuel = false
local vehicleShowHealth = false
local vehicleDefaultRadio = 'OFF'
local canWearHelmet = true
local vehicleHighbeamsOnHonk = false

--#endregion Variables

--#region Functions

local function isInVehicle(checkDriver)
    if not cache.vehicle then
        return false, 'You need to be in a vehicle to perform this action'
    end

    if checkDriver and GetPedInVehicleSeat(cache.vehicle, -1) ~= cache.ped then
        return false, 'You need to be the driver of the vehicle to perform this action'
    end

    return true
end

local function getHealthString(health)
    local color = ''
    if health <= 0 then
        return ('~r~%s'):format(health)
    end

    local mappedHealth = math.floor(health * 4 / 1000)
    if mappedHealth == 0 then
        color = '~r~'
    elseif mappedHealth == 1 then
        color = '~o~'
    elseif mappedHealth == 2 then
        color = '~y~'
    else
        color = '~g~'
    end
    return ('%s%s'):format(color, health)
end

local function drawTextOnScreen(text, x, y, size, position --[[ 0: center | 1: left | 2: right ]], font, disableTextOutline)
    if not IsHudPreferenceSwitchedOn()
    or IsHudHidden()
    --[[or settings.hidehud]]
    or IsPlayerSwitchInProgress()
    or IsScreenFadedOut()
    or IsPauseMenuActive()
    or IsFrontendFading()
    or IsPauseMenuRestarting()
    then
        return
    end

    size = size or 0.48
    position = position or 1
    font = font or 6

    SetTextFont(font)
    SetTextScale(1.0, size)
    if position == 2 then
        SetTextWrap(0, x)
    end
    SetTextJustification(position)
    if not disableTextOutline then
        SetTextOutline()
    end
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x, y)
end

local function spawnVehicleOnPlayer(model)
    if not IsModelAVehicle(model) then return end

    local speed = 0.0
    local rpm = 0.0

    if IsPedInAnyVehicle(cache.ped, false) and spawnInVehicle then
        local oldVeh = GetVehiclePedIsIn(cache.ped, false)
        speed = GetEntitySpeedVector(oldVeh, true).y
        rpm = GetVehicleCurrentRpm(oldVeh)
    end

    lib.requestModel(model)

    local otherCoords = spawnInVehicle and GetEntityCoords(cache.ped, true) or GetOffsetFromEntityInWorldCoords(cache.ped, 0.0, 8.0, 0.0)
    local coords = vec4(otherCoords.x, otherCoords.y, otherCoords.z + 1, GetEntityHeading(cache.ped) + (spawnInVehicle and 0 or 90))

    local previousVehicle = GetVehiclePedIsIn(cache.ped, true)

    if previousVehicle ~= 0 then
        if IsVehiclePreviouslyOwnedByPlayer(previousVehicle) and ((GetVehicleNumberOfPassengers(previousVehicle) and IsVehicleSeatFree(previousVehicle, -1)) or GetPedInVehicleSeat(previousVehicle, -1) == cache.ped) then
            if replacePreviousVehicle then
                SetVehicleHasBeenOwnedByPlayer(previousVehicle, false)
                SetEntityAsMissionEntity(previousVehicle, false, true)
                DeleteEntity(previousVehicle)
            else
                SetEntityAsMissionEntity(previousVehicle, false, false)
            end
            previousVehicle = 0
        end
    end

    if IsPedInAnyVehicle(cache.ped, false) and replacePreviousVehicle then
        local tempVeh = GetVehiclePedIsIn(cache.ped, false)
        SetVehicleHasBeenOwnedByPlayer(tempVeh, false)
        SetEntityAsMissionEntity(cache.ped, true, true)

        if previousVehicle ~= 0 and previousVehicle == tempVeh then
            previousVehicle = 0
        end

        SetEntityAsMissionEntity(tempVeh, false, true)
        DeleteEntity(tempVeh)
        tempVeh = 0
    end

    if previousVehicle ~= 0 then
        SetVehicleHasBeenOwnedByPlayer(previousVehicle, false)
    end

    if IsPedInAnyVehicle(cache.ped, false) then
        local offset = GetOffsetFromEntityInWorldCoords(cache.vehicle, 0, 10 + GetEntitySpeed(cache.vehicle) / 2, 0)
        coords = vec4(offset.x, offset.y, offset.z, coords.w)
    end

    local netVeh = lib.callback.await('berkie_menu:server:spawnVehicle', false, model, coords)
    while netVeh == 0 or not DoesEntityExist(NetToVeh(netVeh)) do
        Wait(0)
    end
    local vehicle = NetToVeh(netVeh)
    if vehicle == 0 then
        lib.notify({
            description = 'Something went wrong spawning the vehicle',
            type = 'error'
        })
        return
    end
    SetVehicleNeedsToBeHotwired(vehicle, false)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetEntityAsMissionEntity(vehicle, true, false)
    SetVehicleIsStolen(vehicle, false)
    SetVehicleIsWanted(vehicle, false)

    if spawnInVehicle then
        SetVehicleEngineOn(vehicle, true, true, true)

        SetPedIntoVehicle(cache.ped, vehicle, -1)

        if GetVehicleClass(vehicle) == 15 and GetEntityHeightAboveGround(vehicle) > 10 then
            SetHeliBladesFullSpeed(vehicle)
        else
            SetVehicleOnGroundProperly(vehicle)
        end
    end

    if not IsThisModelATrain(model) then -- I don't know why, but it's to be careful, so never remove this
        SetVehicleForwardSpeed(vehicle, speed)
    end

    SetVehicleCurrentRpm(vehicle, rpm)

    SetVehicleRadioEnabled(vehicle, true)
    Wait(10) -- SetVehicleRadioEnabled sets the radio to a random one or the previous one, so we have to wait before overriding it
    SetVehRadioStation(vehicle, vehicleDefaultRadio)

    SetModelAsNoLongerNeeded(model)
end

local function getVehiclesFromClassName(className)
    local result = {}
    for _, v in pairs(Vehicles) do
        if v.className == className then
            result[#result+1] = v
        end
    end
    return result
end

local function getAllPossibleMods()
    local result = {}
    for k in pairs(vehicleModTypes) do
        local amount = GetNumVehicleMods(cache.vehicle, k)
        if amount > 0 then
            result[k] = amount
        end
    end
    return result
end

local function getModLocalizedType(mod)
    local alt
    local alt2
    local vehModel = GetEntityModel(cache.vehicle)

    if mod == 23 then
        if not IsThisModelABike(vehModel) and IsThisModelABicycle(vehModel) then
            alt = 'CMOD_MOD_WHEM'
            alt2 = 'Wheels'
        end
    elseif mod == 27 then
        if vehModel == `sultanrs` then
            alt = 'CMM_MOD_S2b'
        end
    elseif mod == 40 then
        if vehModel == `sultanrs` then
            alt = 'CMM_MOD_S15b'
        end
    elseif mod == 41 then
        if vehModel == `sultanrs` or vehModel == `banshee2` then
            alt = 'CMM_MOD_S16b'
        end
    elseif mod == 42 then
        if vehModel == `sultanrs` then
            alt = 'CMM_MOD_S17b'
        end
    elseif mod == 43 then
        if vehModel == `sultanrs` then
            alt = 'CMM_MOD_S18b'
        end
    elseif mod == 44 then
        if vehModel == `sultanrs` then
            alt = 'CMM_MOD_S19b'
        elseif vehModel == `btype3` then
            alt = 'CMM_MOD_S19c'
        elseif vehModel == `virgo2` then
            alt = 'CMM_MOD_S19d'
        end
    elseif mod == 45 then
        if vehModel == `slamvan3` then
            alt = 'CMM_MOD_S27'
        end
    elseif mod == 46 then
        if vehModel == `btype3` then
            alt = 'CMM_MOD_S21b'
        end
    elseif mod == 47 then
        if vehModel == `slamvan3` then
            alt = 'SLVAN3_RDOOR'
        end
    end

    local name = alt or vehicleModTypes[mod]?[1] or GetModSlotName(cache.vehicle, mod)

    return DoesTextLabelExist(name) and GetLabelText(name) or alt2 or vehicleModTypes[mod]?[2]
end

local function getModLocalizedName(modType, mod)
    local modCount = GetNumVehicleMods(cache.vehicle, modType)
    if mod < -1 or mod >= modCount then return end

    local vehModel = GetEntityModel(cache.vehicle)

    if modType == 14 then
        local horn = vehicleHornNames[mod]
        if horn then
            if DoesTextLabelExist(horn[1]) then
                return GetLabelText(horn[1])
            end
            return horn[2]
        end
        return
    elseif modType == 23 or modType == 24 then
        if mod == -1 then
            if not IsThisModelABike(vehModel) and IsThisModelABicycle(vehModel) then
                return DoesTextLabelExist('CMOD_WHE_0') and GetLabelText('CMOD_WHE_0') or nil
            else
                return DoesTextLabelExist('CMOD_WHE_B_0') and GetLabelText('CMOD_WHE_B_0') or nil
            end
        end

        if mod >= modCount / 2 then
            local modLabel = GetModTextLabel(cache.vehicle, modType, mod)
            return ('%s %s'):format((DoesTextLabelExist('CHROME') and GetLabelText('CHROME') or ''), (DoesTextLabelExist(modLabel) and GetLabelText(modLabel) or ''))
        else
            local modLabel = GetModTextLabel(cache.vehicle, modType, mod)
            return DoesTextLabelExist(modLabel) and GetLabelText(modLabel) or nil
        end
    elseif modType == 16 then
        local modLabel = ('CMOD_ARM_%s'):format(mod + 1)
        return DoesTextLabelExist(modLabel) and GetLabelText(modLabel) or nil
    elseif modType == 12 then
        local modLabel = ('CMOD_BRA_%s'):format(mod + 1)
        return DoesTextLabelExist(modLabel) and GetLabelText(modLabel) or nil
    elseif modType == 11 then
        if mod == -1 then
            -- Engine doesn't list anything in LSC for no parts, but there is a setting with no part. so just use armours none
            return DoesTextLabelExist('CMOD_ARM_0') and GetLabelText('CMOD_ARM_0') or nil
        end
        local modLabel = ('CMOD_ENG_%s'):format(mod + 2)
        return DoesTextLabelExist(modLabel) and GetLabelText(modLabel) or nil
    elseif modType == 15 then
        local modLabel = ('CMOD_SUS_%s'):format(mod + 1)
        return DoesTextLabelExist(modLabel) and GetLabelText(modLabel) or nil
    elseif modType == 13 then
        local modLabel = ('CMOD_GBX_%s'):format(mod + 1)
        return DoesTextLabelExist(modLabel) and GetLabelText(modLabel) or nil
    end

    if mod > -1 then
        local modLabel = GetModTextLabel(cache.vehicle, modType, mod)
        return DoesTextLabelExist(modLabel) and GetLabelText(modLabel) or ('%s %s'):format(getModLocalizedType(modType), mod + 1)
    else
        if modType == 41 then
            if vehModel == `banshee` or vehModel == `banshee2` or vehModel == `sultanrs` then
                return DoesTextLabelExist('CMOD_COL5_41') and GetLabelText('CMOD_COL5_41') or nil
            end
        end
        return DoesTextLabelExist('CMOD_DEF_0') and GetLabelText('CMOD_DEF_0') or nil
    end
end

local function setupModMenu()
    if not HasThisAdditionalTextLoaded('mod_mnu', 10) then
        ClearAdditionalText(10, true)
        RequestAdditionalText('mod_mnu', 10)
        while not HasThisAdditionalTextLoaded('mod_mnu', 10) do
            Wait(100)
        end
    end

    local vehModel = GetEntityModel(cache.vehicle)

    local id = 'berkie_menu_vehicle_options_mod_menu'
    lib.setMenuOptions(id, {[1] = true}) -- Add the one arg to make the override successful, otherwise it fails because it expects atleast one option, but it'll override down here anyway
    SetVehicleModKit(cache.vehicle, 0)
    local mods = getAllPossibleMods()
    local i = 1
    for k, v in pairs(mods) do
        local values = {}
        local args = {}
        local localizedName = getModLocalizedType(k)
        values[1] = ('Stock %s'):format(localizedName)
        args[1] = {-1, k}

        for i2 = 1, v do
            local actualIndex = i2 - 1
            local localizedModName = getModLocalizedName(k, actualIndex)
            values[i2 + 1] = localizedModName and ToProperCase(localizedModName) or ('%s #%s'):format(localizedName, actualIndex)
            args[i2 + 1] = {actualIndex, k}
        end

        vehicleModsMenuData[k] = {i, {label = localizedName, description = ('Choose a %s upgrade, it will apply automatically'):format(localizedName), args = args, values = values, defaultIndex = GetVehicleMod(cache.vehicle, k) + 2, close = false}}

        lib.setMenuOptions(id, vehicleModsMenuData[k][2], i)
        i += 1
    end

    if not IsThisModelABoat(vehModel) and not IsThisModelAHeli(vehModel) and not IsThisModelAPlane(vehModel) and not IsThisModelABicycle(vehModel) and not IsThisModelATrain(vehModel) then
        local valuesWheelType = {}
        for i2 = 0, #vehicleWheelTypes do
            valuesWheelType[i2 + 1] = vehicleWheelTypes[i2]
        end
        if IsThisModelABike(vehModel) then
            valuesWheelType = {'Bike Wheels'}
        elseif GetVehicleClass(cache.vehicle) == 22 then
            valuesWheelType = {'Open Wheel'}
        end

        local wheelTypeIndex = GetVehicleWheelType(cache.vehicle) + 1
        vehicleModsMenuData['wheel_type'] = {i, {label = 'Wheel Type', description = 'Choose a wheel type for your vehicle', args = 'wheel_type', values = valuesWheelType, defaultIndex = #valuesWheelType == 1 and 1 or wheelTypeIndex, close = false}}
        lib.setMenuOptions(id, vehicleModsMenuData['wheel_type'][2], i)
        i += 1
    end

    vehicleModsMenuData['custom_tires'] = {i, {label = 'Custom Tires', description = 'Enabling this will make your tire have the custom marking on it', args = 'custom_tires', values = {'Yes', 'No'}, defaultIndex = vehicleCustomTires and 1 or 2, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['custom_tires'][2], i)
    i += 1

    vehicleModsMenuData['xenon_headlights'] = {i, {label = 'Xenon Headlights', description = 'Enable or disable xenon headlights', args = 'xenon_headlights', values = {'Yes', 'No'}, defaultIndex = IsToggleModOn(cache.vehicle, 22) and 1 or 2, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['xenon_headlights'][2], i)
    i += 1

    vehicleModsMenuData['turbo'] = {i, {label = 'Turbo', description = 'Enable or disable turbo', args = 'turbo', values = {'Yes', 'No'}, defaultIndex = IsToggleModOn(cache.vehicle, 18) and 1 or 2, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['turbo'][2], i)
    i += 1

    vehicleModsMenuData['bullet_proof_tires'] = {i, {label = 'Bullet Proof Tires', description = 'Enable or disable bullet proof tires', args = 'bullet_proof_tires', values = {'Yes', 'No'}, defaultIndex = GetVehicleTyresCanBurst(cache.vehicle) and 2 or 1, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['bullet_proof_tires'][2], i)
    i += 1

    local vehiclePresetXenonColors = {}

    for i2 = -1, 12 do
        vehiclePresetXenonColors[i2 + 2] = vehicleXenonColors[i2]
    end

    local currentXenonColor = GetVehicleXenonLightsColor(cache.vehicle)
    currentXenonColor = (currentXenonColor < 0 or currentXenonColor > 12) and -1 or currentXenonColor

    vehicleModsMenuData['xenon_color_mode'] = {i, {label = 'Xenon Headlights Color Mode', description = 'Set the color mode for your xenon headlights', args = 'xenon_color_mode', values = {'Preset', 'Custom'}, defaultIndex = vehicleUseCustomXenonColor and 2 or 1, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['xenon_color_mode'][2], i)
    i += 1

    vehicleModsMenuData['xenon_preset_color'] = {i, {label = 'Xenon Headlights Preset Color', description = 'Set a preset color for your xenon headlights', args = 'xenon_preset_color', values = vehiclePresetXenonColors, defaultIndex = currentXenonColor + 2, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['xenon_preset_color'][2], i)
    i += 1

    local hasCustomXenon, defaultXenonRed, defaultXenonGreen, defaultXenonBlue = GetVehicleXenonLightsCustomColor(cache.vehicle)
    defaultXenonRed = hasCustomXenon and defaultXenonRed or 0
    defaultXenonGreen = hasCustomXenon and defaultXenonGreen or 0
    defaultXenonBlue = hasCustomXenon and defaultXenonBlue or 0

    vehicleModsMenuData['xenon_custom_color_red'] = {i, {label = 'Xenon Headlights Custom Color Red', description = 'Set the red part of the custom color for your xenon headlights', args = 'xenon_custom_color_red', values = rgbValuesArray, defaultIndex = defaultXenonRed + 1, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['xenon_custom_color_red'][2], i)
    i += 1

    vehicleModsMenuData['xenon_custom_color_green'] = {i, {label = 'Xenon Headlights Custom Color Green', description = 'Set the green part of the custom color for your xenon headlights', args = 'xenon_custom_color_green', values = rgbValuesArray, defaultIndex = defaultXenonGreen + 1, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['xenon_custom_color_green'][2], i)
    i += 1

    vehicleModsMenuData['xenon_custom_color_blue'] = {i, {label = 'Xenon Headlights Custom Color Blue', description = 'Set the blue part of the custom color for your xenon headlights', args = 'xenon_custom_color_blue', values = rgbValuesArray, defaultIndex = defaultXenonBlue + 1, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['xenon_custom_color_blue'][2], i)
    i += 1

    local defaultTireSmokeRed, defaultTireSmokeGreen, defaultTireSmokeBlue = GetVehicleTyreSmokeColor(cache.vehicle)
    local hasTireSmoke = IsToggleModOn(cache.vehicle, 20)
    defaultTireSmokeRed = hasTireSmoke and defaultTireSmokeRed or 255
    defaultTireSmokeGreen = hasTireSmoke and defaultTireSmokeGreen or 255
    defaultTireSmokeBlue = hasTireSmoke and defaultTireSmokeBlue or 255

    local defaultTireSmokePresetIndex = 1
    local defaultTireSmokeVec = vec3(defaultTireSmokeRed, defaultTireSmokeGreen, defaultTireSmokeBlue)

    local vehiclePresetTireSmokeColors = {}

    for i2 = 1, #vehicleTireSmokeColors do
        vehiclePresetTireSmokeColors[i2] = vehicleTireSmokeColors[i2][1]
        if vehicleTireSmokeColors[i2][2] == defaultTireSmokeVec then
            defaultTireSmokePresetIndex = i2
        end
    end

    vehicleModsMenuData['tire_smoke'] = {i, {label = 'Tire Smoke', description = 'Enable or disable tire smoke', args = 'tire_smoke', values = {'Yes', 'No'}, defaultIndex = hasTireSmoke and 1 or 2, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['tire_smoke'][2], i)
    i += 1

    vehicleModsMenuData['tire_smoke_color_mode'] = {i, {label = 'Tire Smoke Color Mode', description = 'Set the color mode for your tire smoke', args = 'tire_smoke_color_mode', values = {'Preset', 'Custom'}, defaultIndex = vehicleUseCustomTireSmokeColor and 2 or 1, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['tire_smoke_color_mode'][2], i)
    i += 1

    vehicleModsMenuData['tire_smoke_preset_color'] = {i, {label = 'Tire Smoke Preset Color', description = 'Set a preset color for your tire smoke', args = 'tire_smoke_preset_color', values = vehiclePresetTireSmokeColors, defaultIndex = defaultTireSmokePresetIndex, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['tire_smoke_preset_color'][2], i)
    i += 1

    vehicleModsMenuData['tire_smoke_custom_color_red'] = {i, {label = 'Tire Smoke Custom Color Red', description = 'Set the red part of the custom color for your tire smoke', args = 'tire_smoke_custom_color_red', values = rgbValuesArray, defaultIndex = defaultTireSmokeRed + 1, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['tire_smoke_custom_color_red'][2], i)
    i += 1

    vehicleModsMenuData['tire_smoke_custom_color_green'] = {i, {label = 'Tire Smoke Custom Color Green', description = 'Set the green part of the custom color for your tire smoke', args = 'tire_smoke_custom_color_green', values = rgbValuesArray, defaultIndex = defaultTireSmokeGreen + 1, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['tire_smoke_custom_color_green'][2], i)
    i += 1

    vehicleModsMenuData['tire_smoke_custom_color_blue'] = {i, {label = 'Tire Smoke Custom Color Blue', description = 'Set the blue part of the custom color for your tire smoke', args = 'tire_smoke_custom_color_blue', values = rgbValuesArray, defaultIndex = defaultTireSmokeBlue + 1, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['tire_smoke_custom_color_blue'][2], i)
    i += 1

    local defaultWindowTint = GetVehicleWindowTint(cache.vehicle)
    defaultWindowTint = defaultWindowTint == -1 and 5 or defaultWindowTint

    local windowTints = {}

    for i2 = 1, #vehicleWindowTints do
        windowTints[i2] = vehicleWindowTints[i2][2]
    end

    vehicleModsMenuData['window_tint'] = {i, {label = 'Window Tint', description = 'Apply tint to your windows', args = 'window_tint', values = windowTints, defaultIndex = defaultWindowTint, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['window_tint'][2], i)
    i += 1

    lib.showMenu(id, MenuIndexes[id])
end

local function updateColorsMenu()
    local id = 'berkie_menu_vehicle_options_colors'

    local classicPrimary, classicSecondary = 1, 1
    local mattePrimary, matteSecondary = 1, 1
    local metalPrimary, metalSecondary = 1, 1
    local utilPrimary, utilSecondary = 1, 1
    local wornPrimary, wornSecondary = 1, 1
    local colorPrimary, colorSecondary = GetVehicleColours(cache.vehicle)

    for i = 1, #vehicleClassicColors do
        if vehicleClassicColors[i][1] == colorPrimary then
            classicPrimary = i
        end

        if vehicleClassicColors[i][1] == colorSecondary then
            classicSecondary = i
        end
    end

    for i = 1, #vehicleMatteColors do
        if vehicleMatteColors[i][1] == colorPrimary then
            mattePrimary = i
        end

        if vehicleMatteColors[i][1] == colorSecondary then
            matteSecondary = i
        end
    end

    for i = 1, #vehicleMetalColors do
        if vehicleMetalColors[i][1] == colorPrimary then
            metalPrimary = i
        end

        if vehicleMetalColors[i][1] == colorSecondary then
            metalSecondary = i
        end
    end

    for i = 1, #vehicleUtilColors do
        if vehicleUtilColors[i][1] == colorPrimary then
            utilPrimary = i
        end

        if vehicleUtilColors[i][1] == colorSecondary then
            utilSecondary = i
        end
    end

    for i = 1, #vehicleWornColors do
        if vehicleWornColors[i][1] == colorPrimary then
            wornPrimary = i
        end

        if vehicleWornColors[i][1] == colorSecondary then
            wornSecondary = i
        end
    end

    lib.setMenuOptions('berkie_menu_vehicle_options_colors_primary', {label = 'Classic', args = 'classic', values = vehicleClassicColorsArray, defaultIndex = classicPrimary, close = false}, 1)
    lib.setMenuOptions('berkie_menu_vehicle_options_colors_primary', {label = 'Matte', args = 'matte', values = vehicleMatteColorsArray, defaultIndex = mattePrimary, close = false}, 2)
    lib.setMenuOptions('berkie_menu_vehicle_options_colors_primary', {label = 'Metals', args = 'metals', values = vehicleMetalColorsArray, defaultIndex = metalPrimary, close = false}, 3)
    lib.setMenuOptions('berkie_menu_vehicle_options_colors_primary', {label = 'Util', args = 'util', values = vehicleUtilColorsArray, defaultIndex = utilPrimary, close = false}, 4)
    lib.setMenuOptions('berkie_menu_vehicle_options_colors_primary', {label = 'Worn', args = 'worn', values = vehicleWornColorsArray, defaultIndex = wornPrimary, close = false}, 5)

    lib.setMenuOptions('berkie_menu_vehicle_options_colors_secondary', {label = 'Classic', args = 'classic', values = vehicleClassicColorsArray, defaultIndex = classicSecondary, close = false}, 1)
    lib.setMenuOptions('berkie_menu_vehicle_options_colors_secondary', {label = 'Matte', args = 'matte', values = vehicleMatteColorsArray, defaultIndex = matteSecondary, close = false}, 2)
    lib.setMenuOptions('berkie_menu_vehicle_options_colors_secondary', {label = 'Metals', args = 'metals', values = vehicleMetalColorsArray, defaultIndex = metalSecondary, close = false}, 3)
    lib.setMenuOptions('berkie_menu_vehicle_options_colors_secondary', {label = 'Util', args = 'util', values = vehicleUtilColorsArray, defaultIndex = utilSecondary, close = false}, 4)
    lib.setMenuOptions('berkie_menu_vehicle_options_colors_secondary', {label = 'Worn', args = 'worn', values = vehicleWornColorsArray, defaultIndex = wornSecondary, close = false}, 5)

    local dashboard = 1
    local interior = 1
    local wheel = 1
    local pearlescent = 1

    local defaultDashboard = GetVehicleDashboardColor(cache.vehicle)
    local defaultInterior = GetVehicleInteriorColor(cache.vehicle)
    local defaultPearlescentColor, defaultWheelColor = GetVehicleExtraColours(cache.vehicle)

    for i = 1, #vehicleClassicColors do
        if vehicleClassicColors[i][1] == defaultDashboard then
            dashboard = i
        end
    end

    for i = 1, #vehicleClassicColors do
        if vehicleClassicColors[i][1] == defaultInterior then
            interior = i
        end
    end

    for i = 1, #vehicleWheelColors do
        if vehicleWheelColors[i][1] == defaultWheelColor then
            wheel = i
        end
    end

    for i = 1, #vehicleClassicColors do
        if vehicleClassicColors[i][1] == defaultPearlescentColor then
            pearlescent = i
        end
    end

    lib.setMenuOptions(id, {label = 'Dashboard Color', args = 'dashboard_color', values = vehicleClassicColorsArray, defaultIndex = dashboard, close = false}, 3)
    lib.setMenuOptions(id, {label = 'Interior / Trim Color', args = 'interior_color', values = vehicleClassicColorsArray, defaultIndex = interior, close = false}, 4)
    lib.setMenuOptions(id, {label = 'Wheel Color', args = 'wheel_color', values = vehicleWheelColorsArray, defaultIndex = wheel, close = false}, 5)
    lib.setMenuOptions(id, {label = 'Pearlescent Color', args = 'pearlescent_color', values = vehicleClassicColorsArray, defaultIndex = pearlescent, close = false}, 6)

    lib.showMenu(id, MenuIndexes[id])
end

local function setupNeonMenu()
    local id = 'berkie_menu_vehicle_options_neon_menu'
    local i = 1

    lib.setMenuOptions(id, {[1] = true}) -- Add the one arg to make the override successful, otherwise it fails because it expects atleast one option, but it'll override down here anyway

    if GetEntityBoneIndexByName(cache.vehicle, 'neon_l') ~= -1 then
        vehicleModsMenuData['light_0'] = {i, {label = 'Enable Left Light', args = 'light_0', values = {'Yes', 'No'}, defaultIndex = IsVehicleNeonLightEnabled(cache.vehicle, 0) and 1 or 2, close = false}}
        lib.setMenuOptions(id, vehicleModsMenuData['light_0'][2], i)
        i += 1
    end

    if GetEntityBoneIndexByName(cache.vehicle, 'neon_r') ~= -1 then
        vehicleModsMenuData['light_1'] = {i, {label = 'Enable Right Light', args = 'light_1', values = {'Yes', 'No'}, defaultIndex = IsVehicleNeonLightEnabled(cache.vehicle, 1) and 1 or 2, close = false}}
        lib.setMenuOptions(id, vehicleModsMenuData['light_1'][2], i)
        i += 1
    end

    if GetEntityBoneIndexByName(cache.vehicle, 'neon_f') ~= -1 then
        vehicleModsMenuData['light_2'] = {i, {label = 'Enable Front Light', args = 'light_2', values = {'Yes', 'No'}, defaultIndex = IsVehicleNeonLightEnabled(cache.vehicle, 2) and 1 or 2, close = false}}
        lib.setMenuOptions(id, vehicleModsMenuData['light_2'][2], i)
        i += 1
    end

    if GetEntityBoneIndexByName(cache.vehicle, 'neon_b') ~= -1 then
        vehicleModsMenuData['light_3'] = {i, {label = 'Enable Back Light', args = 'light_3', values = {'Yes', 'No'}, defaultIndex = IsVehicleNeonLightEnabled(cache.vehicle, 3) and 1 or 2, close = false}}
        lib.setMenuOptions(id, vehicleModsMenuData['light_3'][2], i)
        i += 1
    end

    if i == 1 then
        lib.setMenuOptions(id, {label = 'No neon kits available, press enter or backspace to return', args = 'return'}, 1)
        return
    end

    local defaultIndex = 1

    vehicleModsMenuData['neon_color_mode'] = {i, {label = 'Neon Color Mode', description = 'Choose between a preset or custom color for your neon underglow', args = 'neon_color_mode', values = {'Preset', 'Custom'}, defaultIndex = vehicleUseCustomNeonColor and 2 or 1, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['neon_color_mode'][2], i)
    i += 1

    local r, g, b = GetVehicleNeonLightsColour(cache.vehicle)
    local curColor = vec3(r, g, b)

    for i2 = 1, #vehicleNeonLightColors do
        if vehicleNeonLightColors[i2][3] == curColor then
            defaultIndex = i2
            break
        end
    end

    vehicleModsMenuData['neon_preset_color'] = {i, {label = 'Neon Preset Color', description = 'Select a preset color for the neon underglow', args = 'neon_preset_color', values = vehicleNeonLightColorsArray, defaultIndex = defaultIndex, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['neon_preset_color'][2], i)
    i += 1

    vehicleModsMenuData['neon_custom_color_red'] = {i, {label = 'Neon Custom Color Red', description = 'Set the red part of the custom color for your neon underglow', args = 'neon_custom_color_red', values = rgbValuesArray, defaultIndex = r + 1, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['neon_custom_color_red'][2], i)
    i += 1

    vehicleModsMenuData['neon_custom_color_green'] = {i, {label = 'Neon Custom Color Green', description = 'Set the green part of the custom color for your neon underglow', args = 'neon_custom_color_green', values = rgbValuesArray, defaultIndex = g + 1, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['neon_custom_color_green'][2], i)
    i += 1

    vehicleModsMenuData['neon_custom_color_blue'] = {i, {label = 'Neon Custom Color Blue', description = 'Set the blue part of the custom color for your neon underglow', args = 'neon_custom_color_blue', values = rgbValuesArray, defaultIndex = b + 1, close = false}}
    lib.setMenuOptions(id, vehicleModsMenuData['neon_custom_color_blue'][2], i)
    i += 1

    lib.showMenu(id, MenuIndexes[id])
end

local function setupExtrasMenu()
    local id = 'berkie_menu_vehicle_options_extras'
    local count = 0

    for i = 1, 20 do -- Doing it 20 times just to be sure that I don't miss any (normally should've been 14 probably)
        local extraId = i - 1
        if DoesExtraExist(cache.vehicle, extraId) then
            lib.setMenuOptions(id, {label = ('Extra %s'):format(extraId), args = extraId, values = {'Yes', 'No'}, defaultIndex = IsVehicleExtraTurnedOn(cache.vehicle, extraId) and 1 or 2, close = false}, count + 1)
            count += 1
        end
    end

    if count == 0 then
        lib.setMenuOptions(id, {label = 'No extras available, press enter or backspace to return', args = 'return'}, 1)
    end

    lib.showMenu(id, MenuIndexes[id])
end

local function setCustomLicensePlate()
    local inVeh, reason = isInVehicle(true)
    if not inVeh then
        lib.notify({
            description = reason,
            type = 'error'
        })

        lib.showMenu('berkie_menu_vehicle_related_options', MenuIndexes['berkie_menu_vehicle_related_options'])

        return
    end

    local input = lib.inputDialog('Custom License Plate (Max. 8 characters)',  {'License Plate'})

    if not input or not input[1] or input[1] == '' then
        Wait(200)
        lib.showMenu('berkie_menu_vehicle_options', MenuIndexes['berkie_menu_vehicle_options'])
        return
    end

    if #input[1] > 8 then
        Wait(200)
        lib.notify({
            description = 'You can only enter a maximum of 8 characters',
            type = 'error'
        })
        lib.showMenu('berkie_menu_vehicle_options', MenuIndexes['berkie_menu_vehicle_options'])
        return
    end

    SetVehicleNumberPlateText(cache.vehicle, input[1])
end

local function setupDoorMenu()
    local id = 'berkie_menu_vehicle_options_doors'
    local i = 1
    for i2 = 0, 7 do
        if GetIsDoorValid(cache.vehicle, i2) then
            lib.setMenuOptions(id, {label = vehicleDoors[i2 + 1], description = ('Open/close the %s'):format(vehicleDoors[i2 + 1]:lower()), args = i2, close = false}, i)
            i += 1
        end
    end

    if GetEntityBoneIndexByName(cache.vehicle, 'door_hatch_l') ~= -1 and GetEntityBoneIndexByName(cache.vehicle, 'door_hatch_r') ~= -1 then
        lib.setMenuOptions(id, {label = 'Bomb Bay', description = 'Open/close the bomb bay', args = 'bomb_bay', close = false}, i)
        i += 1
    end

    lib.setMenuOptions(id, {label = 'Open All Doors', args = 'open_all_doors', close = false}, i)
    i += 1

    lib.setMenuOptions(id, {label = 'Close All Doors', args = 'close_all_doors', close = false}, i)
    i += 1

    lib.setMenuOptions(id, {label = 'Remove Doors', description = 'If this is enabled, the doors will be deleted when using the remove door option, otherwise they will be dropped to the ground', args = 'remove_doors', values = {'Yes', 'No'}, defaultIndex = vehicleRemoveDoors and 1 or 2, close = false}, i)
    i += 1

    lib.setMenuOptions(id, {label = 'Remove Door', description = 'Remove the specified door from the vehicle, press enter to apply it', args = 'remove_door', values = vehicleDoors, defaultIndex = 1, close = false}, i)
    i += 1

    lib.showMenu(id, MenuIndexes[id])
end

local function createVehiclesForSpawner(vehs, id)
    table.sort(vehs, function(a, b)
        return a.name < b.name
    end)

    for i = 1, #vehs do
        local data = vehs[i]
        local displayName = GetDisplayNameFromVehicleModel(data.model)
        local label = GetLabelText(displayName)
        label = label ~= 'NULL' and label or displayName
        label = label ~= 'CARNOTFOUND' and label or data.modelName
        lib.setMenuOptions(id, {label = ToProperCase(label:lower()), args = data.model, close = false}, i)
    end
end

local function createVehicleSpawnerMenu()
    local id = 'berkie_menu_vehicle_spawner'
    local i = 4
    local sorted = {}

    for _, v in pairs(vehicleClassNames) do
        sorted[#sorted+1] = v
    end

    table.sort(sorted, function(a, b)
        return a < b
    end)

    for i2 = 1, #sorted do
        local v = sorted[i2]
        local formattedId = ('%s_%s'):format(id, v)
        local vehs = getVehiclesFromClassName(v)

        if table.type(vehs) == 'empty' then goto skipLoop end

        lib.registerMenu({
            id = formattedId,
            title = v,
            position = 'top-right',
            onClose = function(keyPressed)
                CloseMenu(false, keyPressed, id)
            end,
            onSelected = function(selected)
                MenuIndexes[formattedId] = selected
            end,
            options = {}
        }, function(_, _, args)
            spawnVehicleOnPlayer(args)
        end)

        lib.setMenuOptions(id, {label = v, args = formattedId}, i)

        createVehiclesForSpawner(vehs, formattedId)
        i += 1

        :: skipLoop ::
    end
end

--#endregion Functions

--#region Menu Registration

lib.registerMenu({
    id = 'berkie_menu_vehicle_related_options',
    title = 'Vehicle Related Options',
    position = 'top-right',
    onClose = function(keyPressed)
        CloseMenu(false, keyPressed, 'berkie_menu_main')
    end,
    onSelected = function(selected)
        MenuIndexes['berkie_menu_vehicle_related_options'] = selected
    end,
    options = {
        {label = 'Options', icon = 'wrench', description = 'Common vehicle options including tuning and styling', args = 'berkie_menu_vehicle_options'},
        {label = 'Spawner', icon = 'car', description = 'Spawn any vehicle that is registered in the game, including addon vehicles', args = 'berkie_menu_vehicle_spawner'},
        {label = 'Personal Vehicle', icon = 'user-gear', description = 'Control your personal vehicle or change it', args = 'berkie_menu_vehicle_personal'}
    }
}, function(_, _, args)
    if args == 'berkie_menu_vehicle_spawner' then
        createVehicleSpawnerMenu()
    elseif args == 'berkie_menu_vehicle_personal' then
        local inVeh, reason = isInVehicle(true)
        if not inVeh then
            lib.notify({
                description = reason,
                type = 'error'
            })

            lib.showMenu('berkie_menu_vehicle_related_options', MenuIndexes['berkie_menu_vehicle_related_options'])

            return
        end
    end

    lib.showMenu(args, MenuIndexes[args])
end)

lib.registerMenu({
    id = 'berkie_menu_vehicle_options',
    title = 'Vehicle Options',
    position = 'top-right',
    onClose = function(keyPressed)
        CloseMenu(false, keyPressed, 'berkie_menu_vehicle_related_options')
    end,
    onSelected = function(selected)
        MenuIndexes['berkie_menu_vehicle_options'] = selected
    end,
    onSideScroll = function(_, scrollIndex, args)
        if args ~= 'engine_always_on' and args ~= 'bike_helmet' and args ~= 'radio_station' then
            local inVeh, reason = isInVehicle(true)
            if not inVeh then
                lib.notify({
                    description = reason,
                    type = 'error'
                })

                lib.hideMenu(false)
                lib.showMenu('berkie_menu_vehicle_related_options', MenuIndexes['berkie_menu_vehicle_related_options'])

                return
            end
        end

        local val = scrollIndex == 1
        if args == 'god_mode_enable' then
            if val == vehicleGodMode then return end
            vehicleGodMode = val
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Vehicle God Mode', description = 'Makes your vehicle not take any damage. What kind of damage will be stopped is defined in the God Mode Options', args = 'god_mode_enable', values = {'Yes', 'No'}, defaultIndex = vehicleGodMode and 1 or 2, close = false}, 1)
        elseif args == 'keep_vehicle_clean' then
            if val == vehicleNeverDirty then return end
            vehicleNeverDirty = val
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Keep Vehicle Clean', description = 'This will constantly clean your car if it gets dirty. Note that this only cleans dust or dirt, not mud, snow or other damage decals. Repair your vehicle to remove them', args = 'keep_vehicle_clean', values = {'Yes', 'No'}, defaultIndex = vehicleNeverDirty and 1 or 2, close = false}, 4)
        elseif args == 'set_dirt_level' then
            vehicleDirtLevelSetter = scrollIndex - 1
            SetVehicleDirtLevel(cache.vehicle, vehicleDirtLevelSetter)
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Set Dirt Level', description = 'Select how much dirt should be visible on your vehicle', args = 'set_dirt_level', values = {'No Dirt', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15'}, defaultIndex = scrollIndex, close = false}, 6)
        elseif args == 'license_plate_type' then
            SetVehicleNumberPlateTextIndex(cache.vehicle, vehicleLicensePlates[scrollIndex][1])
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'License Plate Type', description = 'Choose a license plate type', args = 'license_plate_type', values = vehicleLicensePlatesArray, defaultIndex = scrollIndex, close = false}, 13)
        elseif args == 'bike_seatbelt' then
            vehicleUseBikeSeatbelt = val
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Bike Seatbelt', description = 'Prevents you from being knocked off your bike, bicyle, ATV or similar', args = 'bike_seatbelt', values = {'Yes', 'No'}, defaultIndex = scrollIndex, close = false}, 16)
        elseif args == 'torque_multiplier_toggle' then
            vehicleUseTorqueMultiplier = val
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Enable Torque Multiplier', description = 'Enables the torque multiplier selected from the list below', args = 'torque_multiplier_toggle', values = {'Yes', 'No'}, defaultIndex = scrollIndex, close = false}, 18)
        elseif args == 'power_multiplier_toggle' then
            vehicleUsePowerMultiplier = val
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Enable Power Multiplier', description = 'Enables the power multiplier selected from the list below', args = 'power_multiplier_toggle', values = {'Yes', 'No'}, defaultIndex = scrollIndex, close = false}, 19)
        elseif args == 'torque_multiplier' then
            vehicleTorqueMultiplier = 2 ^ scrollIndex
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Set Engine Torque Multiplier', description = 'Set the engine torque multiplier', args = 'torque_multiplier', values = {'2x', '4x', '8x', '16x', '32x', '64x', '128x', '256x', '512x', '1024x'}, defaultIndex = scrollIndex, close = false}, 20)
        elseif args == 'power_multiplier' then
            vehiclePowerMultiplier = 2 ^ scrollIndex
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Set Engine Power Multiplier', description = 'Set the engine power multiplier', args = 'power_multiplier', values = {'2x', '4x', '8x', '16x', '32x', '64x', '128x', '256x', '512x', '1024x'}, defaultIndex = scrollIndex, close = false}, 21)
        elseif args == 'plane_turbulence' then
            disablePlaneTurbulence = val
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Disable Plane Turbulence', description = 'Disables the turbulence for all planes. Note only works for planes. Helicopters and other flying vehicles are not supported', args = 'plane_turbulence', values = {'Yes', 'No'}, defaultIndex = scrollIndex, close = false}, 22)
        elseif args == 'engine_always_on' then
            vehicleEngineAlwaysOn = val
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Engine Always On', description = 'Keeps your vehicle engine on when you exit your vehicle', args = 'engine_always_on', values = {'Yes', 'No'}, defaultIndex = vehicleEngineAlwaysOn and 1 or 2, close = false}, 30)
        elseif args == 'infinite_fuel' then
            vehicleInfiniteFuel = val
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Infinite Fuel', description = 'Enables or disables infinite fuel for this vehicle', args = 'infinite_fuel', values = {'Yes', 'No'}, defaultIndex = vehicleInfiniteFuel and 1 or 2, close = false}, 31)
        elseif args == 'show_health' then
            vehicleShowHealth = val
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Show Health', description = 'Shows the vehicle health on the screen', args = 'show_health', values = {'Yes', 'No'}, defaultIndex = vehicleShowHealth and 1 or 2, close = false}, 32)
        elseif args == 'radio_station' then
            vehicleDefaultRadio = vehicleRadioStations[scrollIndex][1]
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Default Radio Station', description = 'Select a default radio station to be set when spawning new car', args = 'radio_station', values = vehicleRadioStationsArray, defaultIndex = scrollIndex, close = false}, 33)
        elseif args == 'bike_helmet' then
            canWearHelmet = val
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Bike Helmet', description = 'Auto-equip a helmet when getting on a bike or quad', args = 'bike_helmet', values = {'Yes', 'No'}, defaultIndex = scrollIndex, close = false}, 34)
        elseif args == 'highbeams_on_honk' then
            vehicleHighbeamsOnHonk = val
            lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Flash Highbeams On Honk', description = 'Turn on your highbeams on your vehicle when honking your horn. Does not work during the day when you have your lights turned off', args = 'highbeams_on_honk', values = {'Yes', 'No'}, defaultIndex = scrollIndex, close = false}, 35)
        end
    end,
    options = {
        {label = 'Vehicle God Mode', description = 'Makes your vehicle not take any damage. What kind of damage will be stopped is defined in the God Mode Options', args = 'god_mode_enable', values = {'Yes', 'No'}, defaultIndex = vehicleGodMode and 1 or 2, close = false},
        {label = 'God Mode Options', description = 'Enable or disable specific damage types', args = 'berkie_menu_vehicle_options_god_mode_menu'},
        {label = 'Repair Vehicle', description = 'Repair any damage present on your vehicle', args = 'repair_vehicle', close = false},
        {label = 'Keep Vehicle Clean', description = 'This will constantly clean your car if it gets dirty. Note that this only cleans dust or dirt, not mud, snow or other damage decals. Repair your vehicle to remove them', args = 'keep_vehicle_clean', values = {'Yes', 'No'}, defaultIndex = vehicleNeverDirty and 1 or 2, close = false},
        {label = 'Wash Vehicle', description = 'Clean your vehicle', args = 'wash_vehicle', close = false},
        {label = 'Set Dirt Level', description = 'Select how much dirt should be visible on your vehicle, press enter to apply it', args = 'set_dirt_level', values = {'No Dirt', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15'}, defaultIndex = vehicleDirtLevelSetter + 1, close = false},
        {label = 'Mod Menu', description = 'Tune and customize your vehicle here', args = 'berkie_menu_vehicle_options_mod_menu'},
        {label = 'Colors', description = 'Style your vehicle even further by giving it some Snailsome colors', args = 'berkie_menu_vehicle_options_colors'},
        {label = 'Neon Kits', description = 'Make your vehicle shine with some fancy neon underglow', args = 'berkie_menu_vehicle_options_neon_menu'},
        {label = 'Extras', description = 'Add or remove vehicle extras', args = 'berkie_menu_vehicle_options_extras'},
        {label = 'Toggle Engine', description = 'Turn your engine on or off', args = 'toggle_engine', close = false},
        {label = 'Set License Plate Text', description = 'Enter a custom license plate for your vehicle', args = 'set_license_plate'},
        {label = 'License Plate Type', description = 'Choose a license plate type', args = 'license_plate_type', values = vehicleLicensePlatesArray, defaultIndex = 2, close = false},
        {label = 'Doors', description = 'Manage your vehicles doors', args = 'berkie_menu_vehicle_options_doors'},
        {label = 'Windows', description = 'Roll your windows up/down or remove/restore your vehicle windows', args = 'berkie_menu_vehicle_options_windows'},
        {label = 'Bike Seatbelt', description = 'Prevents you from being knocked off your bike, bicyle, ATV or similar', args = 'bike_seatbelt', values = {'Yes', 'No'}, defaultIndex = vehicleUseBikeSeatbelt and 1 or 2, close = false},
        {label = 'Speed Limiter', description = 'Set your vehicles max speed to your current speed. Resetting your vehicles max speed will set the max speed of your current vehicle back to default. Only your current vehicle is affected by this option. Press enter to select the option', args = 'speed_limiter', values = {'Set', 'Reset', 'Input'}, defaultIndex = 1, close = false},
        {label = 'Enable Torque Multiplier', description = 'Enables the torque multiplier selected from the list below', args = 'torque_multiplier_toggle', values = {'Yes', 'No'}, defaultIndex = vehicleUseTorqueMultiplier and 1 or 2, close = false},
        {label = 'Enable Power Multiplier', description = 'Enables the power multiplier selected from the list below', args = 'power_multiplier_toggle', values = {'Yes', 'No'}, defaultIndex = vehicleUsePowerMultiplier and 1 or 2, close = false},
        {label = 'Set Engine Torque Multiplier', description = 'Set the engine torque multiplier', args = 'torque_multiplier', values = {'2x', '4x', '8x', '16x', '32x', '64x', '128x', '256x', '512x', '1024x'}, defaultIndex = 1, close = false},
        {label = 'Set Engine Power Multiplier', description = 'Set the engine power multiplier', args = 'power_multiplier', values = {'2x', '4x', '8x', '16x', '32x', '64x', '128x', '256x', '512x', '1024x'}, defaultIndex = 1, close = false},
        {label = 'Disable Plane Turbulence', description = 'Disables the turbulence for all planes. Note only works for planes. Helicopters and other flying vehicles are not supported', args = 'plane_turbulence', values = {'Yes', 'No'}, defaultIndex = disablePlaneTurbulence and 1 or 2, close = false},
        {label = 'Flip Vehicle', description = 'Sets your current vehicle on all 4 wheels', args = 'flip_vehicle', close = false},
        {label = 'Toggle Vehicle Alarm', description = 'Starts/stops your vehicle\'s alarm', args = 'vehicle_alarm', close = false},
        {label = 'Cycle Through Vehicle Seats', description = 'Cycle through the available vehicle seats', args = 'cycle_seats', close = false},
        {label = 'Lights', description = 'Toggle your vehicle lights, press enter to apply it', args = 'vehicle_lights', values = {'Hazard Lights', 'Left Indicator', 'Right Indicator', 'Interior Lights', 'Helicopter Spotlight'}, defaultIndex = 1, close = false},
        {label = 'Fix / Destroy Tires', description = 'Fix or destroy a specific vehicle tire, or all of them at once. Note, not all indexes are valid for all vehicles, some might not do anything on certain vehicles. Press enter to apply it', args = 'fix_destroy_tires', values = {'All Tires', 'Tire (#1)', 'Tire (#2)', 'Tire (#3)', 'Tire (#4)', 'Tire (#5)', 'Tire (#6)', 'Tire (#7)', 'Tire (#8)'}, defaultIndex = 1, close = false},
        {label = 'Freeze', description = 'Freeze your vehicle\'s position, press enter to apply it', args = 'freeze_vehicle', values = {'Yes', 'No'}, defaultIndex = vehicleFrozen and 1 or 2, close = false},
        {label = 'Toggle Visibility', description = 'Makes your vehicle visible/invisible. Your vehicle will be made visible again as soon as you leave the vehicle. Otherwise you would not be able to get back in', args = 'toggle_visibility', close = false},
        {label = 'Engine Always On', description = 'Keeps your vehicle engine on when you exit your vehicle', args = 'engine_always_on', values = {'Yes', 'No'}, defaultIndex = vehicleEngineAlwaysOn and 1 or 2, close = false},
        {label = 'Infinite Fuel', description = 'Enables or disables infinite fuel for this vehicle', args = 'infinite_fuel', values = {'Yes', 'No'}, defaultIndex = vehicleInfiniteFuel and 1 or 2, close = false},
        {label = 'Show Health', description = 'Shows the vehicle health on the screen', args = 'show_health', values = {'Yes', 'No'}, defaultIndex = vehicleShowHealth and 1 or 2, close = false},
        {label = 'Default Radio Station', description = 'Select a default radio station to be set when spawning new car', args = 'radio_station', values = vehicleRadioStationsArray, defaultIndex = 1, close = false},
        {label = 'Bike Helmet', description = 'Auto-equip a helmet when getting on a bike or quad', args = 'bike_helmet', values = {'Yes', 'No'}, defaultIndex = canWearHelmet and 1 or 2, close = false},
        {label = 'Flash Highbeams On Honk', description = 'Turn on your highbeams on your vehicle when honking your horn. Does not work during the day when you have your lights turned off', args = 'highbeams_on_honk', values = {'Yes', 'No'}, defaultIndex = vehicleHighbeamsOnHonk and 1 or 2, close = false},
        {label = 'Delete Vehicle', description = 'Delete your current vehicle, no time travel is involved in this action', args = 'delete_vehicle'}
    }
}, function(_, scrollIndex, args)
    local inVeh, reason = isInVehicle(args ~= 'cycle_seats')
    if not inVeh then
        lib.notify({
            description = reason,
            type = 'error'
        })

        if args == 'berkie_menu_vehicle_options_mod_menu' or args == 'berkie_menu_vehicle_options_god_mode_menu' or args == 'delete_vehicle' then
            lib.showMenu('berkie_menu_vehicle_options', MenuIndexes['berkie_menu_vehicle_options'])
        end

        return
    end

    if args == 'berkie_menu_vehicle_options_god_mode_menu' then
        lib.showMenu(args, MenuIndexes[args])
    elseif args == 'repair_vehicle' then
        SetVehicleFixed(cache.vehicle)
    elseif args == 'wash_vehicle' then
        SetVehicleDirtLevel(cache.vehicle, 0)
        vehicleDirtLevelSetter = 1
    elseif args == 'berkie_menu_vehicle_options_mod_menu' then
        setupModMenu()
    elseif args == 'berkie_menu_vehicle_options_colors' then
        updateColorsMenu()
    elseif args == 'berkie_menu_vehicle_options_neon_menu' then
        setupNeonMenu()
    elseif args == 'berkie_menu_vehicle_options_extras' then
        setupExtrasMenu()
    elseif args == 'toggle_engine' then
        SetVehicleEngineOn(cache.vehicle, not GetIsVehicleEngineRunning(cache.vehicle), false, true)
    elseif args == 'set_license_plate' then
        setCustomLicensePlate()
    elseif args == 'berkie_menu_vehicle_options_doors' then
        setupDoorMenu()
    elseif args == 'speed_limiter' then
        lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Speed Limiter', description = 'Set your vehicles max speed to your current speed. Resetting your vehicles max speed will set the max speed of your current vehicle back to default. Only your current vehicle is affected by this option. Press enter to select the option', args = 'speed_limiter', values = {'Set', 'Reset', 'Input'}, defaultIndex = scrollIndex, close = false}, 17)
        if scrollIndex == 1 then
            SetEntityMaxSpeed(cache.vehicle, 500.01)
            local curSpeed = GetEntitySpeed(cache.vehicle)
            SetEntityMaxSpeed(cache.vehicle, curSpeed)
            if ShouldUseMetricMeasurements() then
                lib.notify({
                    description = ('Vehicle speed is now limited to %s KPH'):format(math.round(curSpeed * 3.6, 0.1))
                })
            else
                lib.notify({
                    description = ('Vehicle speed is now limited to %s MPH'):format(math.round(curSpeed * 2.23693629, 0.1))
                })
            end
        elseif scrollIndex == 2 then
            SetEntityMaxSpeed(cache.vehicle, 500.01)
            lib.notify({
                description = 'Vehicle speed is now no longer limited',
                type = 'inform'
            })
        elseif scrollIndex == 3 then
            lib.hideMenu(false)
            local input = lib.inputDialog('Custom Speed Limit', {'Speed'})
            if not input or not input[1] or input[1] == '' or not tonumber(input[1]) then
                Wait(200)
                lib.showMenu('berkie_menu_vehicle_options', MenuIndexes['berkie_menu_vehicle_options'])
                return
            end

            input[1] = tonumber(input[1]) + 0.0

            SetEntityMaxSpeed(cache.vehicle, 500.01)
            SetEntityMaxSpeed(cache.vehicle, input[1] + 0.0)

            if ShouldUseMetricMeasurements() then
                lib.notify({
                    description = ('Vehicle speed is now limited to %s KPH'):format(math.round(input[1] * 3.6, 0.1))
                })
            else
                lib.notify({
                    description = ('Vehicle speed is now limited to %s MPH'):format(math.round(input[1] * 2.23693629, 0.1))
                })
            end

            Wait(200)
            lib.showMenu('berkie_menu_vehicle_options', MenuIndexes['berkie_menu_vehicle_options'])
        end
    elseif args == 'flip_vehicle' then
        SetVehicleOnGroundProperly(cache.vehicle)
    elseif args == 'vehicle_alarm' then
        if IsVehicleAlarmActivated(cache.vehicle) then
            SetVehicleAlarmTimeLeft(cache.vehicle, 0)
            SetVehicleAlarm(cache.vehicle, false)
        else
            SetVehicleAlarm(cache.vehicle, true)
            SetVehicleAlarmTimeLeft(cache.vehicle, math.random(8000, 45000))
            StartVehicleAlarm(cache.vehicle)
        end
    elseif args == 'cycle_seats' then
        if not AreAnyVehicleSeatsFree(cache.vehicle) then
            lib.notify({
                description = 'No seats to cycle through',
                type = 'error'
            })
            return
        end

        local vehicleModel = GetEntityModel(cache.vehicle)
        local maxSeats = GetVehicleModelNumberOfSeats(vehicleModel)
        local foundSeat = false
        local startingSeat = -1

        for i = -1, maxSeats - 2 do
            if GetPedInVehicleSeat(cache.vehicle, i) == cache.ped then
                startingSeat = i
                break
            end
        end

        if startingSeat == maxSeats - 2 then
            startingSeat = -1
        end

        for i = startingSeat, maxSeats - 2 do
            if IsVehicleSeatFree(cache.vehicle, i) then
                TaskWarpPedIntoVehicle(cache.ped, cache.vehicle, i)
                foundSeat = true
                break
            end
        end

        if foundSeat then return end
        lib.notify({
            description = 'No seats to cycle through',
            type = 'error'
        })
    elseif args == 'vehicle_lights' then
        -- We need to do % 4 because this seems to be some sort of flags system. For a taxi, this function returns 65, 66, etc.
        -- So % 4 takes care of that.
        local indicatorState = GetVehicleIndicatorLights(cache.vehicle) % 4 -- 0 = none, 1 = left, 2 = right, 3 = both
        if scrollIndex == 1 then
            if indicatorState ~= 3 then -- Either all lights are off, or one of the two (left/right) is off.
                SetVehicleIndicatorLights(cache.vehicle, 1, true)
                SetVehicleIndicatorLights(cache.vehicle, 0, true)
            else -- Both are on
                SetVehicleIndicatorLights(cache.vehicle, 1, false)
                SetVehicleIndicatorLights(cache.vehicle, 0, false)
            end
        elseif scrollIndex == 2 then
            if indicatorState ~= 1 then -- Left indicator is (only) off
                SetVehicleIndicatorLights(cache.vehicle, 1, true)
                SetVehicleIndicatorLights(cache.vehicle, 0, false)
            else
                SetVehicleIndicatorLights(cache.vehicle, 1, false)
                SetVehicleIndicatorLights(cache.vehicle, 0, false)
            end
        elseif scrollIndex == 3 then
            if indicatorState ~= 2 then -- Right indicator is (only) off
                SetVehicleIndicatorLights(cache.vehicle, 1, false)
                SetVehicleIndicatorLights(cache.vehicle, 0, true)
            else
                SetVehicleIndicatorLights(cache.vehicle, 1, false)
                SetVehicleIndicatorLights(cache.vehicle, 0, false)
            end
        elseif scrollIndex == 4 then
            SetVehicleInteriorlight(cache.vehicle, not IsVehicleInteriorLightOn(cache.vehicle))
        elseif scrollIndex == 5 then
            SetVehicleSearchlight(cache.vehicle, not IsVehicleSearchlightOn(cache.vehicle), true)
        end
        lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Lights', description = 'Toggle your vehicle lights', args = 'vehicle_lights', values = {'Hazard Lights', 'Left Indicator', 'Right Indicator', 'Interior Lights', 'Helicopter Spotlight'}, defaultIndex = scrollIndex, close = false}, 26)
    elseif args == 'fix_destroy_tires' then
        lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Fix / Destroy Tires', description = 'Fix or destroy a specific vehicle tire, or all of them at once. Note, not all indexes are valid for all vehicles, some might not do anything on certain vehicles', args = 'fix_destroy_tires', values = {'All Tires', 'Tire (#1)', 'Tire (#2)', 'Tire (#3)', 'Tire (#4)', 'Tire (#5)', 'Tire (#6)', 'Tire (#7)', 'Tire (#8)'}, defaultIndex = scrollIndex, close = false}, 27)
        if scrollIndex == 1 then
            if IsVehicleTyreBurst(cache.vehicle, 0, false) then
                for i = 0, 7 do
                    SetVehicleTyreFixed(cache.vehicle, i)
                end
                lib.notify({
                    description = 'All vehicle tires have been fixed',
                    type = 'success'
                })
            else
                for i = 0, 7 do
                    SetVehicleTyreBurst(cache.vehicle, i, false, 1.0)
                end
                lib.notify({
                    description = 'All vehicle tires have been destroyed',
                    type = 'success'
                })
            end
        else
            local tireIndex = scrollIndex - 2
            if IsVehicleTyreBurst(cache.vehicle, tireIndex, false) then
                SetVehicleTyreFixed(cache.vehicle, tireIndex)
                lib.notify({
                    description = ('Vehicle tire #%s has been fixed'):format(scrollIndex - 1),
                    type = 'success'
                })
            else
                SetVehicleTyreBurst(cache.vehicle, tireIndex, false, 1.0)
                lib.notify({
                    description = ('Vehicle tire #%s has been destroyed'):format(scrollIndex - 1),
                    type = 'success'
                })
            end
        end
    elseif args == 'freeze_vehicle' then
        vehicleFrozen = scrollIndex == 1
        lib.setMenuOptions('berkie_menu_vehicle_options', {label = 'Freeze Vehicle', description = 'Freeze your vehicle\'s position, press enter to apply it', args = 'freeze_vehicle', values = {'Yes', 'No'}, defaultIndex = scrollIndex, close = false}, 28)
        if scrollIndex == 1 then
            vehicleFrozenSpeed = GetEntitySpeedVector(cache.vehicle, true).y
            vehicleFrozenRPM = GetVehicleCurrentRpm(cache.vehicle)
        end
        FreezeEntityPosition(cache.vehicle, scrollIndex == 1)
        if scrollIndex == 2 then
            if not IsThisModelATrain(GetEntityModel(cache.vehicle)) then
                SetVehicleForwardSpeed(cache.vehicle, vehicleFrozenSpeed)
            end
            SetVehicleCurrentRpm(cache.vehicle, vehicleFrozenRPM)
        end
    elseif args == 'toggle_visibility' then
        if IsEntityVisible(cache.vehicle) then
            local pedsInVeh = {}
            for i = -1, GetVehicleMaxNumberOfPassengers(cache.vehicle) - 1 do
                if not IsVehicleSeatFree(cache.vehicle, i) then
                    pedsInVeh[#pedsInVeh + 1] = GetPedInVehicleSeat(cache.vehicle, i)
                end
            end
            SetEntityVisible(cache.vehicle, false, false)
            for i = 1, #pedsInVeh do
                SetEntityVisible(pedsInVeh[i], true, false)
            end
        else
            SetEntityVisible(cache.vehicle, true, false)
        end
    elseif args == 'delete_vehicle' then
        local alert = lib.alertDialog({
            header = 'Sure?',
            content = 'Are you sure you want to delete your vehicle?\nThis action cannot be undone.',
            centered = true,
            cancel = true
        })
        if alert == 'confirm' then
            SetVehicleHasBeenOwnedByPlayer(cache.vehicle, false)
            SetEntityAsMissionEntity(cache.vehicle, false, true)
            DeleteEntity(cache.vehicle)
            Wait(200)
            lib.showMenu('berkie_menu_vehicle_options', MenuIndexes['berkie_menu_vehicle_options'])
        elseif alert == 'cancel' then
            Wait(200)
            lib.showMenu('berkie_menu_vehicle_options', MenuIndexes['berkie_menu_vehicle_options'])
        end
    end
end)

lib.registerMenu({
    id = 'berkie_menu_vehicle_options_god_mode_menu',
    title = 'Vehicle God Mode Options',
    position = 'top-right',
    onClose = function(keyPressed)
        CloseMenu(false, keyPressed, 'berkie_menu_vehicle_options')
    end,
    onSelected = function(selected)
        MenuIndexes['berkie_menu_vehicle_options_god_mode_menu'] = selected
    end,
    onSideScroll = function(_, scrollIndex, args)
        local val = scrollIndex == 1 and vehicleGodMode
        if args == 'invincible' then
            if val == vehicleInvincible then return end
            vehicleInvincible = val
            lib.setMenuOptions('berkie_menu_vehicle_options_god_mode_menu', {label = 'Invincible', description = 'Makes the car invincible, includes fire damage, explosion damage, collision damage and more', args = 'invincible', values = {'Yes', 'No'}, defaultIndex = vehicleInvincible and 1 or 2, close = false}, 1)
        elseif args == 'engine_damage' then
            if val == vehicleEngineDamage then return end
            vehicleEngineDamage = val
            lib.setMenuOptions('berkie_menu_vehicle_options_god_mode_menu', {label = 'Engine Damage', description = 'Disables your engine from taking any damage', args = 'engine_damage', values = {'Yes', 'No'}, defaultIndex = vehicleEngineDamage and 1 or 2, close = false}, 2)
        elseif args == 'visual_damage' then
            if val == vehicleVisualDamage then return end
            vehicleVisualDamage = val
            lib.setMenuOptions('berkie_menu_vehicle_options_god_mode_menu', {label = 'Visual Damage', description = 'This prevents scratches and other damage decals from being applied to your vehicle. It does not prevent (body) deformation damage', args = 'visual_damage', values = {'Yes', 'No'}, defaultIndex = vehicleVisualDamage and 1 or 2, close = false}, 3)
        elseif args == 'strong_wheels' then
            if val == vehicleStrongWheels then return end
            vehicleStrongWheels = val
            lib.setMenuOptions('berkie_menu_vehicle_options_god_mode_menu', {label = 'Strong Wheels', description = 'Disables your wheels from being deformed and causing reduced handling. This does not make tires bulletproof', args = 'strong_wheels', values = {'Yes', 'No'}, defaultIndex = vehicleStrongWheels and 1 or 2, close = false}, 4)
        elseif args == 'ramp_damage' then
            if val == vehicleRampDamage then return end
            vehicleRampDamage = val
            lib.setMenuOptions('berkie_menu_vehicle_options_god_mode_menu', {label = 'Ramp Damage', description = 'Disables vehicles such as the Ramp Buggy from taking any damage when using the ramp', args = 'ramp_damage', values = {'Yes', 'No'}, defaultIndex = vehicleRampDamage and 1 or 2, close = false}, 5)
        elseif args == 'auto_repair' then
            if val == vehicleAutoRepair then return end
            vehicleAutoRepair = val
            lib.setMenuOptions('berkie_menu_vehicle_options_god_mode_menu', {label = 'Auto Repair', description = 'Automatically repairs your vehicle when it has ANY type of damage. It\'s recommended to keep this turned off to prevent glitchyness', args = 'auto_repair', values = {'Yes', 'No'}, defaultIndex = vehicleAutoRepair and 1 or 2, close = false}, 6)
        end
    end,
    options = {
        {label = 'Invincible', description = 'Makes the car invincible, includes fire damage, explosion damage, collision damage and more', args = 'invincible', values = {'Yes', 'No'}, defaultIndex = vehicleInvincible and 1 or 2, close = false},
        {label = 'Engine Damage', description = 'Disables your engine from taking any damage', args = 'engine_damage', values = {'Yes', 'No'}, defaultIndex = vehicleEngineDamage and 1 or 2, close = false},
        {label = 'Visual Damage', description = 'This prevents scratches and other damage decals from being applied to your vehicle. It does not prevent (body) deformation damage', args = 'visual_damage', values = {'Yes', 'No'}, defaultIndex = vehicleVisualDamage and 1 or 2, close = false},
        {label = 'Strong Wheels', description = 'Disables your wheels from being deformed and causing reduced handling. This does not make tires bulletproof', args = 'strong_wheels', values = {'Yes', 'No'}, defaultIndex = vehicleStrongWheels and 1 or 2, close = false},
        {label = 'Ramp Damage', description = 'Disables vehicles such as the Ramp Buggy from taking any damage when using the ramp', args = 'ramp_damage', values = {'Yes', 'No'}, defaultIndex = vehicleRampDamage and 1 or 2, close = false},
        {label = 'Auto Repair', description = 'Automatically repairs your vehicle when it has ANY type of damage. It\'s recommended to keep this turned off to prevent glitchyness', args = 'auto_repair', values = {'Yes', 'No'}, defaultIndex = vehicleAutoRepair and 1 or 2, close = false}
    }
})

lib.registerMenu({
    id = 'berkie_menu_vehicle_options_mod_menu',
    title = 'Mod Menu',
    position = 'top-right',
    onClose = function(keyPressed)
        CloseMenu(false, keyPressed, 'berkie_menu_vehicle_options')
    end,
    onSelected = function(selected)
        MenuIndexes['berkie_menu_vehicle_options_mod_menu'] = selected
    end,
    onSideScroll = function(_, scrollIndex, args)
        local customTires = GetVehicleModVariation(cache.vehicle, 23)
        local vehClass = GetVehicleClass(cache.vehicle)
        local vehModel = GetEntityModel(cache.vehicle)
        if type(args) == 'table' then
            local curArg = args[scrollIndex]
            SetVehicleMod(cache.vehicle, curArg[2], curArg[1], customTires)
            vehicleModsMenuData[curArg[2]][2].defaultIndex = scrollIndex
            lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[curArg[2]][2], vehicleModsMenuData[curArg[2]][1])
        else
            if args == 'wheel_type' then
                if IsThisModelABike(vehModel) or vehClass == 22 then return end
                SetVehicleWheelType(cache.vehicle, scrollIndex - 1)
                SetVehicleMod(cache.vehicle, 23, -1, customTires)
                vehicleModsMenuData[23][2].defaultIndex = 1
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[23][2], vehicleModsMenuData[23][1])
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
                lib.hideMenu(false)
                lib.showMenu('berkie_menu_vehicle_options_mod_menu', MenuIndexes['berkie_menu_vehicle_options_mod_menu'])
            elseif args == 'custom_tires' then
                SetVehicleMod(cache.vehicle, 23, GetVehicleMod(cache.vehicle, 23), not customTires)
                if IsThisModelABike(vehModel) then
                    SetVehicleMod(cache.vehicle, 24, GetVehicleMod(cache.vehicle, 24), not customTires)
                end
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'xenon_headlights' then
                ToggleVehicleMod(cache.vehicle, 22, scrollIndex == 1)
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'turbo' then
                ToggleVehicleMod(cache.vehicle, 18, scrollIndex == 1)
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'bullet_proof_tires' then
                SetVehicleTyresCanBurst(cache.vehicle, scrollIndex == 2)
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'xenon_color_mode' then
                vehicleUseCustomXenonColor = scrollIndex == 2
                if scrollIndex == 1 then
                    SetVehicleXenonLightsColor(cache.vehicle, vehicleModsMenuData['xenon_preset_color'][2].defaultIndex - 1)
                else
                    SetVehicleXenonLightsCustomColor(cache.vehicle, vehicleModsMenuData['xenon_custom_color_red'][2].defaultIndex - 1, vehicleModsMenuData['xenon_custom_color_green'][2].defaultIndex - 1, vehicleModsMenuData['xenon_custom_color_blue'][2].defaultIndex - 1)
                end
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'xenon_preset_color' then
                if not vehicleUseCustomXenonColor and IsToggleModOn(cache.vehicle, 22) then
                    local newIndex = scrollIndex == -1 and 255 or scrollIndex - 1
                    SetVehicleXenonLightsColor(cache.vehicle, newIndex)
                end
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'xenon_custom_color_red' then
                if vehicleUseCustomXenonColor and IsToggleModOn(cache.vehicle, 22) then
                    SetVehicleXenonLightsCustomColor(cache.vehicle, scrollIndex - 1, vehicleModsMenuData['xenon_custom_color_green'][2].defaultIndex - 1, vehicleModsMenuData['xenon_custom_color_blue'][2].defaultIndex - 1)
                end
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'xenon_custom_color_green' then
                if vehicleUseCustomXenonColor and IsToggleModOn(cache.vehicle, 22) then
                    SetVehicleXenonLightsCustomColor(cache.vehicle, vehicleModsMenuData['xenon_custom_color_red'][2].defaultIndex - 1, scrollIndex - 1, vehicleModsMenuData['xenon_custom_color_blue'][2].defaultIndex - 1)
                end
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'xenon_custom_color_blue' then
                if vehicleUseCustomXenonColor and IsToggleModOn(cache.vehicle, 22) then
                    SetVehicleXenonLightsCustomColor(cache.vehicle, vehicleModsMenuData['xenon_custom_color_red'][2].defaultIndex - 1, vehicleModsMenuData['xenon_custom_color_green'][2].defaultIndex - 1, scrollIndex - 1)
                end
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'tire_smoke' then
                ToggleVehicleMod(cache.vehicle, 20, scrollIndex == 1)
                if scrollIndex == 1 then
                    local val
                    if vehicleModsMenuData['tire_smoke_color_mode'][2].defaultIndex == 1 then
                        val = vehicleTireSmokeColors[vehicleModsMenuData['tire_smoke_preset_color'][2].defaultIndex][2]
                    else
                        val = vec3(vehicleModsMenuData['tire_smoke_custom_color_red'][2].defaultIndex - 1, vehicleModsMenuData['tire_smoke_custom_color_green'][2].defaultIndex - 1, vehicleModsMenuData['tire_smoke_custom_color_blue'][2].defaultIndex - 1)
                    end
                    SetVehicleTyreSmokeColor(cache.vehicle, val.x, val.y, val.z)
                else
                    SetVehicleTyreSmokeColor(cache.vehicle, 255, 255, 255)
                    RemoveVehicleMod(cache.vehicle, 20)
                    vehicleModsMenuData['tire_smoke_preset_color'][2].defaultIndex = 1
                    lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData['tire_smoke_preset_color'][2], vehicleModsMenuData['tire_smoke_preset_color'][1])
                    lib.hideMenu(false)
                    lib.showMenu('berkie_menu_vehicle_options_mod_menu', MenuIndexes['berkie_menu_vehicle_options_mod_menu'])
                end
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'tire_smoke_color_mode' then
                vehicleUseCustomTireSmokeColor = scrollIndex == 2
                local val
                if not vehicleUseCustomTireSmokeColor then
                    val = vehicleTireSmokeColors[scrollIndex][2]
                else
                    val = vec3(vehicleModsMenuData['tire_smoke_custom_color_red'][2].defaultIndex - 1, vehicleModsMenuData['tire_smoke_custom_color_green'][2].defaultIndex - 1, vehicleModsMenuData['tire_smoke_custom_color_blue'][2].defaultIndex - 1)
                end
                SetVehicleTyreSmokeColor(cache.vehicle, val.x, val.y, val.z)
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'tire_smoke_preset_color' then
                if not vehicleUseCustomTireSmokeColor then
                    local val = vehicleTireSmokeColors[scrollIndex][2]
                    SetVehicleTyreSmokeColor(cache.vehicle, val.x, val.y, val.z)
                end
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'tire_smoke_custom_color_red' then
                if vehicleUseCustomTireSmokeColor then
                    SetVehicleTyreSmokeColor(cache.vehicle, scrollIndex - 1, vehicleModsMenuData['tire_smoke_custom_color_green'][2].defaultIndex - 1, vehicleModsMenuData['tire_smoke_custom_color_blue'][2].defaultIndex - 1)
                end
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'tire_smoke_custom_color_green' then
                if vehicleUseCustomTireSmokeColor then
                    SetVehicleTyreSmokeColor(cache.vehicle, vehicleModsMenuData['tire_smoke_custom_color_red'][2].defaultIndex - 1, scrollIndex - 1, vehicleModsMenuData['tire_smoke_custom_color_blue'][2].defaultIndex - 1)
                end
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'tire_smoke_custom_color_blue' then
                if vehicleUseCustomTireSmokeColor then
                    SetVehicleTyreSmokeColor(cache.vehicle, vehicleModsMenuData['tire_smoke_custom_color_red'][2].defaultIndex - 1, vehicleModsMenuData['tire_smoke_custom_color_green'][2].defaultIndex - 1, scrollIndex - 1)
                end
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            elseif args == 'window_tint' then
                SetVehicleWindowTint(cache.vehicle, vehicleWindowTints[scrollIndex][1])
                vehicleModsMenuData[args][2].defaultIndex = scrollIndex
                lib.setMenuOptions('berkie_menu_vehicle_options_mod_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
            end
        end
    end,
    options = {}
})

lib.registerMenu({
    id = 'berkie_menu_vehicle_options_colors',
    title = 'Vehicle Colors',
    position = 'top-right',
    onClose = function(keyPressed)
        CloseMenu(false, keyPressed, 'berkie_menu_vehicle_options')
    end,
    onSelected = function(selected)
        MenuIndexes['berkie_menu_vehicle_options_colors'] = selected
    end,
    onSideScroll = function(_, scrollIndex, args)
        local pearlescentColor, wheelColor = GetVehicleExtraColours(cache.vehicle)
        if args == 'dashboard_color' then
            SetVehicleDashboardColor(cache.vehicle, vehicleClassicColors[scrollIndex][1])
            lib.setMenuOptions('berkie_menu_vehicle_options_colors', {label = 'Dashboard Color', args = 'dashboard_color', values = vehicleClassicColorsArray, defaultIndex = scrollIndex, close = false}, 3)
        elseif args == 'interior_color' then
            SetVehicleInteriorColor(cache.vehicle, vehicleClassicColors[scrollIndex][1])
            lib.setMenuOptions('berkie_menu_vehicle_options_colors', {label = 'Interior / Trim Color', args = 'interior_color', values = vehicleClassicColorsArray, defaultIndex = scrollIndex, close = false}, 4)
        elseif args == 'wheel_color' then
            SetVehicleExtraColours(cache.vehicle, pearlescentColor, vehicleWheelColors[scrollIndex][1])
            lib.setMenuOptions('berkie_menu_vehicle_options_colors', {label = 'Wheel Color', args = 'wheel_color', values = vehicleWheelColorsArray, defaultIndex = scrollIndex, close = false}, 5)
        elseif args == 'pearlescent_color' then
            SetVehicleExtraColours(cache.vehicle, vehicleClassicColors[scrollIndex][1], wheelColor)
            lib.setMenuOptions('berkie_menu_vehicle_options_colors', {label = 'Pearlescent Color', args = 'pearlescent_color', values = vehicleClassicColorsArray, defaultIndex = scrollIndex, close = false}, 6)
        end
    end,
    options = {
        {label = 'Primary Color', args = 'berkie_menu_vehicle_options_colors_primary'},
        {label = 'Secondary Color', args = 'berkie_menu_vehicle_options_colors_secondary'},
        {label = 'Dashboard Color', args = 'dashboard_color', values = vehicleClassicColorsArray, defaultIndex = 1, close = false},
        {label = 'Interior / Trim Color', args = 'interior_color', values = vehicleClassicColorsArray, defaultIndex = 1, close = false},
        {label = 'Wheel Color', args = 'wheel_color', values = vehicleWheelColorsArray, defaultIndex = 1, close = false},
        {label = 'Pearlescent Color', args = 'pearlescent_color', values = vehicleClassicColorsArray, defaultIndex = 1, close = false}
    }
}, function(_, scrollIndex, args)
    if scrollIndex then return end

    lib.showMenu(args)
end)

lib.registerMenu({
    id = 'berkie_menu_vehicle_options_colors_primary',
    title = 'Primary Color',
    position = 'top-right',
    onClose = function(keyPressed)
        CloseMenu(false, keyPressed, 'berkie_menu_vehicle_options_colors')
    end,
    onSelected = function(selected)
        MenuIndexes['berkie_menu_vehicle_options_colors_primary'] = selected
    end,
    onSideScroll = function(_, scrollIndex, args)
        local _, colorSecondary = GetVehicleColours(cache.vehicle)
        if args == 'classic' then
            SetVehicleColours(cache.vehicle, vehicleClassicColors[scrollIndex][1], colorSecondary)
            lib.setMenuOptions('berkie_menu_vehicle_options_colors_primary', {label = 'Classic', args = 'classic', values = vehicleClassicColorsArray, defaultIndex = scrollIndex, close = false}, 1)
        elseif args == 'matte' then
            SetVehicleColours(cache.vehicle, vehicleMatteColors[scrollIndex][1], colorSecondary)
            lib.setMenuOptions('berkie_menu_vehicle_options_colors_primary', {label = 'Matte', args = 'matte', values = vehicleMatteColorsArray, defaultIndex = scrollIndex, close = false}, 2)
        elseif args == 'metals' then
            SetVehicleColours(cache.vehicle, vehicleMetalColors[scrollIndex][1], colorSecondary)
            lib.setMenuOptions('berkie_menu_vehicle_options_colors_primary', {label = 'Metals', args = 'metals', values = vehicleMetalColorsArray, defaultIndex = scrollIndex, close = false}, 3)
        elseif args == 'util' then
            SetVehicleColours(cache.vehicle, vehicleUtilColors[scrollIndex][1], colorSecondary)
            lib.setMenuOptions('berkie_menu_vehicle_options_colors_primary', {label = 'Util', args = 'util', values = vehicleUtilColorsArray, defaultIndex = scrollIndex, close = false}, 4)
        elseif args == 'worn' then
            SetVehicleColours(cache.vehicle, vehicleWornColors[scrollIndex][1], colorSecondary)
            lib.setMenuOptions('berkie_menu_vehicle_options_colors_primary', {label = 'Worn', args = 'worn', values = vehicleWornColorsArray, defaultIndex = scrollIndex, close = false}, 5)
        end
    end,
    options = {
        {label = 'Classic', args = 'classic', values = vehicleClassicColorsArray, defaultIndex = 1, close = false},
        {label = 'Matte', args = 'matte', values = vehicleMatteColorsArray, defaultIndex = 1, close = false},
        {label = 'Metals', args = 'metals', values = vehicleMetalColorsArray, defaultIndex = 1, close = false},
        {label = 'Util', args = 'util', values = vehicleUtilColorsArray, defaultIndex = 1, close = false},
        {label = 'Worn', args = 'worn', values = vehicleWornColorsArray, defaultIndex = 1, close = false},
        {label = 'Chrome', description = 'Set your vehicle\'s primary color to chrome', close = false},
    }
}, function(_, scrollIndex)
    if scrollIndex then return end

    local _, colorSecondary = GetVehicleColours(cache.vehicle)

    SetVehicleColours(cache.vehicle, 120, colorSecondary) -- Set to chrome
end)

lib.registerMenu({
    id = 'berkie_menu_vehicle_options_colors_secondary',
    title = 'Secondary Color',
    position = 'top-right',
    onClose = function(keyPressed)
        CloseMenu(false, keyPressed, 'berkie_menu_vehicle_options_colors')
    end,
    onSelected = function(selected)
        MenuIndexes['berkie_menu_vehicle_options_colors_secondary'] = selected
    end,
    onSideScroll = function(_, scrollIndex, args)
        local colorPrimary = GetVehicleColours(cache.vehicle)
        if args == 'classic' then
            SetVehicleColours(cache.vehicle, colorPrimary, vehicleClassicColors[scrollIndex][1])
            lib.setMenuOptions('berkie_menu_vehicle_options_colors_secondary', {label = 'Classic', args = 'classic', values = vehicleClassicColorsArray, defaultIndex = scrollIndex, close = false}, 1)
        elseif args == 'matte' then
            SetVehicleColours(cache.vehicle, colorPrimary, vehicleMatteColors[scrollIndex][1])
            lib.setMenuOptions('berkie_menu_vehicle_options_colors_secondary', {label = 'Matte', args = 'matte', values = vehicleMatteColorsArray, defaultIndex = scrollIndex, close = false}, 2)
        elseif args == 'metals' then
            SetVehicleColours(cache.vehicle, colorPrimary, vehicleMetalColors[scrollIndex][1])
            lib.setMenuOptions('berkie_menu_vehicle_options_colors_secondary', {label = 'Metals', args = 'metals', values = vehicleMetalColorsArray, defaultIndex = scrollIndex, close = false}, 3)
        elseif args == 'util' then
            SetVehicleColours(cache.vehicle, colorPrimary, vehicleUtilColors[scrollIndex][1])
            lib.setMenuOptions('berkie_menu_vehicle_options_colors_secondary', {label = 'Util', args = 'util', values = vehicleUtilColorsArray, defaultIndex = scrollIndex, close = false}, 4)
        elseif args == 'worn' then
            SetVehicleColours(cache.vehicle, colorPrimary, vehicleWornColors[scrollIndex][1])
            lib.setMenuOptions('berkie_menu_vehicle_options_colors_secondary', {label = 'Worn', args = 'worn', values = vehicleWornColorsArray, defaultIndex = scrollIndex, close = false}, 5)
        end
    end,
    options = {
        {label = 'Classic', args = 'classic', values = vehicleClassicColorsArray, defaultIndex = 1, close = false},
        {label = 'Matte', args = 'matte', values = vehicleMatteColorsArray, defaultIndex = 1, close = false},
        {label = 'Metals', args = 'metals', values = vehicleMetalColorsArray, defaultIndex = 1, close = false},
        {label = 'Util', args = 'util', values = vehicleUtilColorsArray, defaultIndex = 1, close = false},
        {label = 'Worn', args = 'worn', values = vehicleWornColorsArray, defaultIndex = 1, close = false},
        {label = 'Chrome', description = 'Set your vehicle\'s secondary color to chrome', close = false},
    }
}, function(_, scrollIndex)
    if scrollIndex then return end

    local colorPrimary = GetVehicleColours(cache.vehicle)

    SetVehicleColours(cache.vehicle, colorPrimary, 120) -- Set to chrome
end)

lib.registerMenu({
    id = 'berkie_menu_vehicle_options_neon_menu',
    title = 'Neon Kits',
    position = 'top-right',
    onClose = function(keyPressed)
        closeMenu(false, keyPressed, 'berkie_menu_vehicle_options')
    end,
    onSelected = function(selected)
        MenuIndexes['berkie_menu_vehicle_options_neon_menu'] = selected
    end,
    onSideScroll = function(_, scrollIndex, args)
        if string.find(args, 'light') then
            local index = tonumber(string.match(args, '%d+'))
            ---@diagnostic disable-next-line: param-type-mismatch
            SetVehicleNeonLightEnabled(cache.vehicle, index, scrollIndex == 1)
        elseif args == 'neon_color_mode' then
            vehicleUseCustomNeonColor = scrollIndex == 2
            vehicleModsMenuData[args][2].defaultIndex = scrollIndex
            lib.setMenuOptions('berkie_menu_vehicle_options_neon_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
        elseif args == 'neon_preset_color' then
            if not vehicleUseCustomNeonColor then
                local color = vehicleNeonLightColors[scrollIndex][3]
                SetVehicleNeonLightsColour(cache.vehicle, color.x, color.y, color.z)
            end
            vehicleModsMenuData[args].defaultIndex = scrollIndex
            lib.setMenuOptions('berkie_menu_vehicle_options_neon_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
        elseif args == 'neon_custom_color_red' then
            if vehicleUseCustomNeonColor then
                SetVehicleNeonLightsColour(cache.vehicle, scrollIndex - 1, vehicleModsMenuData['neon_custom_color_green'][2].defaultIndex - 1, vehicleModsMenuData['neon_custom_color_blue'][2].defaultIndex - 1)
            end
            vehicleModsMenuData[args][2].defaultIndex = scrollIndex
            lib.setMenuOptions('berkie_menu_vehicle_options_neon_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
        elseif args == 'neon_custom_color_green' then
            if vehicleUseCustomNeonColor then
                SetVehicleNeonLightsColour(cache.vehicle, vehicleModsMenuData['neon_custom_color_red'][2].defaultIndex - 1, scrollIndex - 1, vehicleModsMenuData['neon_custom_color_blue'][2].defaultIndex - 1)
            end
            vehicleModsMenuData[args][2].defaultIndex = scrollIndex
            lib.setMenuOptions('berkie_menu_vehicle_options_neon_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
        elseif args == 'neon_custom_color_blue' then
            if vehicleUseCustomNeonColor then
                SetVehicleNeonLightsColour(cache.vehicle, vehicleModsMenuData['neon_custom_color_red'][2].defaultIndex - 1, vehicleModsMenuData['neon_custom_color_green'][2].defaultIndex - 1, scrollIndex - 1)
            end
            vehicleModsMenuData[args][2].defaultIndex = scrollIndex
            lib.setMenuOptions('berkie_menu_vehicle_options_neon_menu', vehicleModsMenuData[args][2], vehicleModsMenuData[args][1])
        elseif args == 'return' then
            lib.showMenu('berkie_menu_vehicle_options', MenuIndexes['berkie_menu_vehicle_options'])
        end
    end,
    options = {}
})

lib.registerMenu({
    id = 'berkie_menu_vehicle_options_extras',
    title = 'Vehicle Extras',
    position = 'top-right',
    onClose = function(keyPressed)
        CloseMenu(false, keyPressed, 'berkie_menu_vehicle_options')
    end,
    onSelected = function(selected)
        MenuIndexes['berkie_menu_vehicle_options_extras'] = selected
    end,
    onSideScroll = function(_, scrollIndex, args)
        SetVehicleExtra(cache.vehicle, args, scrollIndex == 2)
    end,
    options = {}
}, function(_, scrollIndex)
    if scrollIndex then return end

    lib.showMenu('berkie_menu_vehicle_options', MenuIndexes['berkie_menu_vehicle_options'])
end)

lib.registerMenu({
    id = 'berkie_menu_vehicle_options_doors',
    title = 'Vehicle Doors',
    position = 'top-right',
    onClose = function(keyPressed)
        CloseMenu(false, keyPressed, 'berkie_menu_vehicle_options')
    end,
    onSelected = function(selected)
        MenuIndexes['berkie_menu_vehicle_options_doors'] = selected
    end,
    onSideScroll = function(_, scrollIndex, args)
        if args == 'remove_doors' then
            vehicleRemoveDoors = scrollIndex == 1
        end
    end,
    options = {}
}, function(_, scrollIndex, args)
    if type(args) == 'number' then
        local isOpen = GetVehicleDoorAngleRatio(cache.vehicle, args) > 0.1
        if isOpen then
            SetVehicleDoorShut(cache.vehicle, args, false)
        else
            SetVehicleDoorOpen(cache.vehicle, args, false, false)
        end
    elseif args == 'bomb_bay' then
        if AreBombBayDoorsOpen(cache.vehicle) then
            CloseBombBayDoors(cache.vehicle)
        else
            OpenBombBayDoors(cache.vehicle)
        end
    elseif args == 'open_all_doors' then
        for i = 0, 7 do
            SetVehicleDoorOpen(cache.vehicle, i, false, fale)
        end
        if GetEntityBoneIndexByName(cache.vehicle, 'door_hatch_l') ~= -1 and GetEntityBoneIndexByName(cache.vehicle, 'door_hatch_r') ~= -1 then
            OpenBombBayDoors(cache.vehicle)
        end
    elseif args == 'close_all_doors' then
        SetVehicleDoorsShut(cache.vehicle, false)
        if GetEntityBoneIndexByName(cache.vehicle, 'door_hatch_l') ~= -1 and GetEntityBoneIndexByName(cache.vehicle, 'door_hatch_r') ~= -1 then
            CloseBombBayDoors(cache.vehicle)
        end
    elseif args == 'remove_door' then
        SetVehicleDoorBroken(cache.vehicle, scrollIndex - 1, vehicleRemoveDoors)
    end
end)

lib.registerMenu({
    id = 'berkie_menu_vehicle_options_windows',
    title = 'Vehicle Windows',
    position = 'top-right',
    onClose = function(keyPressed)
        CloseMenu(false, keyPressed, 'berkie_menu_vehicle_options')
    end,
    onSelected = function(selected)
        MenuIndexes['berkie_menu_vehicle_options_windows'] = selected
    end,
    options = {
        {label = 'Roll up window', description = 'Roll the specified window up, press enter to apply it', args = 'roll_up', values = {'Left Front Window', 'Right Front Window', 'Left Rear Window', 'Right Rear Window', 'Extra (#1)', 'Extra (#2)'}, defaultIndex = 1, close = false},
        {label = 'Roll down window', description = 'Roll the specified window down, press enter to apply it', args = 'roll_down', values = {'Left Front Window', 'Right Front Window', 'Left Rear Window', 'Right Rear Window', 'Extra (#1)', 'Extra (#2)'}, defaultIndex = 1, close = false},
        {label = 'Smash window', description = 'Smash the specified window, press enter to apply it', args = 'smash', values = {'Left Front Window', 'Right Front Window', 'Left Rear Window', 'Right Rear Window', 'Extra (#1)', 'Extra (#2)', 'Front windscreen', 'Rear windscreen'}, defaultIndex = 1, close = false},
        {label = 'Restore window', description = 'Restore the specified window, press enter to apply it', args = 'restore', values = {'Left Front Window', 'Right Front Window', 'Left Rear Window', 'Right Rear Window', 'Extra (#1)', 'Extra (#2)', 'Front windscreen', 'Rear windscreen'}, defaultIndex = 1, close = false},
    }
}, function(_, scrollIndex, args)
    if args == 'roll_up' then
        if IsVehicleWindowIntact(cache.vehicle, scrollIndex - 1) then
            RollUpWindow(cache.vehicle, scrollIndex - 1)
        end
    elseif args == 'roll_down' then
        if IsVehicleWindowIntact(cache.vehicle, scrollIndex - 1) then
            RollDownWindow(cache.vehicle, scrollIndex - 1)
        end
    elseif args == 'smash' then
        SmashVehicleWindow(cache.vehicle, scrollIndex - 1)
    elseif args == 'restore' then
        FixVehicleWindow(cache.vehicle, scrollIndex - 1)
    end
end)

lib.registerMenu({
    id = 'berkie_menu_vehicle_spawner',
    title = 'Vehicle Spawner',
    position = 'top-right',
    onClose = function(keyPressed)
        CloseMenu(false, keyPressed, 'berkie_menu_vehicle_related_options')
    end,
    onSelected = function(selected)
        MenuIndexes['berkie_menu_vehicle_spawner'] = selected
    end,
    onSideScroll = function(_, scrollIndex, args)
        if args == 'inside_vehicle' then
            spawnInVehicle = scrollIndex == 1
            lib.setMenuOptions('berkie_menu_vehicle_spawner', {label = 'Spawn Inside Vehicle', description = 'This will teleport you into the vehicle when it spawns', args = 'inside_vehicle', values = {'Yes', 'No'}, defaultIndex = scrollIndex, close = false}, 2)
        elseif args == 'replace_vehicle' then
            replacePreviousVehicle = scrollIndex == 1
            lib.setMenuOptions('berkie_menu_vehicle_spawner', {label = 'Replace Previous Vehicle', description = 'This will delete the vehicle you were previously in when spawning a new vehicle', args = 'replace_vehicle', values = {'Yes', 'No'}, defaultIndex = scrollIndex, close = false}, 3)
        end
    end,
    options = {
        {label = 'Spawn Vehicle By Model Name', description = 'Enter the name of the vehicle you want to spawn', args = 'spawn_by_model'},
        {label = 'Spawn Inside Vehicle', description = 'This will teleport you into the vehicle when it spawns', args = 'inside_vehicle', values = {'Yes', 'No'}, defaultIndex = spawnInVehicle and 1 or 2, close = false},
        {label = 'Replace Previous Vehicle', description = 'This will delete the vehicle you were previously in when spawning a new vehicle', args = 'replace_vehicle', values = {'Yes', 'No'}, defaultIndex = replacePreviousVehicle and 1 or 2, close = false}
    }
}, function(_, scrollIndex, args)
    if scrollIndex then return end

    if args == 'spawn_by_model' then
        local vehicle = lib.inputDialog('Spawn Vehicle', {'Vehicle Model Name'})
        if vehicle and table.type(vehicle) ~= 'empty' then
            local model = joaat(vehicle[1])
            if IsModelInCdimage(model) then
                spawnVehicleOnPlayer(model)
            else
                lib.notify({
                    description = ('Vehicle model %s doesn\'t exist in the game'):format(vehicle[1]),
                    type = 'error'
                })
            end
        end
        Wait(500)
        args = 'berkie_menu_vehicle_spawner'
    end

    lib.showMenu(args, MenuIndexes[args])
end)

--#endregion Menu Registration

--#region Threads

CreateThread(function()
    local vehicleModels = GetAllVehicleModels()
    for i = 1, #vehicleModels do
        local modelName = vehicleModels[i]
        local model = joaat(modelName)
        local vehicleClass = GetVehicleClassFromName(model)
        local vehicleClassName = vehicleClassNames[vehicleClass] or vehicleClassNames[69]
        Vehicles[model] = {
            name = modelName,
            model = model,
            class = vehicleClassName ~= vehicleClassNames[69] and vehicleClass or 69,
            className = vehicleClassName
        }
    end

    while true do
        local sleep = 200
        local ped = cache.ped
        if isInVehicle(false) then
            sleep = 0
            local veh = cache.vehicle
            if vehicleGodMode then
                SetVehicleReceivesRampDamage(veh, not vehicleRampDamage)

                if vehicleVisualDamage then
                    RemoveDecalsFromVehicle(veh)
                end

                if vehicleAutoRepair then
                    SetVehicleFixed(veh)
                end

                SetVehicleCanBeVisiblyDamaged(veh, not vehicleVisualDamage)
                SetVehicleEngineCanDegrade(veh, not vehicleEngineDamage)

                if vehicleEngineDamage and GetVehicleEngineHealth(veh) < 1000.0 then
                    SetVehicleEngineHealth(veh, 1000.0)
                end

                SetVehicleWheelsCanBreak(veh, not vehicleStrongWheels)
                SetVehicleHasStrongAxles(veh, vehicleStrongWheels)

                local memoryAddress = Citizen.InvokeNative(`GET_ENTITY_ADDRESS`, veh)
                if not memoryAddress then
                    goto skipAddresses
                end

                do
                    memoryAddress += 392

                    local setter = vehicleInvincible and SetBit or ClearBit

                    setter(memoryAddress, 4) -- IsBulletProof
                    setter(memoryAddress, 5) -- IsFireProof
                    setter(memoryAddress, 6) -- IsCollisionProof
                    setter(memoryAddress, 7) -- IsMeleeProof
                    setter(memoryAddress, 11) -- IsExplosionProof
                end

                :: skipAddresses ::

                SetEntityInvincible(vehicle, vehicleInvincible)

                for i = 0, 5 do
                    if GetEntityBoneIndexByName(veh, vehicleDoorBoneNames[i]) ~= -1 then
                        SetVehicleDoorCanBreak(veh, i, not vehicleInvincible)
                    end
                end

                if vehicleNeverDirty and GetVehicleDirtLevel(veh) > 0 then
                    SetVehicleDirtLevel(veh, 0)
                end
            end

            if vehicleUseTorqueMultiplier then
                SetVehicleCheatPowerIncrease(veh, vehicleTorqueMultiplier)
            end

            if vehicleUsePowerMultiplier then
                ModifyVehicleTopSpeed(veh, vehiclePowerMultiplier)
            else
                ModifyVehicleTopSpeed(veh, 1)
            end

            if IsThisModelAPlane(GetEntityModel(veh)) then
                if disablePlaneTurbulence then
                    SetPlaneTurbulenceMultiplier(veh, 0.0)
                else
                    SetPlaneTurbulenceMultiplier(veh, 1.0)
                end
            end

            if vehicleFrozen then
                FreezeEntityPosition(veh, true)
            end

            if vehicleInfiniteFuel and GetVehicleFuelLevel(veh) < 99.0 then
                SetVehicleFuelLevel(veh, 100.0)
            end

            if vehicleShowHealth then
                drawTextOnScreen(('~n~Engine health: %s'):format(getHealthString(math.round(GetVehicleEngineHealth(veh), 0.001))), 0.5, 0.0)
                drawTextOnScreen(('~n~~n~Body health: %s'):format(getHealthString(math.round(GetVehicleBodyHealth(veh), 0.001))), 0.5, 0.0)
                drawTextOnScreen(('~n~~n~~n~Tank health: %s'):format(getHealthString(math.round(GetVehiclePetrolTankHealth(veh), 0.001))), 0.5, 0.0)
            end

            if GetVehicleClass(veh) == 8 then
                SetPedHelmet(ped, canWearHelmet)
            end

            if vehicleHighbeamsOnHonk then
                if IsControlPressed(0, 86) then
                    SetVehicleFullbeam(veh, true)
                end
                if IsControlJustReleased(0, 86) then
                    SetVehicleFullbeam(veh, false)
                end
            end
        else

        end
        Wait(sleep)
    end
end)

CreateThread(function()
    Wait(1000)
    while true do
        local cantBeKnockedOff = vehicleGodMode or vehicleUseBikeSeatbelt
        local cantBeDraggedOut = vehicleGodMode
        local cantBeShotInVehicle = vehicleGodMode

        SetPedCanBeDraggedOut(cache.ped, not cantBeDraggedOut)
        SetPedCanBeShotInVehicle(cache.ped, not cantBeShotInVehicle)
        SetPedCanBeKnockedOffVehicle(cache.ped, cantBeKnockedOff and 1 or 0)
        Wait(1000)
    end
end)

CreateThread(function()
    while true do
        local vehicle = GetVehiclePedIsIn(cache.ped, true)
        if vehicle ~= 0 and not IsPedInAnyVehicle(cache.ped, false) then
            if vehicleEngineAlwaysOn then
                SetVehicleEngineOn(vehicle, true, true, true)
            end

            if not IsEntityVisible(vehicle) then
                SetEntityVisible(vehicle, true, false)
            end
        end
        Wait(100)
    end
end)

--#endregion Threads

--[[
    TODO

        Add isInVehicle check at every vehicle menu
]]