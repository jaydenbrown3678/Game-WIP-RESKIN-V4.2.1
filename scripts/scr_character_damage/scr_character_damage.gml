// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_character_damage() {
    static character_damage_map = undefined;
    
    // Initialize the damage map if it doesn't exist
    if (is_undefined(character_damage_map)) {
        character_damage_map = ds_map_create();
        
        // Fighter damage values - add ATK_10
        ds_map_add(character_damage_map, CHAR_FIGHTER, [3, 6, 3, 30, 5, 5, 8, 5, 35, 6, 7,9,7,8,9]); // Added 6 for ATK_10
        
        // Samurai damage values [ATK_1 to ATK_9]
        ds_map_add(character_damage_map, CHAR_SAMURAI, [5, 7, 4, 35, 4, 3.5, 9, 5, 35, 6, 7, 9]);
        
        // Cook damage values [ATK_1 to ATK_9]
        ds_map_add(character_damage_map, CHAR_COOK, [1, 2, 1, 20, 3, 6, 3, 2.5, 35]);
		
		// Ninja damage values (15 elements - matches others)
ds_map_add(character_damage_map, CHAR_WINDNINJA, [4, 4, 6, 25, 5, 7, 8, 9, 30, 8, 9, 10, 10, 12, 35]);
	}
    
    return character_damage_map;
}