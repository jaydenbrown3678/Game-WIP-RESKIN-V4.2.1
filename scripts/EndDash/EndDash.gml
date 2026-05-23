// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EndDash() {
    // Reset dash variables
    is_dashing = false;
    hspd = 0; // Reset horizontal speed
    state = STATE_FREE; // Return to free state
    sprite_index = sp_idle; // Return to idle sprite
}
