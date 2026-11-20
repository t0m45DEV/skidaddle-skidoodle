extends Button

@export var damageToDo : int = 0

func _on_pressed() -> void:
	$"../EnemySprite2D".damage(damageToDo)
