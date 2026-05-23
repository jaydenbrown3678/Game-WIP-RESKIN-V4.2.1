// objMusicManager Step Event
var _finalVol = global.musicVolume * global.masterVolume;

// Check if current song has ended and we have a playlist
if (is_playlist_playing && songInstance != noone && !audio_is_playing(songInstance)) {
    // Move to next song
    current_song_index++;
    
    // Loop back to start if at end
    if (current_song_index >= array_length(current_playlist)) {
        current_song_index = 0;
    }
    
    // Play next song
    targetSongAsset = current_playlist[current_song_index];
    
    // Clear the old song instance so transition happens
    songInstance = noone;
    songAsset = noone;
}

// Play target song
if (songAsset != targetSongAsset) {
    // Tell current song to stop 
    if (audio_is_playing(songInstance)) {
        array_push(fadeOutInstances, songInstance);
        array_push(fadeOutInstVol, fadeinInstVol);
        array_push(fadeOutInstTime, endFadeOutTime);
        
        songInstance = noone; 
        songAsset = noone;
    }
    
    if (array_length(fadeOutInstances) == 0) {
        // Play new song
        if (audio_exists(targetSongAsset)) {
            songInstance = audio_play_sound(targetSongAsset, 4, false);
            audio_sound_gain(songInstance, 0, 0);
            fadeInInstVol = 0;
        }
        songAsset = targetSongAsset;
    }
}

// Handle fade in
if (audio_is_playing(songInstance)) {
    if (StartFadeInTime > 0) {
        if (fadeInInstVol < 1) {
            fadeInInstVol += 1 / StartFadeInTime;
        }
    } else {
        fadeInInstVol = 1;
    }
    audio_sound_gain(songInstance, fadeInInstVol * global.musicVolume, 0);
}

// Handle fade out for old instances
for (var i = 0; i < array_length(fadeOutInstances); i++) {
    if (fadeOutInstances[i] > 0) {
        if (fadeOutInstVol[i] > 0) {
            fadeOutInstVol[i] -= 1 / fadeOutInstTime[i];
        }
    } else {
        fadeOutInstVol[i] = 0;
    }
    
    audio_sound_gain(fadeOutInstances[i], fadeOutInstVol[i] * _finalVol, 0);
    
    if (fadeOutInstVol[i] <= 0) {
        if (audio_is_playing(fadeOutInstances[i])) {
            audio_stop_sound(fadeOutInstances[i]);
        }
        array_delete(fadeOutInstances, i, 1);
        array_delete(fadeOutInstVol, i, 1);
        array_delete(fadeOutInstTime, i, 1);
        i--;
    }
}