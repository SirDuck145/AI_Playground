extends Node2D

var hunger = 0
var maxHunger = 15
var sight = 3
var currentTile = null
# Position 1 is the tile, position 2 is how badly it's wanted, postion 3 is how to get there
var interestedTileData = []

func _process(delta):
	if get_tree().get_root().get_node("MainScene/Control").is_holding() == self:
		# Move to the mouse co-ords
		position = get_global_mouse_position()

func set_tile(tile):
	currentTile = tile
func get_tile():
	return currentTile

func set_best_tile(val):
	interestedTileData = val
func get_best_tile():
	return interestedTileData

func get_sight():
	return sight