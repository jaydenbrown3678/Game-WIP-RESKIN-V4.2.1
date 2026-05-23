// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @description Handle CPU movement logic
/// @description Handle CPU movement logic - Phase 1 Basic
function scr_ai_character_control() {
    if (!is_cpu) return;

    switch (state) {
        case STATE_FREE:
			 scr_cpu_transformation();
            scr_cpu_free_state(); // Your movement/attack decision logic
			if (transformation1_on) {
        if (atk_type == ATK_1) atk_type = ATK_6;
        else if (atk_type == ATK_2) atk_type = ATK_7;
        else if (atk_type == ATK_3) atk_type = ATK_8;
		
		    }
		    break;
            
        case STATE_ATTACK:
            // Attack State Behavior
            if (AnimationEnd()) {
                // Reset attack flags and return to free state
                atk_1_landed = false;
                atk_2_landed = false;
                atk_3_landed = false;
                RandomizedBaseId();
                state = STATE_FREE;
				cpu_attack_cooldown = 0; // <-- ADD THIS LINE
				cpu_move_timer = 15; // Immediate movement after attack
        cpu_hspd = 0; // Reset momentum
		 right = false;
        left = false;
        cpu_hspd = 0;
            }
			
            break;
			
			case STATE_HURT: // NEW HURT STATE HANDLER
            // Basic hurt reaction - waits for animation then returns to free state
            if (AnimationEnd()) {
                state = STATE_FREE;
                
                // Optional: Add brief invulnerability timer here if needed
                // cpu_invincible_timer = 10; 
            }
            break;
			
			case STATE_DASH:
            // Use your EXISTING dash logic unchanged
            x += hspd;
            y = dash_start_y;
            
            if (abs(x - dash_start_x) >= 50) {
                hspd = 0;
                state = STATE_FREE;
                x = dash_target_x;
                sprite_index = sp_idle;
            }
            break;
            
        // Keep all other states EXACTLY as-is
        case STATE_DEATH:
            if (is_defeated || opp_is_defeated) {
                FreezeLastFrame();
            } else {
                state = STATE_FREE;
            }
            break;
            
       // In STATE_BLOCK case:
case STATE_BLOCK:
    if (opponent.state != STATE_ATTACK || opponent.sprite_index == sp_idle) {
        state = STATE_FREE;
    } else {
        sprite_index = sp_shield;
    }
    break;
            
        case STATE_EMOTE:
            if (AnimationEnd()) state = STATE_FREE;
            break;
            
        case STATE_FROZEN:
            hspd = 0;
            vspd = 0;
            can_attack = false;
            break;
			
			
	}
}