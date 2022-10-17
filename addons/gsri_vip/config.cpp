class CfgPatches {
    class gsri_vip {
        units[]={};
        requiredVersion=0.1;
        requiredAddons[]={"ace_common", "ace_interact_menu"};
        author="$STR_GSRI_VIP_AUTHOR";
    };
};

class CfgFunctions {
	class GSRI {
		class protection{
			file="fr\gsri\vip\functions\protection";
			class vipCheckForGear {};
			class vipEquipGear {};
			class vipEquipGearFailure {};
			class vipEquipGearSuccess {};
			class vipProcessGearInfos {};
			class vipTryEquipGear {};
		};
		class init{
			file="fr\gsri\vip\functions\core";
			class initVip { postInit = 1 };
		};
	};
};