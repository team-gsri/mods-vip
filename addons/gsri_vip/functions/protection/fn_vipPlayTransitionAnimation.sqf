params [
    [
        "_player", 
        objNull,
        [objNull]
    ]
];

private _animationTransition = "amovp[pos]mstpsnonwnondnon";
private _pos = ["erc", "knl", "pne"] param [["STAND", "CROUCH", "PRONE"] find stance _player];
_animationTransition = [_animationTransition, "[pos]", _pos] call CBA_fnc_replace;
[_player, _animationTransition, 2] call ace_common_fnc_doAnimation;
