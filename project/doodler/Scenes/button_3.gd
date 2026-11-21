extends Button

@export var target : FighterSprite2D
@export var heal_amt : int 

func _on_pressed() -> void:
	$"../EnemySprite2D".heal(target, 2)
