extends FlowContainer

@onready var shop_panel = load("res://shop_panel.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1,18):
		var shop_panel_instance = shop_panel.instantiate()
		shop_panel_instance.spr("res://sprites/plant/",i)
		add_child(shop_panel_instance)

