extends AnimatedSprite2D

func _on_player_shield_activated():
	if ! GLOBAL.is_shield_active:
		GLOBAL.is_shield_active = true
		%Shield.play("Shield")
		%ShieldTimer.start(GLOBAL.shield_duration)

func _on_shield_timer_timeout():
	GLOBAL.is_shield_active = false
	%ShieldTimer.stop()
	%Shield.play("Disable")
