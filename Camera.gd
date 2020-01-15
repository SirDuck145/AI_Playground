extends Camera2D
var startingPos = Vector2(0,0)
var cameraMoveSpeed = 350

func _process(delta):
	var movement = Vector2()
	if Input.is_action_pressed("ui_up"):
		movement.y -= cameraMoveSpeed
	if Input.is_action_pressed("ui_right"):
		movement.x += cameraMoveSpeed
	if Input.is_action_pressed("ui_down"):
		movement.y += cameraMoveSpeed
	if Input.is_action_pressed("ui_left"):
		movement.x -= cameraMoveSpeed
	position += movement.normalized() * cameraMoveSpeed * delta
