extends Node

var score : int
var credits : int

# Player movement
var axis : Vector2

# Powers
# Shield
var is_shield_active : bool
var shield_duration : int = 5

func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return axis.normalized()
