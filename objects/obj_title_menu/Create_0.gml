// Menu dimensions
width = 200;
height = 240;
op_border = 8;
op_space = 40;
pos = 0;



// Game mode constants
enum GAME_MODE {
    PVP,
    PVC,
    CVC
}

current_game_mode = GAME_MODE.PVP; // Default to PvP
cpu_difficulty = 1; // Default difficulty (1-3)

// Menu options structure
option[0,0] = "Player vs Player";  // Main menu
option[0,1] = "Player vs CPU";
option[0,2] = "CPU vs CPU";
option[0,3] = "Settings";
option[0,4] = "Quit Game";

option[1,0] = "Player 1: Fighter";  // Character select (PVP)
option[1,1] = "Player 2: Samurai";
option[1,2] = "Fight!";
option[1,3] = "Return";

option[2,0] = "Player: Fighter";    // Character select (PVC)
option[2,1] = "CPU: Samurai";
option[2,2] = "CPU Difficulty: Medium";
option[2,3] = "Fight!";
option[2,4] = "Return";

option[3,0] = "CPU 1: Fighter";     // Character select (CVC)
option[3,1] = "CPU 2: Samurai";
option[3,2] = "CPU Difficulty: Medium";
option[3,3] = "Fight!";
option[3,4] = "Return";

option[4,0] = "Window Size";        // Settings menu (unchanged)
option[4,1] = "Brightness";
option[4,2] = "Controls";
option[4,3] = "Back";

option[5,0] = "Player 1";           // Controls menu (unchanged)
option[5,1] = "W - Jump";
option[5,2] = "A - Backward";
option[5,3] = "D - Forward";
option[5,4] = "S - Block";
option[5,5] = "Player 2";
option[5,6] = "^ - Jump";
option[5,7] = "< - Forward";
option[5,8] = "> - Backward";
option[5,9] = "{ - Block";

// Add these to your existing option arrays:
option[6,0] = "Easy";           // PVC Difficulty menu
option[6,1] = "Medium";
option[6,2] = "Hard";
option[6,3] = "Back";

option[7,0] = "Easy";           // CVC Difficulty menu
option[7,1] = "Medium";
option[7,2] = "Hard";
option[7,3] = "Back";

// Character data
op_length = 0;
menu_level = 0;
selected_characters = [CHAR_FIGHTER, CHAR_SAMURAI]; // Default selections
char_names = ["Fighter", "Samurai", "Cook"];
difficulty_names = ["Easy", "Medium", "Hard"];

