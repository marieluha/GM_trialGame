/// @description Insert description here
// You can write your code in this editor

ysp+=0.1
xsp=0


// Handle horizontal movement with smooth acceleration and deceleration
if (keyboard_check(vk_left)) {
    xsp = xsp - move_speed;  // Gradual acceleration to the left
	shoot_dir = 180;
	image_xscale = -1;
}
if (keyboard_check(vk_right)) {
    xsp = xsp + move_speed;  
	shoot_dir = 0;
	image_xscale = 1;
}

// Apply deceleration when no key is pressed
if (!keyboard_check(vk_left) && !keyboard_check(vk_right)) {
    if (xsp > 0) {
        xsp -= move_speed;  // Decelerate to the right
    } else if (xsp < 0) {
        xsp += move_speed;  // Decelerate to the left
    }
}

// Limit the maximum horizontal speed
if (xsp > max_speed) {
    xsp = max_speed;  // Cap speed to max_speed
} else if (xsp < -max_speed) {
    xsp = -max_speed;  // Cap speed to -max_speed
}

// Check for collision with blocks (ground)
if (place_meeting(x, y + 1, oBlock)) {
    ysp = 0  
    if (keyboard_check(vk_up)) {
        ysp = -2 * jump_multiplier 
    }
}

// Check for collision with boots to enable double jump
if (place_meeting(x, y + 1, oBoots)) {
    jump_multiplier = 2  // Double the jump height after getting the boots
    instance_destroy(oBoots);  // Remove boots after being collected
}

// Check for collision with flag to go to the next room
if (place_meeting(x, y + 1, oFlag)) {
    ysp = 0;
	global.level += 1;
	audio_play_sound(level, 1, false);
    room_goto_next();
}

// Check for collision with spikes to restart the room
if (place_meeting(x, y + 1, oSpikes)) {
	global.lives = global.lives - 1;
	room_restart();
	if (global.lives <= 0){
		global.lives = 3;
		global.score = 0;
		global.level = 1;
		audio_play_sound(ded, 1, false);
		room_goto(Room1);
	}  
}

if (place_meeting(x, y + 1, oMonster)) {
    global.lives -= 1;
	room_restart();
	if (global.lives <= 0){
		global.lives = 3;
		global.score = 0;
		global.level = 1;
		audio_play_sound(ded, 1, false);
		room_goto(Room1);
	}
}



if (place_meeting(x, y + 1, oCun)) {
    hasCun = true;
    instance_destroy(oCun);  
}



// Handle movement and collisions
move_and_collide(xsp, ysp, oBlock)



