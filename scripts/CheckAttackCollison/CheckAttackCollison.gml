// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// Modified CheckAttackCollision function
function CheckAttackCollision() {
    if (state != STATE_ATTACK) return;
    
    if (active_attack_frame && instance_exists(opponent) && place_meeting(x, y, opponent)) {
        if (!attack_connected) {
            attack_connected = true;
            
            with (opponent) {
                if (state == STATE_FROZEN) state = STATE_FREE;
            }
            
            if (opponent.shield && opponent.state != STATE_ATTACK) {
                with (opponent) sprite_index = sp_shield;
            } else {
                var damage = ds_map_find_value(scr_character_damage(), character)[current_attack_type];
                
                with (opponent) {
                    if (other.controller == CONT_CPU && controller == CONT_CPU) {
                        character_hp -= damage;
                        opp_hp -= damage;
                    } else {
                        if (other.controller == CONT_P1) opp_hp -= damage;
                        else character_hp -= damage;
                    }
                    
                    was_hit_by_special = (other.current_attack_type == ATK_4 || other.current_attack_type == ATK_9);
                    getting_up = false;
                    state = STATE_HURT;
                    
                    // Medium difficulty uses 5-hit cooldown
                    if (global.cpu_difficulty == 1 && other.controller == CONT_CPU) {
                        other.ai_hit_count++;
                        if (other.ai_hit_count >= 5) {
                            other.ai_cooldown = true;
                            other.ai_cooldown_timer = room_speed * 7;
                        }
                    }
                }
            }
        }
    } else {
        attack_connected = false;
    }
}