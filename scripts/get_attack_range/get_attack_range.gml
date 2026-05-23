// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @description Initialize CPU character profile
/// @param character
/// @description Returns approximate range for each attack type
function get_attack_range(atk_type) {
    switch (atk_type) {
        case ATK_1: return 80;   // Close jab
        case ATK_2: return 100;  // Medium kick
        case ATK_3: return 120;  // Far poke
        case ATK_4: return 150;  // Special
        case ATK_5: return 90;   // Air attack
        case ATK_6: return 80;   // Trans1 attack1
        case ATK_7: return 110;  // Trans1 attack2
        case ATK_8: return 130;  // Trans1 attack3
        case ATK_9: return 200;  // Super
		case ATK_10: return 100;
        default:    return 100;  // Fallback
    }
}
