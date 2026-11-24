extends Control

@onready var shop_options : HBoxContainer = $VBoxContainer2/HBoxContainer

func _ready() -> void:
	var all_objects : Array[Object_Data] = Objects.get_all_objects()
	
	for obj in all_objects:
		if obj in Inventory.inventoryArray:
			all_objects.erase(obj)
	
	for button in shop_options.get_children():
		var obj : Object_Data = all_objects.pick_random()
		button.update_data(obj)
		#all_objects.erase(obj)
	
	for i in range($VBoxContainer2/HBoxContainer2.get_children().size()):
		var i_button : Button = $VBoxContainer2/HBoxContainer2.get_child(i)
		
		if i < Inventory.inventoryArray.size():
			i_button.update_data(Inventory.inventoryArray[i])
		else:
			i_button.visible = false

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/combat.tscn")

func _on_shop_button_send_data(data: Object_Data) -> void:
	if Inventory.inventoryArray.size() < 2:
		Inventory.inventoryArray.append(data)
		# Se pasa a la siguiente batalla
		_on_button_pressed()
	else:
		print("No tienes espacio, deshazte de algun objeto antes de tomar otro")

func _on_inventory_button_send_data(data: Object_Data) -> void:
	Inventory.inventoryArray.erase(data)
