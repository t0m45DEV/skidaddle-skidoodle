extends FighterSprite2D
class_name PlayerSprite2D

func add_ability(ability : Object_Data) -> void:
	self.abilities.append(ability)
