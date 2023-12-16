extends Area2D

var SPEED : int = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x += SPEED * delta

func _on_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		queue_free()
