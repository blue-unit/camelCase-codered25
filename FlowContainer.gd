extends FlowContainer

@onready var inv_save = get_parent().get_parent().get_parent().get_child(1)
@onready var tile_panel = load("res://tile_panel.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var curr_inv = inv_save.load_inv()
	for i in range(len(curr_inv)):
		if curr_inv[i] > 0:
			var tile_panel_instance = tile_panel.instantiate()
			tile_panel_instance.spr(0,i)
			tile_panel_instance.quantity(curr_inv[i])
			add_child(tile_panel_instance)
			
	var curr_inv2 = inv_save.load_inv2()
	for i in range(len(curr_inv2)):
		if curr_inv[i] > 0:
			var tile_panel_instance = tile_panel.instantiate()
			tile_panel_instance.spr(1,i)
			tile_panel_instance.quantity(curr_inv[i])
			add_child(tile_panel_instance)
		

func load():
	for child in get_children():
		child.queue_free()
	var curr_inv = inv_save.load_inv()
	for i in range(len(curr_inv)):
		if curr_inv[i] > 0:
			var tile_panel_instance = tile_panel.instantiate()
			tile_panel_instance.spr(i)
			tile_panel_instance.quantity(curr_inv[i])
			add_child(tile_panel_instance)


