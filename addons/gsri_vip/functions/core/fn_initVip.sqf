if!(isDedicated) then {
    private _protectionMenu  = ["protectionMenu", localize "STR_GSRI_VIP_protection", "\A3\ui_f\data\igui\cfg\simpleTasks\types\defend_ca.paa", {}, GSRI_fnc_vipCanEquipGear, GSRI_fnc_vipCheckForGear, "head"] call ace_interact_menu_fnc_createAction;
    ["CAManBase", 0, ["ACE_Head"], _protectionMenu, true] call ace_interact_menu_fnc_addActionToClass;

	_protectionMenu  = ["protectionMenu", localize "STR_GSRI_VIP_protection", "\A3\ui_f\data\igui\cfg\simpleTasks\types\defend_ca.paa", {}, GSRI_fnc_vipCanEquipGear, GSRI_fnc_vipCheckForGear, "torso"] call ace_interact_menu_fnc_createAction;
	["CAManBase", 0, ["ACE_Torso"], _protectionMenu, true] call ace_interact_menu_fnc_addActionToClass;

	_changeSpeedCoeffEH = ["vipChangeSpeedCoeff", {params ["_target", "_coeff"]; _target setAnimSpeedCoef _coeff;}] call CBA_fnc_addEventHandler;
};
