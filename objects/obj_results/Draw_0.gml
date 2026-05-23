/// @description Insert description here
// You can write your code in this editor


var _player1 = instance_find(obj_player1, 0); // Assuming Player 1 is the first instance
var _player2 = instance_find(obj_player1, 1); // Assuming Player 2 is the second instance

var winner = "";

if (_player1.character_hp > _player2.opp_hp) {
        winner = "Player 1";
    } else if (_player2.chracter_hp > _player1.opp_hp) {
        winner = "Player 2";
    } else {
        winner = "Draw";
    }


draw_text(room_width / 2, room_height / 2, "Winner: " + winner);
