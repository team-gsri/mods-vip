params [
    [
        "_target",
        objNull,
        [objNull]
    ],
    [
        "_player", 
        objNull,
        [objNull]
    ],
    [
        "_gearInfos", 
        [], 
        [[]]
    ]
];

private _gearToEquip = _gearInfos select 0;

if (_gearToEquip isEqualTo "") exitWith { diag_log "GSRI VIP: vipEquipGear: no gear to equip." };

switch (_gearInfos select 1) do {
    case "vest": {
        _target addVest _gearToEquip;
    };

    case "headgear": {
        _target addHeadgear _gearToEquip;
    };

    case "glasses": {
        _target addGoggles _gearToEquip;
    };

    default {
        break;
    }
};

_player removeItemFromBackpack _gearToEquip;
