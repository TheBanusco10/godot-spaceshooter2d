extends Node2D

@export var enemy : PackedScene

var random_spawn_time : RandomNumberGenerator = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	GLOBAL.score = 0
	GLOBAL.credits = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_parallax_bg(delta)
	
	$EnemySpawn/PathFollow2D.set_progress($EnemySpawn/PathFollow2D.get_progress() + random_spawn_time.randi_range(10, 80) * delta)
	
func move_parallax_bg(delta):
	$Background/Back.scroll_base_offset -= Vector2(1, 0) * 8 * delta
	$Background/Stars.scroll_base_offset -= Vector2(1, 0) * 16 * delta
	$Background/Planet_1.scroll_base_offset -= Vector2(1, 0) * 24 * delta
	$Background/Planet_2.scroll_base_offset -= Vector2(1, 0) * 24 * delta


func _on_timer_timeout():
	var enemyInstance = enemy.instantiate()
	enemyInstance.global_position = $EnemySpawn/PathFollow2D.global_position
	add_child(enemyInstance)
