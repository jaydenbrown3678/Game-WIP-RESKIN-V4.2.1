/// @description Insert description here
// You can write your code in this editor
// Create Event
// Create Event
// Store reference to the character that created it
parent_character = other;

// Start from the beginning
image_index = 0;  // Start at frame 0
image_speed = 1;  // Normal animation speed

creator = noone;  // Will be set by the player
damage_value = 5; // Default damage (you can set different values per clone type)
attack_type = ATK_4; // Default attack type
already_hit = false;

hit_frames = [6];  // Frames where hitbox is active (customize per clone)
// Example: [2,4] means frames 2 and 4 will check for hits