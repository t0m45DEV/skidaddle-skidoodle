extends FighterSprite2D
class_name PlayerSprite2D

func add_ability(ability : Object_Data) -> void:
	self.abilities.append(ability)

func _ready() -> void:
	var item : Object_Data = ResourceLoader.load("res://Objects/globo.tres")
	Inventory.add_item(item)
	
	var item2 : Object_Data = ResourceLoader.load("res://Objects/nariz_payaso.tres")
	Inventory.add_item(item2)
	
	for i_item in Inventory.inventoryArray:
		add_ability(item)
	
	super._ready()
