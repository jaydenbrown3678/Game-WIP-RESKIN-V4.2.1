 // Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// HitManager function - call this in Step Event
function HitManager() {
    if (state != STATE_ATTACK) return;

    var hitbox_data;
    
    // Special cases first
    if (character == CHAR_FIGHTER && atk_type == ATK_1 && sprite_index == fighter_attack1_combo2) {
        hitbox_data = [
            { frames: [7], x_offset: 50, y_offset: 60 }
        ];
    }
    else if (character == CHAR_SAMURAI && atk_type == ATK_4 && sprite_index == samurai_trans2_special1) {
        hitbox_data = [
            { frames: [12], x_offset: 50, y_offset: 60 }
        ];
    }
    else if (character == CHAR_SAMURAI && atk_type == ATK_9 && sprite_index == samurai_trans2_special2) {
        hitbox_data = [
            { frames: [13], x_offset: 50, y_offset: 60 }
        ];
    }
    else if (character == CHAR_FIGHTER && atk_type == ATK_1 && sprite_index == fighter_trans1_attk1_combo1) {
        hitbox_data = [
            { frames: [9], x_offset: 50, y_offset: 60 },
            { frames: [5], x_offset: 50, y_offset: 60 }
        ];
    }
    else {
        switch (character) {
            case CHAR_FIGHTER:
                hitbox_data = ds_map_find_value(hitbox_frames_fighter, atk_type);
                break;
            case CHAR_SAMURAI:
                hitbox_data = ds_map_find_value(hitbox_frames_samurai, atk_type);
                break;
            case CHAR_COOK:
                hitbox_data = ds_map_find_value(hitbox_frames_cook, atk_type);
                break;
            case CHAR_WINDNINJA:
                hitbox_data = ds_map_find_value(hitbox_frames_ninja, atk_type);
                break;
            default:
                hitbox_data = undefined;
                break;
        }
    }

    if (is_undefined(hitbox_data)) return;

    if (is_array(hitbox_data)) {
        for (var i = 0; i < array_length_1d(hitbox_data); i++) {
            var entry = hitbox_data[i];
            var frames = entry.frames;

            for (var j = 0; j < array_length_1d(frames); j++) {
                if (round(image_index) == frames[j]) {
                    
                    // FREEZE TRIGGER
                    if (frames[j] == freeze_on_frame && 
                        atk_type == current_freeze_attack &&
                        instance_exists(opponent)) {
                        with (opponent) {
                            frozen_sprite = sprite_index;
                            frozen_image_index = image_index;
                            state = STATE_FROZEN;
                        }
                    }
                    
                    active_attack_frame = true;
                    current_attack_type = atk_type;
                    current_attack_damage = ds_map_find_value(scr_character_damage(), character)[atk_type];
                    
                    if (instance_exists(opponent) && place_meeting(x, y, opponent)) {
                        if (place_meeting(x, y, opponent)) {
                            
                            // ========== COMBO LOGIC START ==========
                            if (!hit_counted_this_frame) {
                                combo_counter++;
                                combo_timer = combo_max_gap;
                                hit_counted_this_frame = true;
                                
                                if (combo_counter >= 2) {
                                    combo_active = true;
                                }
                            }
                            // ========== COMBO LOGIC END ==========
                            
                            // Reset all combo flags
                            atk_1_hit = false;
                            atk_2_hit = false;
                            atk_3_hit = false;
                            atk_1_combo2_hit = false;
                            trans1_atk_1_hit = false;
                            trans1_atk_2_hit = false;
                            trans1_special1_hit = false;
                            trans2_atk_1_hit = false;
                            trans2_atk_2_hit = false;
                            atk_2_chain_hit = false;
                            trans3_atk_1hit = false;

                            // Set appropriate flag
                            switch(atk_type) {
                                case ATK_1: atk_1_hit = true; break;
                                case ATK_2: atk_2_hit = true; break;
                                case ATK_3: atk_3_hit = true; break;
                            }
                            
                            if (atk_type == ATK_1 && sprite_index == fighter_attack1_combo1) {
                                atk_1_combo2_hit = true;
                            }
                            if (atk_type == ATK_1 && sprite_index == samurai_attack1_combo1) {
                                atk_1_combo2_hit = true;
                            }
                            if (atk_type == ATK_1 && sprite_index == cook_attack1_combo1) {
                                atk_1_combo2_hit = true;
                            }
                            
                            if (atk_type == ATK_2 && combo_1_chain_hit) {
                                combo_1_chain_hit = false;
                            }
                            
                            if (atk_type == ATK_6 && transformation1_active) { 
                                trans1_atk_1_hit = true;
                            }
                            if (atk_type == ATK_7 && transformation1_active) { 
                                trans1_atk_2_hit = true;
                            }
                            if (atk_type == ATK_4 && transformation1_active) { 
                                trans1_special1_hit = true;
                            }
                            if (atk_type == ATK_10 && transformation2_active) { 
                                trans2_atk_1_hit = true;
                            }
                            if (atk_type == ATK_11 && transformation2_active) { 
                                trans2_atk_2_hit = true;
                            }
                            if (atk_type == ATK_13 && transformation3_active) { 
                                trans3_atk_1hit = true;
                            }
                            
                            if (atk_1_combo2_hit && keyboard_check_pressed(attack_2)) {
                                atk_1_combo3_hit = true;
                            }
                            
                            if (atk_type == ATK_2) {
                                atk_2_chain_hit = true;
                            }
                            
                            if (current_attack_damage >= 1 &&
                                !(opponent.shield && opponent.state != STATE_ATTACK) &&
                                atk_type != ATK_4 && atk_type != ATK_9) {
                                special_move_meter = min(100, special_move_meter + 2);
                            }
                        }
                    }
                    return;
                }
            }
        }
    }
    active_attack_frame = false;
    
    // Reset hit counter flag at the end of the function
    hit_counted_this_frame = false;
}