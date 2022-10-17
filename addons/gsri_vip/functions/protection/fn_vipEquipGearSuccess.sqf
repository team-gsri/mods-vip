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
		"", 
		[""]
	],
	[
		"_animName", 
		"", 
		[""]
	]
];

_args call GSRI_fnc_vipEquipGear;
private _animationTransition = "amovp[pos]mstpsnonwnondnon";
private _pos = ["erc", "knl", "pne"] param [["STAND", "CROUCH", "PRONE"] find stance _player];
_animationTransition = [_animationTransition, "[pos]", _pos] call CBA_fnc_replace;
[_player, _animationTransition, 2] call ace_common_fnc_doAnimation;
[_player, _animName, 1] call ace_common_fnc_doAnimation;

["vipChangeSpeedCoeff", [_player, 1]] call CBA_fnc_globalEvent;