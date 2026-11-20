extends Sprite2D
class_name EnemySprite2D

@export var maxHP : int = 16
@export var HP : int

@onready var HP_bar : TextureProgressBar = $Control/TextureProgressBar

func _ready() -> void:
	HP = maxHP
	
	HP_bar.max_value = maxHP
	update_HP_bar()

func damage(dmg : int):
	HP = min(max(0, HP-dmg), maxHP)
	update_HP_bar()

func update_HP_bar() -> void:
	HP_bar.value = HP
