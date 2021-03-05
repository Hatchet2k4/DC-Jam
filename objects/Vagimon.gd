extends Entity

var ticks = randi() % 45
var textures = []

var frame = 0



func _ready():
	textures = [preload("res://textures/vagimon96/vagimon_f1.png"), preload("res://textures/vagimon96/vagimon_f2.png")]


func _process(delta):
	ticks+=1
	if ticks == 60:
		ticks = 0
		frame+=1
		if frame > 1: frame=0
		apply_texture($MeshInstance, textures[frame])
		print (str(frame))

func apply_texture(mesh_instance_node, texture):
	var txt = texture.duplicate()
	if mesh_instance_node.material_override:
		mesh_instance_node.material_override.albedo_texture = txt
		


