extends Node

func object_ataque_normal(_source : FighterSprite2D, _target : FighterSprite2D) -> String:
	_source.attack(_target)
	
	# Si la accion fue ejecutada por el jugador.
	if _source is PlayerSprite2D:
		if _source.strength == 1:
			return "Haces " + str(_source.strength) + " punto de daño al enemigo."
		else:
			return "Haces " + str(_source.strength) + " puntos de daño al enemigo."
	else:
		return "El enemigo te hace " + str(_source.strength) + " puntos de daño."

func object_cura_normal(_source : FighterSprite2D, _target : FighterSprite2D) -> String:
	_source.heal()
	
	# Si la accion fue ejecutada por el jugador.
	if _source is PlayerSprite2D:
		return "Recuperas " + str(_source.heal_ammount) + " puntos de vida."
	else:
		return "El enemigo recupera " + str(_source.heal_ammount) + " puntos de vida."

func object_nariz_payaso(_source : FighterSprite2D, _target : FighterSprite2D) -> String:
	_target.strength = max(1, _target.strength - 1)
	
	# Si la accion fue ejecutada por el jugador.
	if _source is PlayerSprite2D:
		return "Te ves tan ridiculo al usarlo que tu rival no puede hacer fuerza. Su ataque baja."
	else:
		return "El enemigo se coloca una nariz de payaso que te distrae. Tu ataque baja."

func object_globo(_source : FighterSprite2D, _target : FighterSprite2D) -> String:
	_source.strength += 1
	
	# Si la accion fue ejecutada por el jugador.
	if _source is PlayerSprite2D:
		return "El unico objeto contundente o punzante que lograste encontrar. Tu ataque aumenta."
	else:
		return "¡El enemigo tiene un globo! Su ataque aumenta."
