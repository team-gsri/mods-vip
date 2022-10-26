class CfgPatches {
    class gsri_vip {
        units[]={};
        requiredVersion=0.1;
        requiredAddons[]={"ace_common", "ace_interact_menu"};
        author="$STR_GSRI_VIP_AUTHOR";
    };
};

class Extended_PreInit_EventHandlers {
  class gsri_vip {
    init = "call GSRI_fnc_vipProtectionSettings";
  };
};

class CfgFunctions {
	class GSRI {
		class protection{
			file="fr\gsri\vip\functions\protection";
            class vipCanEquipGear {};
			class vipCheckForGear {};
			class vipEquipGear {};
			class vipEquipGearFailure {};
			class vipEquipGearSuccess {};
			class vipPlayTransitionAnimation {};
			class vipProcessGearInfos {};
            class vipProtectionSettings {};
			class vipTryEquipGear {};
			class vipUnequipGear {};
			class vipUnequipGearSuccess {};
		};
		class init{
			file="fr\gsri\vip\functions\core";
			class initVip { postInit = 1 };
		};
	};
};
