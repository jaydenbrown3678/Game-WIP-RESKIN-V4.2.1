// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// Consolidated hearts update function
function UpdateHearts() {
    // Player 1 hearts
    if (instance_exists(obj_player1_hearts)) {
        var target_sprite = player1_hearts0; // Default to 0
        
        if (lives == 1) target_sprite = player1_hearts1;
        else if (lives == 2) target_sprite = player1_hearts2;
        else if (lives == 3) target_sprite = player1_hearts3;
        
        if (obj_player1_hearts.sprite_index != target_sprite) {
            obj_player1_hearts.sprite_index = target_sprite;
        }
    }
    
    // Player 2 hearts
    if (instance_exists(obj_player2_hearts)) {
        var target_sprite = player2_hearts0; // Default to 0
        
        if (opp_lives == 1) target_sprite = player2_hearts1;
        else if (opp_lives == 2) target_sprite = player2_hearts2;
        else if (opp_lives == 3) target_sprite = player2_hearts3;
        
        if (obj_player2_hearts.sprite_index != target_sprite) {
            obj_player2_hearts.sprite_index = target_sprite;
        }
    }
}