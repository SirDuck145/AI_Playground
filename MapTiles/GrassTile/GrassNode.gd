extends Node2D

#North, East, South, West
var connected = [null, null, null, null]
var foodSource = 0

func get_north():
	return connected[0]
func get_east():
	return connected[1]
func get_south():
	return connected[2]
func get_west():
	return connected[3]
func get_connections():
	return connected
func get_food():
	return foodSource
func get_position():
	return position

func set_north(north):
	connected[0] = north
func set_east(east):
	connected[1] = east
func set_south(south):
	connected[2] = south
func set_west(west):
	connected[3] = west
func set_food(food):
	foodSource = food

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		var creature = get_tree().get_root().get_node("MainScene/Control").is_holding()
		print(self)
		if creature != null:
			creature.set_tile(self)
			creature.position = self.position
			creature.interestedTileData = [self, -200, []]
			get_tree().get_root().get_node("MainScene/UI/NinePatchRect/BunnySpawner").remove_child(creature)
			get_tree().get_root().get_node("MainScene").add_child(creature)
			get_tree().get_root().get_node("MainScene/Control").set_holding(null)

