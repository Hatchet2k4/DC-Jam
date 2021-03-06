extends Node


const NORTH = 0
const EAST = 1
const SOUTH = 2
const WEST = 3

const UP = Vector3(0,1,0)
const DOWN = Vector3(0,-1,0)

const directions = ["NORTH", "EAST", "SOUTH", "WEST"]
#access as [player facing][entity facing]
const dirtable = [[0, 1, 2, 3], #player facing north
			[3, 0, 1, 2], #east
			[2, 3, 0, 1], #south
			[1, 2, 3, 0]] #west

const A_NORTH = 0
const A_NORTHEAST = PI/4
const A_EAST = PI/2
const A_SOUTHEAST = PI/2 + PI/4
const A_SOUTH = PI
const A_SOUTHWEST = PI + PI/4
const A_WEST = PI + PI/2
const A_NORTHWEST = PI*2 - PI/4

onready var player = find_node("Player", true, false)

func _ready():
	player = get_tree().get_root().find_node("Player", true, false)
	print ("Globals loaded")
	

