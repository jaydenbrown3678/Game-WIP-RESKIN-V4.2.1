/// @description Insert description here
// You can write your code in this editor
// Draw the current map sprite centered on screen
var draw_x = room_width / 2;
var draw_y = room_height / 2;
draw_sprite_ext(selected_map, 0, draw_x, draw_y, map_scale, map_scale, 0, c_white, 1);

// Optional: Draw selection indicator or instructions
//draw_set_color(c_white);
//draw_text(room_width / 2, room_height - 50, "Press L/J to switch maps, SPACE to confirm");