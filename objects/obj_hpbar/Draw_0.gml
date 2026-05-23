/// @description Insert description here
// You can write your code in this editor

var player1 = instance_find(obj_player1, 0); // Assuming Player 1 is the first instance
var player2 = instance_find(obj_player1, 1); // Assuming Player 2 is the second instance

//var name1 = "Fighter";
//var name2 = "Samurai";

var name1_x = x + 20;
var name1_y = y - 70;

var name2_x = x + 480;
var name2_y = y - 70;

 // Use your font resource
draw_set_color(c_white);    // Set text color






// Draw health bar for Player 1
if (player1 != noone) {
    draw_healthbar(x - 50, y - 8, x + 200, y + 13, player1.character_hp, c_dkgray, c_red, c_lime, 0, true, true);
	//draw_text(name1_x,name1_y,name1)
}

// Draw health bar for Player 2
if (player2 != noone) {
    draw_healthbar(x + 310, y - 8 , x + 555, y + 13, player2.opp_hp, c_dkgray, c_red, c_lime, 1, true, true);
	//draw_text(name2_x,name2_y,name2)
}






/*
var p1_hpbar = draw_healthbar(x,y,x+100,y+10,obj_player.hp, c_dkgray, c_red, c_lime, 0, true, true);

var p2_hpbar = draw_healthbar(x+400,y,x+500,y+10, obj_player.hp, c_dkgray, c_red, c_lime, 1, true, true);
*/

