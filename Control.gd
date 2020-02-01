extends Node

var timer = 100
var berryBush = preload('res://Food/BerryBush/BerryBush.tscn')
var holdingAnimal = null

func is_holding():
	return holdingAnimal

func set_holding(animal):
	holdingAnimal = animal
	
func _process(delta):
	food_timer()

func food_timer():
	if(timer > 0):
		timer -= 1
	else:
		spawn_food_source(berryBush)
		timer = 350 + randi()%100

func spawn_food_source(source):
	var mapData = get_owner().get_map_data()
	var tileIndex = randi()%mapData.size() #get a random index for my array of tiles
	if mapData[tileIndex].get_food() == 0:
		var food = berryBush.instance()
		mapData[tileIndex].set_food(1)
		food.translate(mapData[tileIndex].position)
		add_child(food)