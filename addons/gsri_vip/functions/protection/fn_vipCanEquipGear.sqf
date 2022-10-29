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

if (gsri_vip_weaponAllowed) exitWith {true;};
//If not allowed and no weapon in hands
if (currentWeapon _player isEqualTo "") exitWith {true;};
false;
