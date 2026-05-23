// obj_title Step Event
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

// Store number of options in current menu
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
                case 0: // Player vs Player
                    global.game_mode = GAME_MODE.PVP;
                    room_goto_next(); // Go directly to character select
                    break;
                case 1: // Player vs CPU
                    global.game_mode = GAME_MODE.PVC;
                    menu_level = 6; // Go to difficulty select
                    break;
                case 2: // CPU vs CPU
                    global.game_mode = GAME_MODE.CVC;
                    menu_level = 7; // Go to difficulty select
                    break;
                case 3: // Settings
                    menu_level = 4;
                    break;
                case 4: // Quit Game
                    game_end();
                    break;
            }
            break;
            
        case 4: // Settings menu
            switch(pos) {
                case 0: // Window Size
                    break;
                case 1: // Brightness
                    break;
                case 2: // Controls
                    menu_level = 5;
                    break;
                case 3: // Back
                    menu_level = 0;
                    break;
            }
            break;
            
        case 5: // Controls menu
            if (pos == 4) menu_level = 4; // Back from controls
            break;
            
        case 6: // PVC Difficulty Select
            switch(pos) {
                case 0: // Easy
                    global.cpu_difficulty = 0;
                    room_goto_next(); // Go to character select
                    break;
                case 1: // Medium
                    global.cpu_difficulty = 1;
                    room_goto_next(); // Go to character select
                    break;
                case 2: // Hard
                    global.cpu_difficulty = 2;
                    room_goto_next(); // Go to character select
                    break;
                case 3: // Back
                    menu_level = 0;
                    break;
            }
            break;
            
        case 7: // CVC Difficulty Select
            switch(pos) {
                case 0: // Easy
                    global.cpu_difficulty = 0;
                    room_goto_next(); // Go to character select
                    break;
                case 1: // Medium
                    global.cpu_difficulty = 1;
                    room_goto_next(); // Go to character select
                    break;
                case 2: // Hard
                    global.cpu_difficulty = 2;
                    room_goto_next(); // Go to character select
                    break;
                case 3: // Back
                    menu_level = 0;
                    break;
            }
            break;
    }
    
    if (_sml != menu_level) pos = 0;
    op_length = array_length(option[menu_level]);
}