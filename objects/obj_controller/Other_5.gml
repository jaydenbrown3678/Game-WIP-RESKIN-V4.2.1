/// @description Insert description here
// You can write your code in this editor
// Destroy camera when room ends
if (variable_instance_exists(view_camera[0], "id")) {
    camera_destroy(view_camera[0]);
}
