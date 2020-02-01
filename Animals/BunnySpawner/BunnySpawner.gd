extends Node2D

var bunny = preload("res://Animals/Bunny/Bunny.tscn")

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		if get_tree().get_root().get_node("MainScene/Control").is_holding() == null:
			var animal = bunny.instance()
			#pickup animal
			get_tree().get_root().get_node("MainScene/Control").set_holding(animal)
			get_tree().get_root().get_node("MainScene").add_child(animal)