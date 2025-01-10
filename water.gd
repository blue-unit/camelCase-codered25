extends Button



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_up():
	get_parent().get_node("Timer")
	print('start here')
	self.disabled = true # Replace with function body.
