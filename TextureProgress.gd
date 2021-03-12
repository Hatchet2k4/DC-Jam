extends TextureProgress


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func decrement():
	value -=10
	if value<=0: value=100
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#value-=0.5
	#if value<=0: value=100
	tint_progress.a8=155+(value)
