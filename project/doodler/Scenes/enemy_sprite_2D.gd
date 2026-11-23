extends FighterSprite2D
class_name EnemySprite2D

# Tiene que ser el MISMO NOMBRE que el archivo 'monstruo.tres' en la carpeta 'Enemies'
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
			self.abilities.append(f)
	
	# Vuelvo a llamar al constructor de FighterSprite2D
	super._ready()

# TODO: Mejor IA de malito
func do_action(player : PlayerSprite2D) -> String:
	return self.abilities.pick_random().execute(self, player)
