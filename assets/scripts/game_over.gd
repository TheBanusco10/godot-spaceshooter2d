extends Control

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
