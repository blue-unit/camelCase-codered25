extends Button

@onready var timer = $"../Timer2"
@onready var saver = get_parent().get_child(1)


func _on_button_up():
	timer.start()
	saver.purchase(-400)
	self.disabled = true
