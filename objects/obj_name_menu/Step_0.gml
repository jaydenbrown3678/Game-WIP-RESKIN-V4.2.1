up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

// Store number of options in menu
op_length = array_length(option[menu_level]);

// Move through menu
pos += down_key - up_key;
if (pos >= op_length) pos = 0;
if (pos < 0) pos = op_length - 1;

// Handle menu selections
if (accept_key) {
    var _sml = menu_level;
    
    switch(menu_level) {
        case 0: // Main menu
            switch(pos) {
                case 0: // FIGHT!
                   room_goto_next();
                    break;
            }
            
        
    
}
}