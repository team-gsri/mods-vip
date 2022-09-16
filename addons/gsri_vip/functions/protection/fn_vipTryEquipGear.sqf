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
		"_gear", 
		"", 
		[""]
	]
];

if(_gear isEqualTo "") exitWith { diag_log format["GSRI VIP: vipTryEquipGear: no _gear to equip has been passed as argument."] };

_duration = [_target, _gear] call GSRI_fnc_vipProcessGearInfos;

paramsToPass = [_target, _player, _gear];

[_duration, [] , {paramsToPass call GSRI_fnc_vipEquipGear; paramsToPass = nil;}, {}, localize "STR_VIP_settingUpEquipment"] call ace_common_fnc_progressBar;