extends Node

var inventoryArray : Array[Object_Data] = []

func empty_inventory() -> void:
	inventoryArray = []

func add_item(new_item : Object_Data) -> void:
	inventoryArray.append(new_item)

func replace_item(new_item : Object_Data, old_item : Object_Data) -> void:
	inventoryArray.erase(old_item)
	add_item(new_item)
