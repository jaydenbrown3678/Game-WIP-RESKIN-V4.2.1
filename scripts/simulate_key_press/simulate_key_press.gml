// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function simulate_key_press(key, press) {
    if (press) {
        // Simulate key press
        if (key == (controller == CONT_P1 ? ord("D") : vk_right)) right = true;
        if (key == (controller == CONT_P1 ? ord("A") : vk_left)) left = true;
        if (key == (controller == CONT_P1 ? ord("W") : vk_up)) up = true;
        if (key == (controller == CONT_P1 ? ord("S") : vk_down)) down = true;
        // Add other keys as needed
    } else {
        // Simulate key release
        if (key == (controller == CONT_P1 ? ord("D") : vk_right)) right = false;
        if (key == (controller == CONT_P1 ? ord("A") : vk_left)) left = false;
        if (key == (controller == CONT_P1 ? ord("W") : vk_up)) up = false;
        if (key == (controller == CONT_P1 ? ord("S") : vk_down)) down = false;
    }
}