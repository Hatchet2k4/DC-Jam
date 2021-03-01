extends GridMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var file = File.new()
	file.open("res://maps/map1.json", file.READ)	
	var data = parse_json(file.get_as_text())
	file.close()
	
	var h = data["height"]
	var w = data["width"]
	var x=0
	var y=0
	var f = -1
	
	print (map_to_world(0, 2, 3))
	
	for l in data["layers"]:
		x=0
		y=0
		for d in l["data"]:
			if d>0:				
				set_cell_item(y-10, f, x-10, d-1)
			x+=1
			if x==w: 
				x=0
				y+=1
		f+=1
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
