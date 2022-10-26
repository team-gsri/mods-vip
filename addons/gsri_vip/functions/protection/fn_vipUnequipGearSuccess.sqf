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
	],
    [
        "_vipGear", 
        "", 
        [""]
    ]
];

private _gearType = _gearInfos select 1;

[_player] call GSRI_fnc_vipPlayTransitionAnimation;
[_target, _vipGear, _gearType] call GSRI_fnc_vipUnequipGear;
[_target, _player, _gearInfos, _animName] call GSRI_fnc_vipTryEquipGear;
