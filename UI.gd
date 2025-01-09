extends CanvasLayer

#screen addons / dropdown or smth
#@onready var inv_screen = $inventory
#@onready var shop_screen = $Shop
@onready var inv_screen = get_parent().get_child(3)
@onready var shop_screen = get_parent().get_child(4)


#buttons
@onready var shop_button = $HBoxContainer/Panel/Shop
@onready var home_button = $HBoxContainer/Panel2/Home
@onready var inv_button = $HBoxContainer/Panel3/Inventory

#buttons icon
var shop_icon1 = load("res://sprites/icons/shop.png")
var shop_icon2 = load("res://sprites/icons/shop_open.png")

#button texture
@onready var shop_texture = $HBoxContainer/Panel/Sprite2D

var shop = false
var home = true
var inventory = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if home == true:
		inv_screen.visible = false
		shop_screen.visible = false
		shop_texture.texture = shop_icon1
		
	elif shop == true:
		inv_screen.visible = false
		shop_screen.visible = true
		shop_texture.texture = shop_icon2
		
	elif inventory == true:
		inv_screen.visible = true
		shop_screen.visible = false
		shop_texture.texture = shop_icon1

		
		


func _on_shop_released():
	shop = true
	home = false
	inventory = false

func _on_home_released():
	shop = false
	home = true
	inventory = false

func _on_inventory_released():
	shop = false
	home = false
	inventory = true
