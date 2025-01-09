extends Panel

@onready var tilemap = get_parent().get_parent().get_parent().get_parent().get_node("TileMap")
@onready var sprite = $Sprite2D
@onready var inv_save = get_parent().get_parent().get_parent().get_parent().get_node("saver")
var fake_tile
@export var tile_index = 0
var layer = 0
func spr(i,layer):
	if layer == 0 :
		tile_index = i
	elif layer == 1:
		tile_index = 19+i
	get_child(0).texture = load("res://sprites/tiles/"+str(i)+".png")
	get_child(0).offset.x = 5
	get_child(0).offset.y = 5
	get_child(0).position.x = 15
	get_child(0).position.y = 15
	layer = layer

func quantity(i):
	var text_label = $Label
	text_label.text = str(i)

func _on_gui_input(event):

	#Selecting tile to place
	if event is InputEventMouseButton and event.button_mask == 1:
		#setting up the porjectile 
		var temp_child = Sprite2D.new()
		temp_child.texture = get_child(0).texture
		add_child(temp_child)
		
		
	#dragging tile to place
	elif event is InputEventMouseMotion and event.button_mask == 1:
		#moving the projectile with the mouse/touch
		fake_tile = tilemap.local_to_map(event.global_position)
		get_child(2).global_position = tilemap.map_to_local(fake_tile)
		get_child(2).modulate.a = 0.5
		if tilemap.get_cell_source_id(0,fake_tile) != -1:
			get_child(2).modulate = Color(1,0.5,0.5)
		else:
			get_child(2).modulate = Color(1,1,1)


	#Placing the tile
	elif event is InputEventMouseButton and event.button_mask == 0:
		#placing a new tile in the real map
		fake_tile = tilemap.local_to_map(event.global_position)
		#checking if a tile exist there
		if tilemap.get_cell_source_id(layer,fake_tile) == -1:
			tilemap.place(layer,get_child(2).global_position,tile_index+1)
			inv_save.change(tile_index,-1)
		#savind the data in tilemap and in inventory
		tilemap.save()
		get_parent().load()
		#deleting the projectile
		get_child(2).queue_free()
		


