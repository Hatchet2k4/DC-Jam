extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var skelly = preload("res://objects/Skelly.tscn")
	var grid = get_node("GridMap_Walls")
	
	var file = File.new()
	file.open("res://maps/map1.json", file.READ)	
	var data = parse_json(file.get_as_text())
	file.close()
	
	var h = data["height"]
	var w = data["width"]
	var x=0
	var y=0
	var f = -1
	
	#print (map_to_world(0, 2, 3))
	
	#var s = skelly.instance()
	#s.translate(Vector3(3, 0, 31))
	#world.add_child(s)
	
	for l in data["layers"]:
		x=0
		y=0
		if l["name"].begins_with("Floor"):
			for d in l["data"]:
				if d>0:				
					grid.set_cell_item(x, f, y, d-1)
				x+=1
				if x==w: 
					x=0
					y+=1
			f+=1
		else: #objects
			for o in l["objects"]:
				if o["type"] == "Skelly":
					var s = skelly.instance()
					s.translate(Vector3(o["x"]/16, 0.5, o["y"]/16))										
					add_child(s)					
				elif o["type"] == "Start":
					$Player.translate(Vector3(-o["x"]/16, 0, -o["y"]/16))
					
					


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
