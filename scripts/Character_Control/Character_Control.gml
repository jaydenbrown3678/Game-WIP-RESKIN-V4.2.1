// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Character_Control() {
	if (is_cpu) return;
    switch (state) {
		
		
        case STATE_FREE:
    can_attack = true;

    // Horizontal movement - modified for transformation speed boost
    if (!shield) {
        var current_move_speed = transformation1_active ? MOVE_SPD * 2 : (transformation2_active ? MOVE_SPD * 2 : (transformation3_active ? MOVE_SPD * 3 : MOVE_SPD));
        hspd = current_move_speed * (k_check(right) - k_check(left));
        x += hspd;
    } else {
        hspd = 0;
    }

    if (landed) {
        // Ground attacks
if (k_check_pressed(attack_1)) {
	if (transformation3_on) {
        SetAttack(ATK_13);
    }
    else if (transformation2_on) {
        SetAttack(ATK_10);
    } else if (transformation1_on) {
        SetAttack(ATK_6);  // This should work for Cook Transformation 1
    } else {
        SetAttack(ATK_1);
    }
}
else if (k_check_pressed(attack_2)) {
	 if(transformation3_on) {
        SetAttack(ATK_14);
    }
	else if(transformation2_on) {
        SetAttack(ATK_11);
    } else if (transformation1_on) {
        SetAttack(ATK_7);  // This should work for Cook Transformation 1
    } else {
        SetAttack(ATK_2);
    }
}
else if (k_check_pressed(attack_3)) {
	if(transformation3_on) {
        SetAttack(ATK_15);
    }
    else if (transformation1_on) {
        SetAttack(ATK_8);  // This should work for Cook Transformation 1
    } else {
        SetAttack(ATK_3);
    }
	if (transformation2_on) {
        SetAttack(ATK_12);
    } 
}

        // Jump
        if (k_check_pressed(up)) {
            vspd = JUMP_FORCE;
            landed = false;
            has_double_jumped = false;
            has_dashed_in_air = false;
        }
        shield = k_check(down);
    } else { // In air
        if (k_check_pressed(jump_attack)) {
            SetAttack(ATK_5);
            break;
        }
        
        if (k_check_pressed(up) && !has_double_jumped) {
            vspd = JUMP_FORCE;
            has_double_jumped = true;
        }
    }

    // REMOVED THE DUPLICATE attack_1, attack_2, attack_3 CHECKS FROM HERE

    // SPECIAL 3 — 100 meter (priority)
if (k_check_pressed(attack_5) && special_move_meter >= 100) {
    special_move_meter -= 100;
    SetAttack(ATK_9);
}

// SPECIAL 1 — 50 meter
else if (k_check_pressed(attack_4) && special_move_meter >= 50) {
    special_move_meter -= 50;
    SetAttack(ATK_4);
}


    // Emote
    var emote_key = (controller == CONT_P1) ? ord("Q") : vk_shift;
    if (k_check_pressed(emote_key)) {
        state = STATE_EMOTE;
        sprite_index = sp_emote1;
    }

    break;

        case STATE_ATTACK:
	    if (landed) {
	        hspd = 0;
	    }
    
	    // Reset ATK_1 landed flag when attack animation ends
	    if (AnimationEnd()) {
	        atk_1_landed = false;
	        RandomizedBaseId();
	        state = STATE_FREE;
	    }
	    break;

        case STATE_HURT:
    // ========== COMBO RESET ==========
    combo_counter = 0;
    combo_active = false;
    // ================================
    
    if (landed) {
        if (AnimationEnd()) {
            state = STATE_FREE;
        }
    }
    
			
			
            break;

        case STATE_DEATH:
    if (is_defeated || opp_is_defeated) {
        // Permanent death (no respawn)
        FreezeLastFrame();
    } else {
		
        // Temporary death (will respawn)
        state = STATE_FREE;
    }
    break;

        case STATE_BLOCK:
            if (AnimationEnd()) {
                state = STATE_FREE;
            }
            break;

        case STATE_DASH:
            // Move the character horizontally
            x += hspd;

            // Lock the y-position during the dash
            y = dash_start_y; // Ensure the y-position remains locked to the starting y-position

            // Check if the dash target position has been reached
            if (abs(x - dash_start_x) >= 50) {
                // End the dash
                hspd = 0;
                state = STATE_FREE;

                // Snap to the exact target position (50 pixels from the start)
                x = dash_target_x; // Ensure the dash ends precisely at the target position

                // Return to idle animation
                sprite_index = sp_idle;
            }
            break;

        case STATE_EMOTE:
            // Play the emote animation
            if (AnimationEnd()) {
                state = STATE_FREE; // Return to free state after the emote animation ends
            }
            break;
			
			case STATE_FROZEN:
    // Prevent all movement and attacks
    hspd = 0;
    vspd = 0;
    can_attack = false;
    break;
			
    }
}