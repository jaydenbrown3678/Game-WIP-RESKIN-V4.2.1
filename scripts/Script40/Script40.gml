// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// Add this function to your project
function UpdateAttackFrames() {
    if (state != STATE_ATTACK) {
        active_attack_frame = false;
        return;
    }
    
    // Get the correct hitbox map based on character
    var hitbox_map = hitbox_frames_fighter;
    if (character == CHAR_SAMURAI) hitbox_map = hitbox_frames_samurai;
    if (character == CHAR_COOK) hitbox_map = hitbox_frames_cook;
    if (character == CHAR_NINJA) hitbox_map = hitbox_frames_ninja;
    
    // Get hitbox data for current attack
    var hitbox_data = ds_map_find_value(hitbox_map, atk_type);
    
    if (!is_array(hitbox_data)) {
        active_attack_frame = false;
        return;
    }
    
    // Check if current frame is in hitbox frames
    active_attack_frame = false;
    for (var i = 0; i < array_length(hitbox_data); i++) {
        var frames = hitbox_data[i].frames;
        for (var j = 0; j < array_length(frames); j++) {
            if (image_index == frames[j]) {
                active_attack_frame = true;
                break;
            }
        }
        if (active_attack_frame) break;
    }
}