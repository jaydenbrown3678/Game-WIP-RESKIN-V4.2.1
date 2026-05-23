if (room == rm_name_screen) {
    randomize();
    current_playlist = [opening_track1, opening_track2, opening_track3, opening_track4, opening_track5];
    current_song_index = irandom(array_length(current_playlist) - 1); // Start at random song
    is_playlist_playing = true;
    set_song_ingame(current_playlist[current_song_index], 60, 0);
}

if (room == Room1 || room == rm_sunny_stage) {
    current_playlist = [fighting_track1];  // Single song or multiple
    current_song_index = 0;
    is_playlist_playing = true;
    set_song_ingame(fighting_track1, 60, 10);
}