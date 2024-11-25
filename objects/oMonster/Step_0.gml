// Step Event
if (direction == 0) {
    // Move right (0 degrees)
    x += speed;
    
    // Check if the object has traveled the max distance to the right
    if (x - start_position >= max_distance) {
        direction = 180;  // Change direction to left (180 degrees)
    }
} else if (direction == 180) {
    // Move left (180 degrees)
    x -= speed;
    
    // Check if the object has traveled the max distance to the left
    if (start_position - x >= max_distance) {
        direction = 0;  // Change direction to right (0 degrees)
    }
}
