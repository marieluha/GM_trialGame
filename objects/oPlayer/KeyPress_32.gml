/// @description Insert description here
// You can write your code in this editor
if (hasCun = true){
var bullet = instance_create_layer(x, y, "Instances", oBullet);
audio_play_sound(shot, 1, false);
}

if (image_xscale == 1 && hasCun) {
        bullet.direction = shoot_dir; // Facing right
    } else if (image_xscale == -1 && hasCun) {
        bullet.direction = shoot_dir; // Facing left
        
    }