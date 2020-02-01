extends Timer

var currentTileVal = 0
var parent = get_parent()
var pathToScout = []
# Called when the node enters the scene tree for the first time.
func _process(delta):
	if !is_stopped():
		take_action()

func take_action():
	for tile in get_parent().currentTile.get_connections():
		scout_tile(get_parent().get_sight(), tile)
		if(parent.currentTile == parent.interestedTileData[0]): ###THIS IS THE ISSUE
			pass
		else:
			parent.currentTile = parent.interestedTileData[2].pop_front()
	self.position = get_parent().currentTile.position

func scout_tile(sight, tile):
	if sight == 0 || tile == null:
		pathToScout = []
		return
	#keeps track of current path
	pathToScout.append(tile)
	#calculate if the current tile is the new interested tile
	var pathWeight = len(pathToScout) #make this the length of the path
	var foodWeight = tile.get_food()*parent.hunger - pathWeight
	var roamWeight = (parent.hunger)*pathWeight
	var tileWantWeight = foodWeight + roamWeight
	if parent.interestedTileData[1] < tileWantWeight:
		become_interested(tile, tileWantWeight, pathToScout)
	if parent.interestedTileData[1] == tileWantWeight:
		if(randi()%2 == 1):
			become_interested(tile, tileWantWeight, pathToScout)
	#Scout the remaining tiles
	for tiles in tile.get_connections():
		scout_tile(sight-1, tiles)

func become_interested(tile, want, path):
	parent.interestedTileData[0] = tile
	parent.interestedTileData[1] = want
	parent.interestedTileData[2] = path