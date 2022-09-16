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
	]
];

private _actions = [];

{ 
	private _displayName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
	private _displayGlassesName = getText (configFile >> "CfgGlasses" >> _x >> "displayName");

	switch (toLower(_x call BIS_fnc_itemType select 1)) do {
		case "vest": {
			// Check if the item is a rebreather
			if ((getText (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "vestType" )) isEqualTo "Rebreather") then {
				private _action = [format ["equip%1",_x], _displayName, "fr\gsri\vip\ui\icon_rebreather.paa", GSRI_fnc_vipTryEquipGear, {true}, {}, _x] call ace_interact_menu_fnc_createAction;
				_actions pushBack [_action, [], _target];
			} else {
				private _action = [format ["equip%1",_x], _displayName, "fr\gsri\vip\ui\icon_vest.paa", GSRI_fnc_vipTryEquipGear, {true}, {}, _x] call ace_interact_menu_fnc_createAction;
				_actions pushBack [_action, [], _target];
			};
		};

		case "headgear": {
			private _action = [format ["equip%1",_x], _displayName, "fr\gsri\vip\ui\icon_helmet.paa", GSRI_fnc_vipTryEquipGear, {true}, {}, _x] call ace_interact_menu_fnc_createAction;
			_actions pushBack [_action, [], _target];
		};

		case "glasses": {
			private _action = [format ["equip%1",_x], _displayGlassesName, "fr\gsri\vip\ui\icon_facewear.paa", GSRI_fnc_vipTryEquipGear, {true}, {}, _x] call ace_interact_menu_fnc_createAction;
			_actions pushBack [_action, [], _target];
		};
	};
} forEach (backpackItems _player); 

_actions;