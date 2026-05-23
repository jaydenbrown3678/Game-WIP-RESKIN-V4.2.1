// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckFreezeFrame() {
    if (state == STATE_ATTACK && 
        instance_exists(opponent) && 
        opponent.state == STATE_FROZEN) {
        
        // Unfreeze when reaching specified frame
        if (round(image_index) >= unfreeze_on_frame && 
            atk_type == current_freeze_attack) {
            with (opponent) {
                state = STATE_FREE;
            }
            // Reset tracking
            current_freeze_attack = -1;
            unfreeze_on_frame = -1;
        }
    }
}