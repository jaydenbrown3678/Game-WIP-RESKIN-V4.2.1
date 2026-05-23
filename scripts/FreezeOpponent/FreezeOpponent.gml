// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FreezeOpponent(attack_type = -1, require_special = false) { // Removed duration parameter
    if (!instance_exists(opponent)) return false;
    if (state != STATE_ATTACK) return false;
    
    if (attack_type != -1 && current_attack_type != attack_type) return false;
    if (require_special && !special_move_ready) return false;
    
    with (opponent) {
        frozen_sprite = sprite_index;
        frozen_image_index = image_index;
        state = STATE_FROZEN;
        // Removed timer assignment
    }
    return true;
}