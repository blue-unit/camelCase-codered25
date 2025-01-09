extends TileMap



# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("res://save/saveMap.data", FileAccess.READ)
	var tile_data = file.get_var()
	var layer = 0
	clear()
	for position in tile_data.keys():
		var tile_id = tile_data[position]
		set_cell(layer,position,tile_id, Vector2i.ZERO)
	fix_invalid_tiles()
	file.close()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		var tile : Vector2 = local_to_map(get_global_mouse_position())
		erase_cell(0, tile)

func place(layer, pos,tile_index):
	var tile : Vector2 = local_to_map(pos)
	set_cell(layer, tile, tile_index, Vector2i.ZERO )

func save():
	var file = FileAccess.open("res://save/saveMap.data", FileAccess.WRITE)
	var tile_data = {}
	for position in get_used_cells_by_id(0):
		var tile_id = get_cell_source_id(0,position)
		tile_data[position] = tile_id
	file.store_var(tile_data)
	file.close()
		
		
	
