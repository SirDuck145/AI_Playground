extends Node2D

var mapHeight = 5
var mapWidth = 5
var tileSize = 64
var mapData = []
var grassTile = preload("res://MapTiles/GrassTile/GrassNode.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	build_map_data(mapWidth, mapHeight)

func build_map_data(width, height):
	for h in range(height):
		for w in range(width):
			create_tile(w,h,grassTile, mapWidth)


func create_tile(w, h, type, mapWidth):
	var tile = type.instance()
	mapData.append(tile)
	var tilePos = Vector2(tileSize*w + tileSize/2,tileSize*h + tileSize/2)
	
	if((w==0) && (h==0)):
		pass
	elif((h==0)):
		connect_tiles(tile, mapData[(h*mapWidth) + w-1], "left") #left
	elif((w==0)):
		connect_tiles(tile, mapData[((h-1)*mapWidth)+w], "up") #top
	else:
		connect_tiles(tile, mapData[(h*mapWidth) + w-1], "left")
		connect_tiles(tile, mapData[((h-1)*mapWidth)+w], "up")
	tile.translate(tilePos) 
	add_child(tile)


func connect_tiles(currTile, toConnect, direction):
	if(direction == "left"):
		currTile.set_west(toConnect)
		toConnect.set_east(currTile)
	else:
		currTile.set_north(toConnect)
		toConnect.set_south(currTile)

func get_map_data():
	return mapData



