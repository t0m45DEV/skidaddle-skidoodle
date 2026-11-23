class_name action_button
extends Button

func update_state(new_text : String) -> void:
	self.set_text(new_text)
	self.visible = true
