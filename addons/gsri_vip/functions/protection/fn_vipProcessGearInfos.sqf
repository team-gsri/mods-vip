params [
    [
        "_target", 
        objNull,
        [objNull]
    ],
    [
        "_gearType", 
        "", 
        [""]
    ]
];

private _processedData = ["", [0,0]];

//Get gear type in order to get from setting the duration to equip it, and add extra time when the target already has this kind of gear
switch (toLower(_gearType)) do {
    case "vest": {
        _processedData = [vest _target, [gsri_vip_equipingVestDuration, gsri_vip_equipingVestExtraDuration]];
    };

    case "headgear": {
        _processedData = [headgear _target, [gsri_vip_equipingHeadgearDuration, gsri_vip_equipingHeadgearExtraDuration]];
    };

    case "glasses": {
        _processedData = [goggles _target, [gsri_vip_equipingGlassesDuration,gsri_vip_equipingGlassesExtraDuration]];
    };

    default {
        break;
    };
};

_processedData;
