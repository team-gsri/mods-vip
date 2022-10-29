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
    ],
	[
		"_animName", 
		"", 
		[""]
	]
];

if((_gearInfos select 0) isEqualTo "") exitWith { diag_log "GSRI VIP: vipTryEquipGear: no _gear to equip has been passed as argument." };

private _gear = _gearInfos select 0;
private _gearType = _gearInfos select 1;

// Processed data is an array containing as first element the gear worn by the target and as second element an array containing the equip and unequip durations for this kind of gear
private _processedData = [_target, _gearType] call GSRI_fnc_vipProcessGearInfos;
private _equipDuration = (_processedData select 1) select 0;
private _unequipDuration = (_processedData select 1) select 1;
private _vipGear = _processedData select 0;

// If this function is called for the first time we need to get all the animations that will be played to get their durations and calculate the speedAnimCoeff to apply
// If this function is called from GSRI_fnc_vipUnequipGearSuccess, we only need the duration of "act_alien_gesture" to get the speedAnimCoeff
private _animArray = [];
_animArray pushBack "act_alien_gesture";
private _currentAnimName = _animName;
if(_animName isEqualTo "") then {
    _currentAnimName = animationState _player;
    _animName = "AmovP[pos]MstpS[stn]W[wpn]Dnon_AmovPercMstpS[stn]W[wpn]Dnon";
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
};

private _animDuration = 0;
{
	_animCfgSpeed = getNumber (configfile >> "CfgMovesMaleSdr" >> "States" >> _x >> "speed");
	if(_animCfgSpeed != 0) then {_animDuration = _animDuration + abs (1 / _animCfgSpeed);};	
} forEach _animArray;

private _equipAnimRatio = _animDuration / (_equipDuration);
["vipChangeSpeedCoeff", [_player, _equipAnimRatio]] call CBA_fnc_globalEvent;
[_player, "Act_Alien_Gesture"] call ace_common_fnc_doAnimation;
private _progressBarTitle = "";
private _gearDisplayName = localize format ["STR_GSRI_VIP_%1", _gearType];

// Check if the target already wears gear, if yes it is required to unequip his current gear first
if(_vipGear isEqualTo "") then {
    _progressBarTitle = format ["%1 %2", localize "STR_GSRI_VIP_settingUpProtection", _gearDisplayName];
    [_equipDuration, [_target, _player, _gearInfos, _currentAnimName] , GSRI_fnc_vipEquipGearSuccess, GSRI_fnc_vipEquipGearFailure, _progressBarTitle] call ace_common_fnc_progressBar;
} else {
    _progressBarTitle = format ["%1 %2", localize "STR_GSRI_VIP_unequipingProtection", _gearDisplayName];
    [_unequipDuration, [_target, _player, _gearInfos, _currentAnimName, _vipGear], GSRI_fnc_vipUnequipGearSuccess, GSRI_fnc_vipEquipGearFailure, _progressBarTitle] call ace_common_fnc_progressBar;
};
