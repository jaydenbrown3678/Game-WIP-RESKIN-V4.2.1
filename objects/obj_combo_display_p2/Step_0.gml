/// @description Insert description here
// You can write your code in this editor
// In its Step Event:
if (instance_exists(player)) {

    x = player.x + 100;
    y = player.y - 170;

    if (player.combo_active && player.combo_counter > 1) {

        visible = true;

        var new_sprite = combo_sprites[player.combo_counter];

        if (new_sprite != undefined && sprite_index != new_sprite) {
            sprite_index = new_sprite;
            image_index = 0;
        }

    } else {
        visible = false;
    }

}