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

if(_gear isEqualTo "") exitWith { diag_log ["GSRI VIP: vipTryEquipGear: no _gear to equip has been passed as argument."] };

_duration = [_target, _gear] call GSRI_fnc_vipProcessGearInfos;

// Get animations that will be played to get their durations and calculate the speedAnimCoeff to apply
private _currentAnimName = animationState _player;
private _animName = "AmovP[pos]MstpS[stn]W[wpn]Dnon_AmovPercMstpS[stn]W[wpn]Dnon";
private _animArray = [];
private _wpn = ["non", "rfl", "lnr", "pst"] param [["", primaryWeapon _player, secondaryWeapon _player, handgunWeapon _player] find currentWeapon _player];
private _pos = ["erc", "knl", "pne"] param [["STAND", "CROUCH", "PRONE"] find stance _player];
private _stn = "non";
if (_wpn != "non") then {
    _stn = ["ras", "low"] select (weaponLowered _player);
	_animName = "AmovP[pos]MstpS[stn]W[wpn]Dnon_AmovPercMstpSrasW[wpn]Dnon";
};

_animName = [_animName, "[pos]", _pos] call CBA_fnc_replace;
_animName = [_animName, "[stn]", _stn] call CBA_fnc_replace;
_animName = [_animName, "[wpn]", _wpn] call CBA_fnc_replace;
_animArray pushBack _animName;
_animName = ([_animName, "_"] call BIS_fnc_splitString) select 1;
_animName = format["%1%2", _animName, "_AmovPercMstpSnonWnonDnon"];
_animArray pushBack _animName;
_animArray pushBack (format["%1%2", _animName, "_end"]);
_animArray pushBack "act_alien_gesture";

private _animDuration = 0;
{
	_animCfgSpeed = getNumber (configfile >> "CfgMovesMaleSdr" >> "States" >> _x >> "speed");
	if(_animCfgSpeed != 0) then {_animDuration = _animDuration + abs (1 / _animCfgSpeed);};	
} forEach _animArray;

private _animRatio = _animDuration / _duration;

["vipChangeSpeedCoeff", [_player, _animRatio]] call CBA_fnc_globalEvent;
[_player, "Act_Alien_Gesture"] call ace_common_fnc_doAnimation;

[_duration, [_target, _player, _gear, _currentAnimName] , GSRI_fnc_vipEquipGearSuccess, GSRI_fnc_vipEquipGearFailure, localize "STR_VIP_settingUpProtection"] call ace_common_fnc_progressBar;