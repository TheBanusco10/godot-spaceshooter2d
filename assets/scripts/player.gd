extends CharacterBody2D
class_name Player

@export var shot : PackedScene

@onready var screensize = get_viewport_rect().size

const SPEED = 100

func _process(_delta):
	sprite_control()
	player_movement()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		shoot_control()

func sprite_control() -> void:
	var currentAxis : Vector2 = GLOBAL.get_axis()
	
	if currentAxis.y > 0:
		$Spaceship.animation = "Up"
	elif currentAxis.y < 0:
		$Spaceship.animation = "Down"
	else:
		$Spaceship.animation = "Idle"

func player_movement() -> void:
	velocity.x = GLOBAL.get_axis().x * SPEED
	velocity.y = GLOBAL.get_axis().y * -SPEED
	
	move_and_slide()
	
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)

func shoot_control() -> void:
	$Flash.play()
	$Settings/AudioShot.play()
	
	var shotInstance = shot.instantiate()
	shotInstance.global_position = $Settings/ShootSpawn.global_position
	# add_child(shotInstance) Adding child to the Player scene
	get_tree().call_group("Level", "add_child", shotInstance)
