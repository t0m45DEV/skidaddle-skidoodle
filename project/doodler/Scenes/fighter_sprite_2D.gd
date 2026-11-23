extends Sprite2D
class_name  FighterSprite2D

@export var maxHP : int = 16
@export var HP : int
@export var strength : int = 3
@export var heal_ammount : int = 10

@export var abilities : Array[Object_Data] = []

@onready var HP_bar : TextureProgressBar = $Control/TextureProgressBar

func _ready() -> void:
	HP = maxHP
	
	HP_bar.max_value = maxHP
	update_HP_bar()

func damage(dmg : int):
	HP = min(max(0, HP-dmg), maxHP)
	update_HP_bar()

func attack(target : FighterSprite2D) -> void:
	target.damage(strength)

func heal() -> void:
	self.damage(-heal_ammount)

func update_HP_bar() -> void:
	HP_bar.value = HP
