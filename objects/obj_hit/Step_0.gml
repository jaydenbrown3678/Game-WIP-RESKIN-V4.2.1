/// @description Insert description here
// obj_hit Step Event
x = owner.x + x_offset;
y = owner.y + y_offset;

// Increment and check frame counter
if (++active_frame >= lifetime) {
    instance_destroy();
    exit;
}

// Only check collision on first frame
//if (active_frame == 0) {
    //var opponent = (owner.controller == CONT_P1) ? instance_find(obj_player1, 1) : instance_find(obj_player1, 0);
    