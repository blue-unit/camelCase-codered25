extends TouchScreenButton


@onready var data = get_tree().current_scene.get_child(1)



func _on_pressed():
	data.savepoints(1000)
