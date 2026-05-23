/// @description Insert description here
// You can write your code in this editor
// Available maps
maps = [Ocean_background_1, ThousandSunny_background_1, Konoha_background_1, Egghead_background_1];
current_map_index = 0;
selected_map = maps[current_map_index];

// Map display settings
map_scale = 0.25;  // Adjust this to change sprite size
map_width = sprite_get_width(selected_map) * map_scale;
map_height = sprite_get_height(selected_map) * map_scale;
room_switch_timer = 0;