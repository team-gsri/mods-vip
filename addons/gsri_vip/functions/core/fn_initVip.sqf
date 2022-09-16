if!(isDedicated) then {
	private _protectionMenu  = ["protectionMenu", localize "STR_VIP_protection", "", {}, {true}, GSRI_fnc_vipCheckForGear] call ace_interact_menu_fnc_createAction;

	["CAManBase", 0, ["ACE_MainActions"], _protectionMenu, true] call ace_interact_menu_fnc_addActionToClass;
};