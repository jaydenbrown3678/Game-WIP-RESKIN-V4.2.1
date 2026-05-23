/// @description Insert description here
// You can write your code in this editor
// Switch maps with L and J keys
// Find character select object to check ready status
var char_select = instance_find(obj_char_select, 0);

// Only process input if both players are ready
if (char_select != noone && char_select.p1_ready && char_select.p2_ready) {
    // Switch maps with L and J keys
    if (keyboard_check_pressed(ord("L"))) {
        current_map_index = (current_map_index + 1) % array_length(maps);
        selected_map = maps[current_map_index];
        // Update dimensions
        map_width = sprite_get_width(selected_map) * map_scale;
        map_height = sprite_get_height(selected_map) * map_scale;
    }

    if (keyboard_check_pressed(ord("J"))) {
        current_map_index = (current_map_index - 1 + array_length(maps)) % array_length(maps);
        selected_map = maps[current_map_index];
        // Update dimensions
        map_width = sprite_get_width(selected_map) * map_scale;
        map_height = sprite_get_height(selected_map) * map_scale;
    }

    // Confirm selection with spacebar and go to selected room
if (keyboard_check_pressed(vk_space)) {
    // Store the selected map for the game
    global.selected_map = selected_map;
    
    // Go to the room based on selected map index
    if (current_map_index == 0) { // Ocean_background is first in array
        room_goto(Room1);
    } else if (current_map_index == 1) { // ThousandSunny_background is second
        room_goto(rm_sunny_stage);
    }else if (current_map_index == 2) { // ThousandSunny_background is second
        room_goto(rm_konoha_stage);
    }
	else if (current_map_index == 3) { // ThousandSunny_background is second
        room_goto(rm_egghead_stage);
    }
}
}