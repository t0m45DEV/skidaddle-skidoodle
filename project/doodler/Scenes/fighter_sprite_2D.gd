extends Sprite2D
class_name  FighterSprite2D

@export var maxHP : int = 16
@export var HP : int
@export var strength : int = 3

@onready var HP_bar : TextureProgressBar = $Control/TextureProgressBar

var abilities : Array[Callable] = []

func _ready() -> void:
	HP = maxHP
	
	HP_bar.max_value = maxHP
	update_HP_bar()

func damage(dmg : int):
	HP = min(max(0, HP-dmg), maxHP)
	update_HP_bar()

func attack(target : FighterSprite2D) -> void:
	target.damage(strength)

func heal(target : FighterSprite2D, heal_amt) -> void:
	target.damage(-heal_amt)

func update_HP_bar() -> void:
	HP_bar.value = HP
