extends Node
 


const ICON_PATH = "res://textures/items/"
const ITEMS = {
	"armor": {
		"icon": ICON_PATH + "sword.png",
		"slot": "CHEST",
		"w": 2,
		"h": 2,
		"strength": 2
	},
	"clothing": {
		"icon": ICON_PATH + "clothing.png",
		"slot": "CHEST",
		"w": 2,
		"h": 2,
		"strength": 1
	},	
	"belt": {
		"icon": ICON_PATH + "belt.png",
		"slot": "BELT",
		"w": 2,		
		"h": 1
	},
	"food": {
		"icon": ICON_PATH + "meatbag.png",
		"slot": "NONE",
		"w": 1,		
		"h": 1
	},
	"error":{
		"icon": ICON_PATH + "error.png",
		"slot": "NONE",
		"w": 1,		
		"h": 1
	}
}
 
func get_item(item_id):
	if item_id in ITEMS:
		return ITEMS[item_id]
	else:
		return ITEMS["error"]