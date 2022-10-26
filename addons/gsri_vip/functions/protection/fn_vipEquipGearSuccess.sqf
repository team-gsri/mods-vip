_args params [
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
        "_gear", 
        [], 
        [[]]
    ],
    [
        "_animName", 
        "", 
        [""]
    ]
];

_args call GSRI_fnc_vipEquipGear;
[_player] call GSRI_fnc_vipPlayTransitionAnimation;
[_player, _animName, 1] call ace_common_fnc_doAnimation;

["vipChangeSpeedCoeff", [_player, 1]] call CBA_fnc_globalEvent;
