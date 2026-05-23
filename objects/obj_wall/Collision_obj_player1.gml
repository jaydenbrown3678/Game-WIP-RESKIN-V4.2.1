/// @description Insert description here
// You can write your code in this editor
// Stop player movement on contact
with (other) {
    if (place_meeting(x + hspd, y, obj_wall)) {
        hspd = 0;
    }
    if (place_meeting(x, y + vspd, obj_wall)) {
        vspd = 0;
        landed = true; // Lets players land on top
    }
}