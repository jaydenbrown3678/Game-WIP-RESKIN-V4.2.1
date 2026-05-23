// Create Event
p1 = noone;
p2 = noone;
base_width = 1024;  // MUST match Room Editor "View in Room" width
base_height = 768;  // MUST match Room Editor "View in Room" height
min_zoom = 1.0;
max_zoom = 2.0;

// Step Event
if (!instance_exists(p1)) p1 = instance_find(obj_player1, 0);
if (!instance_exists(p2)) p2 = instance_find(obj_player1, 1);

if (instance_exists(p1) && instance_exists(p2)) {
    // 1. Calculate position (Room Editor will follow this)
    x = (p1.x + p2.x) / 2;
    y = ((p1.y + p2.y) / 2) - 100;
    
    // 2. Calculate zoom based on distance
    var dist = point_distance(p1.x, p1.y, p2.x, p2.y);
    var zoom = clamp(1.0 + (dist - 100) / 700, min_zoom, max_zoom);
    
    // 3. Apply zoom manually
    view_wview[0] = base_width * zoom;
    view_hview[0] = base_height * zoom;
}