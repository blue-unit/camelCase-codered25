extends Node

func load_inv():
	var inv = FileAccess.open("res://save/savegame.data", FileAccess.READ)
	var inventory = inv.get_var()
	inv.close()
	return inventory
	

func save_inv(inventory):
	var inv = FileAccess.open("res://save/savegame.data", FileAccess.WRITE)
	inv.store_var(inventory)
	inv.close()

func change(index,num):
	var loaded_inv = load_inv()
	loaded_inv[index] += num
	save_inv(loaded_inv) 
	
func load_inv2():
	var inv = FileAccess.open("res://save/savegame2.data", FileAccess.READ)
	var inventory = inv.get_var()
	inv.close()
	return inventory
	

func save_inv2(inventory):
	var inv = FileAccess.open("res://save/savegame2.data", FileAccess.WRITE)
	inv.store_var(inventory)
	inv.close()

func change2(index,num):
	var loaded_inv = load_inv2()
	loaded_inv[index] += num
	save_inv2(loaded_inv) 
