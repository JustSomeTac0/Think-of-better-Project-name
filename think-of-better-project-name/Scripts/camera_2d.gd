extends Camera2D

var speed = 300
func get_input(delta):
	var input_direction = Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown") #Get all of the directons
	global_translate(input_direction*speed*delta)
