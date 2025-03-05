/// @description Insert description here
// You can write your code in this editor
if instance_number(object_index)>=2 {instance_destroy() exit;}
event_inherited()
if audio_is_playing(bgm_ending)
{
audio_stop_sound(bgm_ending)
}

audio_stop_sound(bgm_introsfx)
audio_stop_sound(bgm_intro)

audio_play_bgm(bgm_intro,false,-12.4)

intro_len=22.29;
total_len=189.63;
loop_len=total_len-intro_len;

audio_sound_set_track_position(bgm,intro_len)

