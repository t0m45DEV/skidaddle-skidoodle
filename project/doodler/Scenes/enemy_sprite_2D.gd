extends FighterSprite2D
class_name EnemySprite2D

const enemies : Array[String] = [
	"skeleton",
	"dinosaur"
]

@export var enemy : String = enemies[0] # Por defecto se autoasigna el primer enemigo

func _ready() -> void:
	# Si hay alguien a quien cargar, buscamos sus estadisticas
	if enemy != "":
		var data : Enemy_Data = ResourceLoader.load("res://Enemies/" + enemy + ".tres")
		
		self.maxHP = data.max_HP
		self.strength = data.strength
		self.abilities = []
		
		for f in data.abilities:
			if Objects.has_method(f):
				self.abilities.append(Callable(Objects, f))
			else:
				push_warning("La habilidad '" + f + "' no existe en 'objects.gd'.")
