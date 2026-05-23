// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EffectHit(effect_id, effect_damage, effect_attack_type) {
    // Store the effect's damage temporarily
    var stored_damage = current_attack_damage;
    var stored_attack = current_attack_type;
    
    // Override with effect's values
    current_attack_damage = effect_damage;
    current_attack_type = effect_attack_type;
    
    // Use existing hit detection logic
    if (instance_exists(opponent) && place_meeting(opponent.x, opponent.y, opponent)) {
        
        // Reset combo flags (from your HitManager)
        atk_1_hit = false;
        atk_2_hit = false;
        atk_3_hit = false;
        atk_1_combo2_hit = false;
        
        // Apply damage to opponent
        with (opponent) {
            if (other.controller == CONT_CPU && controller == CONT_CPU) {
                character_hp -= other.current_attack_damage;
                opp_hp -= other.current_attack_damage;
            } else {
                if (other.controller == CONT_P1) opp_hp -= other.current_attack_damage;
                else character_hp -= other.current_attack_damage;
            }
            
            // Hit state
            state = STATE_HURT;
            
            // Special flag for effects
            was_hit_by_special = true;
        }
        
        // Increase meter (if not a special attack)
        if (effect_attack_type != ATK_4 && effect_attack_type != ATK_9) {
            special_move_meter = min(100, special_move_meter + 2);
        }
    }
    
    // Restore original values
    current_attack_damage = stored_damage;
    current_attack_type = stored_attack;
}