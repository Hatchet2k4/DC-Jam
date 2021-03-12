extends Entity

var angle = 0
var moving_direction=0
var facing_direction = Vector3(0,0,0)

const MOVEDIST = 120

var moving = false
var turning = false
var ticks = 0
var turndirection = 0

var movestring=""

var curposition = Vector3(0,0,0)

onready var wheel = get_tree().get_root().find_node("TimeWheel", true, false)

func _ready():
	data.hp=20
	data.damage=2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#moveDirection = Vector3(0,0,0)
	angle = get_rotation().y   
	var lbl = get_parent().get_node("debug")

	#var local_direction = get_rotation().rotated(Vector3(0,1,0), rotation.y)
	if not moving and not turning: 
		if Input.is_action_just_pressed("move_up"):
			plrMove("MoveUp")
		elif Input.is_action_just_pressed("move_down"):
			plrMove("MoveDown")
		elif Input.is_action_just_pressed("move_left"):
			plrMove("MoveLeft")
		elif Input.is_action_just_pressed("move_right"):
			plrMove("MoveRight")		
		elif Input.is_action_just_pressed("turn_left"):
			plrMove("TurnLeft")			
		elif Input.is_action_just_pressed("turn_right"):
			plrMove("TurnRight")
	
	else:
		if moving:
			var c = move_and_slide(moving_direction * -10)
			print (c.length())
			if c.length() < 0.1: #hack			
				plrMove("Stop")				
				snap_to_grid()
				ticks = 0
			else:
				ticks-=5
				if ticks <=0 or (translation - curposition).length() >=2.0:
					plrMove("Stop")
					snap_to_grid()	
					curposition = translation
		elif turning:			
			rotate_y(PI/24 * turndirection)
			
			ticks-=5
			calc_facing()
			if ticks <=0:
				plrMove("Stop")
				snap_to_grid()
				
	lbl.text = str( translation )  + "\n" + str(get_rotation().y) + "\n" + "facing: " + str(facing)

func canMove(direction):
	if direction in ["TurnLeft", "TurnRight"]: 
		return true	
	
	
	return true
	
	var space_state = get_world().direct_space_state
	var d = -global_transform.basis.z.normalized() * 2
	
	if direction=="MoveUp":
		pass
	elif direction == "MoveDown":
		d = d.rotated(Globals.UP, PI)
	elif direction == "MoveLeft":
		d = d.rotated(Globals.UP, PI/2)
	elif direction == "MoveRight":
		d = d.rotated(Globals.UP, -PI/2)
	
	var result = space_state.intersect_ray(global_transform.origin, global_transform.origin + d)
	if result:
		return false
	else:
		return true

func plrMove(direction):	
	if direction == "Stop":
		var btn:Button = get_tree().get_root().find_node("Button"+movestring, true, false)
		btn.modulate.a=0
		moving = false
		turning = false		
		ticks=0
	else:
		var m = canMove(direction)
		print(m)
		if not moving and not turning and m: 
			
			movestring=direction
			var btn:Button = get_tree().get_root().find_node("Button"+movestring, true, false)
			btn.modulate.a=60
			
			if direction in ["TurnLeft", "TurnRight"]:
				turning=true
				ticks = 60
				if direction == "TurnLeft":
					turndirection = 1
				elif direction == "TurnRight":
					turndirection = -1
			else:
				moving = true
				ticks = 60
				wheel.decrement()
				curposition = translation
				moving_direction = get_transform().basis.x
				if direction == "MoveUp":
					pass				
				elif direction == "MoveDown":
					moving_direction = moving_direction.rotated(Globals.UP, PI)
				elif direction == "MoveLeft":				
					moving_direction = moving_direction.rotated(Globals.UP, PI/2)
				elif direction == "MoveRight":				
					moving_direction = moving_direction.rotated(Globals.UP, -PI/2)


func _on_ButtonTurnLeft_pressed():
	plrMove("TurnLeft")

func _on_ButtonTurnRight_pressed():
	plrMove("TurnRight")

func _on_ButtonMoveUp_pressed():
	plrMove("MoveUp")

func _on_ButtonMoveDown_pressed():
	plrMove("MoveDown")

func _on_ButtonMoveLeft_pressed():
	plrMove("MoveLeft")

func _on_ButtonMoveRight_pressed():
	plrMove("MoveRight")



