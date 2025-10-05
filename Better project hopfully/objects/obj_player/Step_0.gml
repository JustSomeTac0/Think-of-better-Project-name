var xMove = keyboard_check(ord("D")) - keyboard_check(ord("A"))
var yMove = keyboard_check(ord("S")) - keyboard_check(ord("W"))

if (xMove != 0 ||yMove != 0){ //
 // put moving animation here
} else{
 // put idle animation here
}


x += xMove * playerSpeed;
y += yMove * playerSpeed;


cool--;

if(cool <= 0 &&  mouse_check_button(mb_left)) {
	cool = coolVaule
	with (instance_create_layer(x, y, "yourFiredShit", obj_placeholderWeponBullet)) {
		direction = obj_wepon.image_angle
		speed = 8
	}
}