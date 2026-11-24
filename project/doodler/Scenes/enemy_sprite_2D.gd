extends FighterSprite2D
class_name EnemySprite2D

@export_enum("aranha",
	"boblin",
	"hataud",
	"eskeleton",
	"demoño",
	"maguito",
	"magordito",
	"cofre",
	"mimic",
	"puingino",
	"pallaso",
	"trex",
	"biltm",
	"acuaman",
	"roberto",
	"67",
	"labubu",
	"oy") var enemy : String = "boblin" # Por defecto se autoasigna el primer enemigo

func _ready() -> void:
	# Si hay alguien a quien cargar, buscamos sus estadisticas
	if enemy != "":
		var data : Enemy_Data = ResourceLoader.load("res://Enemies/" + enemy + ".tres")
		
		$Control/Icon.set_texture(data.icon)
		$Tag.set_texture(data.tag)
		self.set_texture(data.texture)
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
