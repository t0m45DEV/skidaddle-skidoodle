class_name Shop_Button
extends Button

signal send_data(data : Object_Data)

var data : Object_Data

func _on_pressed() -> void:
	send_data.emit(self.data)
	if Inventory.inventoryArray.size() < 2:
		self.visible = false

func update_data(new_data : Object_Data) -> void:
	self.data = new_data
	self.set_button_icon(self.data.texture)
