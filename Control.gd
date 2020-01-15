extends Control

var timer = 100
var berryBush = preload('res://Food/BerryBush.tscn')
func _process(delta):
	if(timer > 0):
		timer -= 1
	else:
		spawn_food_source(berryBush)
		timer = 350 + randi()%100
		
func spawn_food_source(source):
	print('spawning food')
	var mapData = get_owner().get_map_data()
	var tileIndex = randi()%mapData.size() #get a random index for my array of tiles
	if mapData[tileIndex].get_food() == null:
		var food = berryBush.instance()
		mapData[tileIndex].set_food(food)
		food.translate(mapData[tileIndex].position)
		add_child(food)