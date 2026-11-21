extends Button

@export var target : FighterSprite2D

func _on_pressed() -> void:
	$"../EnemySprite2D".attack(target)
