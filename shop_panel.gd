extends Panel

@onready var index = get_index()
@onready var save = get_parent().get_parent().get_parent().get_parent().get_parent().get_child(1)


func spr(ini_path,i):
	var path = ini_path+str(i)+".png"
	var new_spr = Sprite2D.new()
	new_spr.texture = load(path)
	add_child(new_spr)
	print(path)
	new_spr.centered = true
	get_child(0).offset.x = 5
	get_child(0).offset.y = 5
	get_child(0).position.x = 15
	get_child(0).position.y = 15


func _on_gui_input(event):
	if event is InputEventMouseButton and event.button_mask == 1:
		save.change(index,1)
