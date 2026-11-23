extends Node2D

@onready var player : PlayerSprite2D = $PlayerSprite2D
@onready var enemy : EnemySprite2D = $EnemySprite2D

@onready var attack_button   : action_button = $Buttons2/MarginContainer/VBoxContainer/HBoxContainer/ButtonAttack
@onready var heal_button     : action_button = $Buttons2/MarginContainer/VBoxContainer/HBoxContainer/ButtonHeal
@onready var special1_button : action_button = $Buttons2/MarginContainer/VBoxContainer/HBoxContainer2/ButtonSpecial1
@onready var special2_button : action_button = $Buttons2/MarginContainer/VBoxContainer/HBoxContainer2/ButtonSpecial2

func _ready() -> void:
	attack_button.update_state("Attack")
	heal_button.update_state("Heal")
	
	if player.abilities.size() == 0:
		special1_button.visible = false
		special2_button.visible = false
	elif player.abilities.size() == 1:
		special1_button.update_state(player.abilities[0].name)
		special2_button.visible = false
	elif player.abilities.size() == 2:
		special1_button.update_state(player.abilities[0].name)
		special2_button.update_state(player.abilities[1].name)
	else:
		push_error("El jugador tiene mas de 2 objetos encima.")

func _on_button_attack_pressed() -> void:
	player.attack(enemy)

func _on_button_heal_pressed() -> void:
	player.heal(player, 10)

func _on_button_special1_pressed() -> void:
	
	if player.abilities[0].type == Object_Data.action_type.SELF:
		player.abilities[0].execute(player)
	else:
		player.abilities[0].execute(enemy)
	
	special1_button.visible = false

func _on_button_special2_pressed() -> void:
	
	if player.abilities[1].type == Object_Data.action_type.SELF:
		player.abilities[1].execute(player)
	else:
		player.abilities[1].execute(enemy)
	
	special2_button.visible = false
