/// @description Insert description here
// You can write your code in this editor
if instance_number(object_index)>=2 {instance_destroy() exit;}
event_inherited()

audio_play_bgm(bgm_intro,false,-12.4)
audio_play_bgm(bgm_introsfx,false,-17.15)

intro_len=27.24;
total_len=75.24;
loop_len=total_len-intro_len;


