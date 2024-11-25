/// @description Insert description here
// You can write your code in this editor
if (!variable_global_exists("lives")) {
    global.lives = 3; 
}

if (!variable_global_exists("score")) {
    global.score = 0;
}

if (!variable_global_exists("level")) {
    global.level = 1;
}

global.hashat = 0;

 
draw_set_font(Font1);
draw_set_color(c_black);