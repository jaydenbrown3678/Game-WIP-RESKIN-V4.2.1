// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_reset_combo_flags() {
    // ATK_1 combo resets
    if (sprite_index == fighter_attack1_combo1 && image_index >= image_number-1) {
        atk_1_hit = false;
    }
    if (sprite_index == samurai_attack1_combo1 && image_index >= image_number-1) {
        atk_1_hit = false;
    }
    if (sprite_index == cook_attack1_combo1 && image_index >= image_number-1) {
        atk_1_hit = false;
    }
	if (sprite_index == ninja_attack1_combo1 && image_index >= image_number-1) {
        atk_1_hit = false;
    }
	

    // ATK_2 combo resets
    if (sprite_index == fighter_attack2_combo1 && image_index >= image_number-1) {
        atk_2_hit = false;
    }
    if (sprite_index == samurai_attack2_combo1 && image_index >= image_number-1) {
        atk_2_hit = false;
    }
    if (sprite_index == cook_attack2_combo1 && image_index >= image_number-1) {
        atk_2_hit = false;
    }
	if (sprite_index == ninja_attack2_combo1 && image_index >= image_number-1) {
        atk_2_hit = false;
    }

    // ATK_3 combo resets
    //if (sprite_index == fighter_attack3_combo1 && image_index >= image_number-1) {
       // atk_3_hit = false;
   // }
    if (sprite_index == samurai_attack3_combo1 && image_index >= image_number-1) {
        atk_3_hit = false;
    }
    if (sprite_index == cook_attack3_combo1 && image_index >= image_number-1) {
        atk_3_hit = false;
    }

    // Combo2 resets
    if (sprite_index == fighter_attack1_combo2 && image_index >= image_number-1) {
        if (!atk_1_combo3_hit) {
            atk_1_combo2_hit = false;
            atk_1_hit = false;
        }
        atk_1_chain_hit = false;
    }
    if (sprite_index == samurai_attack1_combo2 && image_index >= image_number-1) {
        atk_1_combo2_hit = false;
        atk_1_hit = false;
    }

    // Transformed attack resets
    if (sprite_index == fighter_trans1_attk1_combo1 && image_index >= image_number-1) {
        trans1_atk_1_hit = false;
    }
    if (sprite_index == samurai_trans1_attck1_combo1 && image_index >= image_number-1) {
        trans1_atk_1_hit = false;
    }
	if (sprite_index == cook_trans1_attck1_combo1 && image_index >= image_number-1) {
        trans1_atk_1_hit = false;
    }
    if (sprite_index == fighter_trans1_attk1_combo1_1 && image_index >= image_number-1) {
        trans1_atk_2_hit = false;
    }
    if (sprite_index == samurai_trans1_attck2_combo1 && image_index >= image_number-1) {
        trans1_atk_2_hit = false;
    }
	if (sprite_index == cook_trans1_attck2_combo1 && image_index >= image_number-1) {
        trans1_atk_2_hit = false;
    }
    if (sprite_index == fighter_trans1_special && image_index >= image_number-1) {
        trans1_special1_hit = false;
    }
	
	// Transformed 2 attack resets
    if (sprite_index == fighter_trans2_attack1_combo1 && image_index >= image_number-1) {
        trans2_atk_1_hit = false;
    }
	if (sprite_index == fighter_trans2_attack2_combo1 && image_index >= image_number-1) {
        trans2_atk_2_hit = false;
    }

   

// Reset for fighter_attack1_chain1
if (sprite_index == fighter_attack1_chain1 && image_index >= image_number-1) {
    atk_1_chain_hit = false;
    atk_1_hit = false;
    atk_1_combo2_hit = false;
    atk_1_combo3_hit = false;
    combo_1_chain_hit = false; // ADD THIS LINE
}

// Reset for fighter_combo1_chain1  
if (sprite_index == fighter_atk1_combo1_chain1 && image_index >= image_number-1) {
    atk_1_chain_hit = false;
    atk_1_hit = false;
    atk_1_combo2_hit = false;
    atk_1_combo3_hit = false;
    combo_1_chain_hit = false; // ADD THIS LINE
}

if (sprite_index == fighter_attack1_chain2 && image_index >= image_number-1) {
    atk_1_chain2_hit = false;
    atk_1_hit = false;
}

// Reset for fighter_attack2_chain1 (ATK_2 → ATK_1 chain)
if (sprite_index == fighter_attack2_chain1 && image_index >= image_number-1) {
    atk_2_chain_hit = false;
    atk_2_hit = false;
    atk_2_to_1_chain_hit = false;  // If you're using this flag
}

if (sprite_index == fighter_trans3_atk1_combo1 && image_index >= image_number-1) {
    trans3_atk_1hit = false;
}

// Reset combo2 flag when its animation ends
if (sprite_index == fighter_trans1_attk1_combo2 && image_index >= image_number-1) {
    trans1_atk_1_combo1_hit = false;
	trans1_atk_1_hit = false;
}

if (sprite_index == fighter_trans1_attk2_chain1 && image_index >= image_number-1) {
	trans1_atk_1_hit = false;
}

if (sprite_index == fighter_trans1_attk1_chain1 && image_index >= image_number-1) {
	trans1_atk_1_hit = false;
	
}

}