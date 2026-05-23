var width = room_width/2;
draw_set_font(global.font_main) // Sets the font for subsequent text drawing
draw_set_halign(fa_center) // Aligns text to center horizontally
//draw_set_color(c_green) // Sets the drawing color to green
draw_text_transformed(width/2 +1550, 50, "Character Select", 2.5, 2.5, 0); // Draws title at top center

// RESET ALIGNMENT FOR OTHER ELEMENTS
draw_set_halign(fa_left); // Reset text alignment to left for other elements

draw_sprite_ext(ports[p1_index], p1_frame, 330, 235, 1.5, 1.5, 0, c_white, 1);
draw_sprite_ext(ports[p2_index], p2_frame, 3450, 255, -1.5, 1.5, 0, c_white, 1);
// Update animation timer
animation_timer += 1;

// Advance frames when timer reaches threshold
if (animation_timer >= (1.5 / animation_speed)) {
    p1_frame = (p1_frame + 1) % sprite_get_number(ports[p1_index]);
    p2_frame = (p2_frame + 1) % sprite_get_number(ports[p2_index]);
    animation_timer = 0;
} 
// Draw character selection icons
for (var i =0; i < MAX_CHARS; i++) {
    // DRAW RECTANGLE FIRST (background)
    //draw_set_color(c_black) // Sets rectangle color to black
    //draw_rectangle(128+90, 300, 128+225*i+400, 300+225, false) // Selection box background
    
    // THEN DRAW ICON ON TOP
    draw_sprite(icons[i], 0, 75+385*i, 1420); // Character icon
    
    // Highlight P1's current selection
    if i = p1_index {
        draw_set_color(c_red) // Sets text color to red
        draw_text_transformed(75+385*i+95, 1235, "P1", 2.5, 2.5, 0) // Draws "P1" label
        draw_set_color(c_white) // Resets to white
    }

    // Highlight P2's current selection  
    if i = p2_index {
        draw_set_color(c_aqua) // Sets text color to blue
        draw_text_transformed(75+385*i+95, 1235, "P2", 2.5, 2.5, 0); // Draws "P2" label
        draw_set_color(c_white) // Resets to white
    }
	
	// Draw character name for P1's current selection
if i = p1_index {
    draw_set_halign(fa_center); // Center the text
    draw_text_transformed(125+385, 1060, names[p1_index], 3.0, 3.0, 0); // Adjust Y coordinate as needed
    draw_set_halign(fa_left); // Reset alignment
}

if i = p2_index {
    draw_set_halign(fa_center); // Center the text
    draw_text_transformed(95+3105, 1060, names[p2_index], 3, 3, 0); // Adjust Y coordinate as needed
    draw_set_halign(fa_left); // Reset alignment
}

// Display ready message when both players have selected
if p1_ready and p2_ready {
    draw_set_halign(fa_center); // Re-center for the "GET READY" message
    draw_text_transformed(width/2 +1550, 500, "Choose Map",  2.5, 2.5, 0) // "GET READY" text below title
    draw_set_halign(fa_left) // Final alignment reset
}
}