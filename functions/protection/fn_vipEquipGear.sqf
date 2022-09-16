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
		"_gearToEquip", 
		"", 
		[""]
	]
];

if (_gearToEquip isEqualTo "") exitWith { diag_log format["GSRI VIP: vipEquipGear: no _gearToEquip."] };

private _vipGear = "";
private _vestItems = [];
private _vestMagazines = [];

switch (toLower(_gearToEquip call BIS_fnc_itemType select 1)) do {
	case "vest": {
		_vipGear = vest _target;
		_vestMagazines = magazinesAmmoCargo vestContainer _target;
		clearMagazineCargoGlobal vestContainer _target;
		_vestItems = vestItems _target;
		_target addVest _gearToEquip;
	};

	case "headgear": {
		_vipGear = headgear _target;
		_target addHeadgear _gearToEquip;
	};

	case "glasses": {
		_vipGear = goggles _target;
		_target addGoggles _gearToEquip;
	};

	default {
		break;
	}
};

_player removeItemFromBackpack _gearToEquip;

if !(_vipGear isEqualTo "") then {
	// If items have already been droped, we get the existing container to drop the vip gear inside.
	private _gearHolder = _target nearObjects ["GroundWeaponHolder", 1] select 0;
	// Fixes a problem when getting every object in GroupWeaponHolder makes it null and unusable
	// So, when the GroupWeaponHolder is null, we make it nil so it will be reinstantiated
	if(isNull _gearHolder) then {
		_gearHolder = nil;
	};
	// Instantiates a GroupWeaponHolder to collect on ground the dropped equipment
	if((isNil "_gearHolder")) then {
		_gearHolder = createVehicle ["GroundWeaponHolder", getPosATL _target, [], 0, "CAN_COLLIDE"];
	};
	_gearHolder addItemCargoGlobal [_vipGear, 1]; 

	if(toLower(_vipGear call BIS_fnc_itemType select 1) isEqualTo "vest") then {
		_droppedContainer = ((everyContainer _gearHolder select 0) select 1);;
		{
			_droppedContainer addItemCargoGlobal [_x, 1];
		} forEach _vestItems;
		{
			_droppedContainer addMagazineAmmoCargo [_x select 0, 1, _x select 1];
		} forEach _vestMagazines;
	};
};