extends Node2D

var SPEED : int = 80

var is_defeated : bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ! is_defeated:
		enemy_movement(delta)

func explosion_control() -> void:
	is_defeated = true
	$Area2D.queue_free()
	$Explosion.play()
	$Explosion/AudioStreamPlayer.play()

func enemy_movement(delta) -> void:
	global_position.x -= SPEED * delta

func _on_area_entered(area):
	if area.is_in_group("Shot"):
		explosion_control()
		area.queue_free()
		GLOBAL.score += 100

func _on_body_entered(body):
	if body is Player:
		explosion_control()
		
		if ! GLOBAL.is_shield_active:
			GLOBAL.credits -= 1
			
			if GLOBAL.credits <= 0:
				body.queue_free()

func _on_screen_exited():
	queue_free()

func _on_audio_stream_player_finished():
	queue_free()
	
	if GLOBAL.credits <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
