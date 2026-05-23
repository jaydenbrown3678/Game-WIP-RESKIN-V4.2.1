/// @description Insert description here
// You can write your code in this editor
// Check if the menu instance exists before trying to access its variables
if (instance_exists(obj_name_menu)) {
    var _target_x = obj_name_menu.x + obj_name_menu.op_border - 20;
    var _target_y = obj_name_menu.y + obj_name_menu.op_border + (obj_name_menu.op_space * obj_name_menu.pos);

    // Apply smooth movement or snap to position
    x = lerp(x, _target_x, 0.2);
    y = lerp(y, _target_y, 0.2);
}