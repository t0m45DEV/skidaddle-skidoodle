extends Control

@onready var shop_options : HBoxContainer = $VBoxContainer2/HBoxContainer

func _ready() -> void:
	var all_objects : Array[Object_Data] = Objects.get_all_objects()
	
	for obj in all_objects:
		if obj in Inventory.inventoryArray:
			all_objects.erase(obj)
	
	for button in shop_options.get_children():
		var obj : Object_Data = all_objects.pick_random()
		button.set_button_icon(obj.texture)
		all_objects.erase(obj)
	
	for i in range(Inventory.inventoryArray.size()):
		var i_button : Button = $VBoxContainer2/HBoxContainer2.get_child(i)
		var icon : Texture2D = Inventory.inventoryArray[i].texture
		i_button.set_button_icon(icon)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/combat.tscn")
