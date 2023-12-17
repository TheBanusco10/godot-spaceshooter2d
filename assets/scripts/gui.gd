extends CanvasLayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	%Score.text = str(GLOBAL.score)
	%Credits.text = "Credits: " + str(GLOBAL.credits)
