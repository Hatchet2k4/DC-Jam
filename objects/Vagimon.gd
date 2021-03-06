extends Entity

var ticks = randi() % 45
var textures = []

var frame = 0



func _ready():
	textures = [
				 [preload("res://textures/vagimon96/vagimon_f1.png"), preload("res://textures/vagimon96/vagimon_f2.png")], 
				 [preload("res://textures/vagimon96/vagimon_l1.png"), preload("res://textures/vagimon96/vagimon_l2.png")], 
				 [preload("res://textures/vagimon96/vagimon_b1.png"), preload("res://textures/vagimon96/vagimon_b2.png")],  
				 [preload("res://textures/vagimon96/vagimon_r1.png"), preload("res://textures/vagimon96/vagimon_r2.png")] 				 
			   ]


func _process(delta):
	
	$Spatial.look_at(Vector3(Globals.player.global_transform.origin.x, global_transform.origin.y ,Globals.player.global_transform.origin.z), Globals.UP)
	calc_facing()
	snap_to_grid()
	#$MeshInstance.rotation_degrees.y += 180
	var d_frame = round($Spatial.rotation_degrees.y / 90)
	if d_frame>=4: d_frame=0
	ticks+=1
	
	if ticks == 60:
		ticks = 0
		frame+=1
		if frame > 1: 
			frame=0
		
		print ( str(distance_to_player()) )
	apply_texture($MeshInstance, textures[d_frame][frame])
	
	
		
		
func distance_to_player():
	return global_transform.origin.distance_to(Globals.player.global_transform.origin)

func apply_texture(mesh_instance_node, texture):
	#var txt = texture.duplicate()
	if mesh_instance_node.material_override:
		mesh_instance_node.material_override.albedo_texture = texture
		


