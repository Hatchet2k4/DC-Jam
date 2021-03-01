extends KinematicBody


#var moveDirection = Vector3(0,0,0)
var angle = 0
var facing_direction=0
const MOVEDIST = 120
#onready var lbl: Label = get_node("/root/DC_Test/Label")  #find_node("TileMap", true, false)
var moving = false
var turning = false
var ticks = 0
var turndirection = 0
var movedirection = 0

func _ready():
	
	pass 


func snap_to_grid():
	translation.x=stepify(translation.x, 1)
	translation.y=stepify(translation.y, 1)
	translation.z=stepify(translation.z, 1)	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#moveDirection = Vector3(0,0,0)
	angle = get_rotation().y   
	var lbl = get_parent().get_node("debug")

	#var local_direction = get_rotation().rotated(Vector3(0,1,0), rotation.y)
	if not moving and not turning: 
		if Input.is_action_just_pressed("ui_up"):
			facing_direction = get_transform().basis.x
			movedirection = 1
			moving = true
			ticks = 60

		elif Input.is_action_just_pressed("ui_down"):
			facing_direction = get_transform().basis.x
			#move_and_slide(facing_direction * MOVEDIST)
			movedirection = -1
			moving = true
			ticks = 60
		
		elif Input.is_action_just_pressed("ui_left"):
			#rotate_y(PI/2)
			turndirection = 1
			
			turning = true
			ticks = 60
			
		elif Input.is_action_just_pressed("ui_right"):
			#rotate_y(-PI/2)
			turndirection = -1
			turning = true
			ticks = 60
	
	else:
		if moving:
			var c = move_and_slide(facing_direction * -10 * movedirection)
			print (c.length())
			if c.length() < 0.1: #hack			
				moving = false
				snap_to_grid()
				ticks = 0
			else:
				ticks-=5
				if ticks <=0:
					moving=false
					snap_to_grid()	
		elif turning:			
			rotate_y(PI/24 * turndirection)
			ticks-=5
			if ticks <=0:
				turning=false
				snap_to_grid()
				
	lbl.text = str( translation )

		
		
