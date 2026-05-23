/// @description Insert description here
// You can write your code in this editor
// Calculate midpoint between players
// Initialize with null references


var p1 = instance_find(obj_player1, 0); // Player 1
var p2 = instance_find(obj_player1, 1); // Player 2

// Horizontal midpoint (unchanged)
x = (p1.x + p2.x) / 2;

// Vertical position with fixed offset
y = ((p1.y + p2.y) / 2) - 100; // Adjust -100 to move camera higher


    
    