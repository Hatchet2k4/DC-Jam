extends KinematicBody

class_name Entity, "res://objects/entity.svg"

var facing = 0

func calc_facing():
	var angle = get_rotation().y
	
	if angle < 0: angle += (PI*2)
	else:
		while angle > PI*2:
			angle -= PI*2
	
	if (angle >= Globals.A_NORTH and angle < Globals.A_NORTHEAST) or (angle <= PI*2 and angle >= Globals.A_NORTHWEST):
		facing = Globals.NORTH
	elif angle >= Globals.A_NORTHEAST and angle < Globals.A_SOUTHEAST:
		facing = Globals.EAST
	elif angle >= Globals.A_SOUTHEAST and angle < Globals.A_SOUTHWEST:
		facing = Globals.SOUTH
	elif angle >= Globals.A_SOUTHWEST and angle < Globals.A_NORTHWEST:
		facing = Globals.WEST		

func snap_to_grid():
	translation.x=stepify(translation.x, 1)
	translation.y=stepify(translation.y, 1)
	translation.z=stepify(translation.z, 1)
	rotation.y=stepify(rotation.y, PI/4)

func _ready():
	#var this = Entity
	calc_facing()
	snap_to_grid()


	
