// objMusicManager Create Event
global.musicVolume = 1;
global.masterVolume = 1;

songInstance = noone;
songAsset = noone;
targetSongAsset = noone; 
endFadeOutTime = 0;
StartFadeInTime = 0; 
fadeinInstVol = 1;

// Playlist system
current_playlist = noone;  // Array of songs for current room
current_song_index = 0;     // Current position in playlist
is_playlist_playing = false;

//stopping songs
fadeOutInstances = array_create(0);
fadeOutInstVol = array_create(0);
fadeOutInstTime = array_create(0);