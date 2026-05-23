/// @description Insert description here
// You can write your code in this editor
// Step Event for obj_speffect_clone1
// Step Event for obj_speffect_clone1
if (!already_hit && instance_exists(creator) && instance_exists(creator.opponent)) {
    
    // Check if current frame is in the hit_frames array
    var current_frame = round(image_index);
    var should_check_hit = false;
    
    for (var i = 0; i < array_length_1d(hit_frames); i++) {
        if (current_frame == hit_frames[i]) {
            should_check_hit = true;
            break;
        }
    }
    
    // Only check for collision on specified frames
    if (should_check_hit && place_meeting(x, y, creator.opponent)) {
        // Call the player's effect hit function
        with (creator) {
            EffectHit(other.id, other.damage_value, other.attack_type);
        }
        already_hit = true;
		
	}
}
if (image_index >= image_number - 1) {
    instance_destroy();
}