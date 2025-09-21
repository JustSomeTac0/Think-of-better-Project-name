extends Node2D


var dashammout 
var start
var rng = RandomNumberGenerator.new() #making random numbers
	
func _ready()-> void: #make sure to call this when I satrt making items to update stuff or make a new function that gets called for the start and when this stuff needs to update
	$Sprint.material.get_shader_parameter("value") #getting the vaule of the dash bar
	dashammout = $Sprint.material.get_shader_parameter("segments") # getting how mnay seggments their are
	start = float($Sprint.material.get_shader_parameter("progress_rotation"))
	$Sprint.material.set_shader_parameter("progress_rotation",(float(1) /dashammout))
	var seedbar = rng.randf_range(0, 100.0) #random seed for dash
	var seedbarS = rng.randf_range(0, 9.0) # random amount of displacement for bar
	$Sprint.material.get_shader_parameter("seed") # getting all of the matrieals and setting them based of of difrent shit
	$Sprint.material.set_shader_parameter("seed",seedbar)
	$Sprint.material.get_shader_parameter("intensityX")
	$Sprint.material.get_shader_parameter("intensityY")
	$Sprint.material.set_shader_parameter("intensityX",seedbarS + 1)
	$Sprint.material.set_shader_parameter("intensityY",seedbarS)
	
func _physics_process(_delta): #always
	
	
	if Input.is_action_just_pressed("Dash"): #when shift is pushed
		print(globalShit.dashingvar) #test
		print(dashammout) #testwww
		#print(globalShit.removeamount) #test
		globalShit.dashingvar = globalShit.dashingvar - (1.2 * (float(1) / dashammout)) #change later
	$Sprint.material.set_shader_parameter("value",globalShit.dashingvar) #setting the bar to the variable which holds the dash numbers
		
	
	if globalShit.dashingvar < 1.0: #if the number is lower then one then add .01 
		globalShit.dashingvar = globalShit.dashingvar + (float(0.015)/dashammout)
	
	
