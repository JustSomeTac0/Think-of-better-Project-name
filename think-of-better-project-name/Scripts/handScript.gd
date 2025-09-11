extends CharacterBody2D
var overOrUnder = get_rotation()



func _process(delta):
	look_at(get_global_mouse_position())

func _physics_process(delta):
	overOrUnder = get_global_rotation_degrees()
	#print(overOrUnder)
	if overOrUnder >= 0:
		show_behind_parent = false
	else:
		show_behind_parent = true
