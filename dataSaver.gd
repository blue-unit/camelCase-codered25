extends Node

func on_ready():
	loadpoints()

func load_inv():
	var inv = FileAccess.open("res://save/savegame.data", FileAccess.READ)
	var inventory = inv.get_var()
	if inventory == null:
		inventory = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		save_inv(inventory)
	inv.close()
	return inventory

func save_inv(inventory):
	var inv = FileAccess.open("res://save/savegame.data", FileAccess.WRITE)
	inv.store_var(inventory)
	inv.close()

func change(index,num):
	var loaded_inv = load_inv()
	loaded_inv[index] += num
	print(loaded_inv)
	save_inv(loaded_inv) 



func load_inv2():
	var inv2 = FileAccess.open("res://save/savegame2.data", FileAccess.READ)
	var inventory2 = inv2.get_var()
	if inventory2 == null:
		inventory2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		save_inv2(inventory2)
	inv2.close()
	return inventory2

func save_inv2(inventory):
	var inv2 = FileAccess.open("res://save/savegame2.data", FileAccess.WRITE)
	inv2.store_var(inventory)
	inv2.close()

func change2(index,num):
	var loaded_inv2 = load_inv2()
	loaded_inv2[index] += num
	save_inv2(loaded_inv2) 


func savepoints(pt):
	var point = FileAccess.open("res://save/pts.data", FileAccess.WRITE)
	point.store_var(pt)
	point.close()

func loadpoints():
	var point = FileAccess.open("res://save/pts.data", FileAccess.READ)
	var pt = point.get_var()
	point.close()
	return pt
	
