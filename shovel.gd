extends TouchScreenButton

@onready var inventory = get_parent().get_child(0)
@onready var dig = false
@onready var can_dig = load("res://sprites/icons/Showel.png")
@onready var cant_dig = load("res://sprites/icons/Showel_no.png")
@onready var tilemap = get_tree().current_scene.get_child(2)
@onready var inv_save = get_tree().current_scene.get_child(1)
func _on_released():
	#we want to change the current stare to shovel
	if dig == false:
		dig = true
		get_child(0).texture = cant_dig
		inventory.visible = false
	else:
		dig = false
		get_child(0).texture = can_dig
		inventory.visible = true
		inventory.get_child(0).reload()

func _process(delta):
	if dig == true:
		
		if Input.is_action_just_released("mouse_left_click"):
			var tile : Vector2 = tilemap.local_to_map(get_global_mouse_position())
			for lyr in range(1,-1,-1):
				var tile_index = tilemap.get_cell_source_id(lyr,tile)
				if tile_index == -1:
					pass
				else:
					tilemap.erase_cell(lyr, tile)
					if lyr == 0:
						inv_save.change(tile_index,1)
						print(tile_index)
					elif lyr == 1:
						inv_save.change2(tile_index-20,1)
						print(tile_index)
					break
