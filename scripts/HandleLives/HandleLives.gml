// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @function HandleLives()
/// @description Manages lives and respawns players when HP hits 0 (up to 3 lives).
function HandleLives() {
    // Handle player's lives
    if (character_hp <= 0 && lives > 1 && !is_defeated) {
        lives--; // Lose a life
        character_hp = 100; // Refill HP
        // Optional: Play a respawn effect here (without resetting position)
    } else if (character_hp <= 0 && lives == 1) {
        lives = 0;
        is_defeated = true;
        state = STATE_DEATH; // Trigger death state permanently
    }

    // Handle opponent's lives
    if (opp_hp <= 0 && opp_lives > 1 && !opp_is_defeated) {
        opp_lives--; // Opponent loses a life
        opp_hp = 100; // Refill opponent HP
    } else if (opp_hp <= 0 && opp_lives == 1) {
        opp_lives = 0;
        opp_is_defeated = true;
        // Optional: Trigger opponent death state
    }
}