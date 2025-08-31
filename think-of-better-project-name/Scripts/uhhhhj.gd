extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown")
	velocity = input_direction * speed
	if Input.is_key_pressed(KEY_D):
		$PlayerSprite.flip_h = true
		$PlayerSprite/PlaceholderCharaterPlayer.play("Walkingtest")
	elif Input.is_key_pressed(KEY_A):
		$PlayerSprite.flip_h = false
		$PlayerSprite/PlaceholderCharaterPlayer.play("Walkingtest")
	elif Input.is_key_pressed(KEY_S):
		$PlayerSprite.flip_h = false
		$PlayerSprite/PlaceholderCharaterPlayer.play("Walkingtest")
	elif Input.is_key_pressed(KEY_W):
		$PlayerSprite.flip_h = false
		$PlayerSprite/PlaceholderCharaterPlayer.play("Walkingtest")
	else: 
		$PlayerSprite.flip_h = false 
		$PlayerSprite/PlaceholderCharaterPlayer.stop()
func _physics_process(delta):
	get_input()
	move_and_slide()
	
