extends Control

func _ready() -> void:
	for i in range(Inventory.inventoryArray.size()):
		var i_button : Button = $VBoxContainer2/HBoxContainer2.get_child(i)
		var icon : Texture2D = Inventory.inventoryArray[i].texture
		i_button.set_button_icon(icon)
		

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/combat.tscn")
