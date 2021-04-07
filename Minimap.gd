extends Viewport


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var wallimg = preload("res://textures/miniwall.png")

# Called when the node enters the scene tree for the first time.
func _ready():	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()
	#wallimg.draw(self, Vector2(10, 10))

func _draw():
	wallimg.draw(self, Vector2(10, 10))
	


