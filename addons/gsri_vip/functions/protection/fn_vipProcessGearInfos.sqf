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

switch (toLower(_gear call BIS_fnc_itemType select 1)) do {
    case "vest": {
        if ((vest _target) isEqualTo "") then {_duration = 5;} else {_duration = 7;};
    };

    case "headgear": {
        if ((headgear _target) isEqualTo "") then {_duration = 2;} else {_duration = 4;};
    };

    case "glasses": {
        if ((goggles _target) isEqualTo "") then {_duration = 3;} else {_duration = 5;};
    };

    default {
        break;
    };
};

_duration;
