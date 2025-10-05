direction = point_direction(x, y, obj_player.x, obj_player.y );
speed = random_range(1 , 3);

if (direction > 90 && direction < 270) {
	image_xscale = -1/2;
} else {
	image_xscale = 1/2;
}