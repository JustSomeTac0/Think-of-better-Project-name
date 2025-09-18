extends Node2D


var dashammout 

	
func _ready()-> void:
	$Sprint.material.get_shader_parameter("value") #getting the vaule of the dash bar
	dashammout = $Sprint.material.get_shader_parameter("segments") # getting how mnay seggments their are
	
	
func _physics_process(_delta): #always
	
	if Input.is_action_just_pressed("Dash"): #when shift is pushed
		print(globalShit.dashingvar) #test
		globalShit.dashingvar = globalShit.dashingvar / dashammout #change later
	$Sprint.material.set_shader_parameter("value",globalShit.dashingvar) #setting the bar to the variable which holds the dash numbers
		
	
	if globalShit.dashingvar < 1.0: #if the number is lower then one then add .01 
		globalShit.dashingvar = globalShit.dashingvar + 0.01
	
	
