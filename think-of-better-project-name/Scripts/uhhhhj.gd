extends CharacterBody2D

@export var speed = 400



func get_input():
	var input_direction = Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown") #Get all of the directons
	velocity = input_direction * speed #make Velocity
	if Input.is_key_pressed(KEY_D): #Checking for key press asdw
		$PlayerSprite.flip_h = true #flipping the sprite
		$PlayerSprite/PlaceholderCharaterPlayer.play("Walkingtest") #playing walking animation
	elif Input.is_key_pressed(KEY_A):
		$PlayerSprite.flip_h = false
		$PlayerSprite/PlaceholderCharaterPlayer.play("Walkingtest")
	elif Input.is_key_pressed(KEY_S):
		$PlayerSprite.flip_h = false
		$PlayerSprite/PlaceholderCharaterPlayer.play("Walkingtest")
	elif Input.is_key_pressed(KEY_W):
		$PlayerSprite.flip_h = false
		$PlayerSprite/PlaceholderCharaterPlayer.play("Walkingtest")
	else: #when no key is pressed
		$PlayerSprite.flip_h = false 
		$PlayerSprite/PlaceholderCharaterPlayer.stop()
func _physics_process(delta): #physics
	get_input()
	move_and_slide()
	
	
