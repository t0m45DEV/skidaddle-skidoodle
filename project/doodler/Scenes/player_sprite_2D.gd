extends FighterSprite2D
class_name PlayerSprite2D

func add_ability(ability : Object_Data) -> void:
	self.abilities.append(ability)

func _ready() -> void:
	for ability in Inventory.inventoryArray:
		self.abilities.append(ability)
	
	super._ready()
