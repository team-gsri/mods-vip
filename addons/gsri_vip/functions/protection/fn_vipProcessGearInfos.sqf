params [
    [
        "_target", 
        objNull,
        [objNull]
    ],
    [
        "_gear", 
        "", 
        [""]
    ]
];

private _duration = 0;

//Get gear type in order to get from setting the duration to equip it, and add extra time when the target already has this kind of gear
switch (toLower(_gear call BIS_fnc_itemType select 1)) do {
    case "vest": {
        _duration = gsri_vip_equipingVestDuration;
        if !((vest _target) isEqualTo "") then {_duration = _duration + gsri_vip_equipingVestExtraDuration;};
    };

    case "headgear": {
        _duration = gsri_vip_equipingHeadgearDuration;
        if !((headgear _target) isEqualTo "") then {_duration = _duration + gsri_vip_equipingHeadgearExtraDuration;};
    };

    case "glasses": {
        _duration = gsri_vip_equipingGlassesDuration;
        if !((goggles _target) isEqualTo "") then {_duration = _duration + gsri_vip_equipingGlassesExtraDuration;};
    };

    default {
        break;
    };
};

_duration;
