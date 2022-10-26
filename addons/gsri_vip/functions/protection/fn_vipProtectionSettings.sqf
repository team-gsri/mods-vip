[
  "gsri_vip_weaponAllowed",
  "CHECKBOX",
  [localize "STR_GSRI_VIP_weaponAllowed", localize "STR_GSRI_VIP_weaponAllowed_tooltip"],
  ["GSRI VIP", "Protection"],
  true,
  1,
  {},
  false
] call CBA_fnc_addSetting;


{
    defaultDuration = 0;
    if(_x isEqualTo "Vest") then {defaultDuration = 5;};
    if(_x isEqualTo "Headgear") then {defaultDuration = 2;};
    if(_x isEqualTo "Glasses") then {defaultDuration = 3;};
    [
      format ["gsri_vip_equiping%1Duration", _x],
      "SLIDER",
      [localize format ["STR_GSRI_VIP_equiping%1Duration", _x], localize format ["STR_GSRI_VIP_equiping%1Duration_tooltip", _x]],
      ["GSRI VIP", "Protection"],
      [1, 60, defaultDuration, 1],
      1,
      {},
      false
    ] call CBA_fnc_addSetting;

    [
      format ["gsri_vip_equiping%1ExtraDuration", _x],
      "SLIDER",
      [localize format ["STR_GSRI_VIP_unequiping%1Duration", _x], localize format ["STR_GSRI_VIP_unequiping%1Duration_tooltip", _x]],
      ["GSRI VIP", "Protection"],
      [1, 60, (2 max (defaultDuration/1.5)), 1],
      1,
      {},
      false
    ] call CBA_fnc_addSetting;
    
} forEach ["Vest", "Headgear", "Glasses"];
