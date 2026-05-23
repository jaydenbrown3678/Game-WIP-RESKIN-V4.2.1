// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_cpu_transformation() {
    if (!is_cpu || !special_move2_ready || transformation1_active) return;

    // Only transform under these conditions:
    if (opponent.state == STATE_ATTACK ||  // Enemy is attacking
        special_move_meter2 >= 50 ||       // Meter is full
        (cpu_difficulty == 2 && random(1) < 0.7)) {  // Hard AI has 70% chance
        
        // Execute transformation
        sprite_index = sp_transform1;
        state = STATE_SPECIAL2;
        special_move2_ready = false;
        transformation1_active = true;
        transformation1_on = true;
        trans_1_timer = 0;
    }
	
	if (transformation1_active) {
    trans_1_timer++;
    if (trans_1_timer >= 60) {
        trans_1_timer = 0;
        special_move_meter2 -= (cpu_difficulty + 1); // Scales with difficulty (1-3)
        
        if (special_move_meter2 <= 0) {
            // Revert transformation
            special_move_meter2 = 0;
            transformation1_active = false;
            transformation1_on = false;
            sprite_index = (vspd > 0) ? sp_fall : sp_jump;
        }
    }
}
}