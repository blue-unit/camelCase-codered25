extends Panel

@onready var index = get_index()
@onready var save = get_parent().get_parent().get_parent().get_parent().get_parent().get_child(1)
@onready var points = get_tree().current_scene.get_node("Basic UI")
var layer 
var cost =0
func spr(ini_path,i,lyr):
	var path = ini_path+str(i)+".png"
	var new_spr = Sprite2D.new()
	var new_cost = Label.new()
	layer = lyr
	new_spr.texture = load(path)
	add_child(new_spr)
	new_spr.centered = true
	get_child(0).offset.x = 22
	get_child(0).offset.y = 22
	get_child(0).position.x = 0
	get_child(0).position.y = 0
	get_child(0).scale.y = 1
	get_child(0).scale.x = 1
	if layer == 0:
		cost = 25
	elif layer == 1:
		if i < 15:
			cost = 50
		else:
			cost = 100
	add_child(new_cost)
	get_child(1).text = str(cost)
	get_child(1).position.y = 40
	get_child(1).position.x = 10


func _on_gui_input(event):
	if event is InputEventMouseButton and event.button_mask == 1:
		var pt_has =  points.get_child(1).reload()
		if pt_has < cost:
			pass
		else:
			if layer == 0:
				save.change(index,1)
			elif layer == 1:
				save.change2(index,1)
			points.get_child(1).purchase(cost)
		
