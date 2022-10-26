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
        "_gearInfos", 
        [], 
        [[]]
    ],
    [
        "_animName", 
        "", 
        [""]
    ]
];

[_player] call GSRI_fnc_vipPlayTransitionAnimation;
[_player, _animName, 1] call ace_common_fnc_doAnimation;

["vipChangeSpeedCoeff", [_player, 1]] call CBA_fnc_globalEvent;
