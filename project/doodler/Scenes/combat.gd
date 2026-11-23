extends Node2D

@onready var player : PlayerSprite2D = $PlayerSprite2D
@onready var enemy : EnemySprite2D = $EnemySprite2D

@onready var attack_button   : action_button = $UI/MarginContainer/VBoxContainer/HBoxContainer/ButtonAttack
@onready var heal_button     : action_button = $UI/MarginContainer/VBoxContainer/HBoxContainer/ButtonHeal
@onready var special1_button : action_button = $UI/MarginContainer/VBoxContainer/HBoxContainer2/ButtonSpecial1
@onready var special2_button : action_button = $UI/MarginContainer/VBoxContainer/HBoxContainer2/ButtonSpecial2

@onready var current_effect : RichTextLabel = $UI/CurrentEffectDescription
@onready var animations : AnimationPlayer = $AnimationPlayer

var is_player_turn : bool = true

func show_effect(effect : String) -> void:
	animations.stop()
	current_effect.visible_ratio = 0.0
	current_effect.set_text(effect)
	animations.play("effect")

func disable_buttons() -> void:
	attack_button.disabled = true
	heal_button.disabled = true
	special1_button.disabled = true
	special2_button.disabled = true

func _ready() -> void:
	attack_button.update_state("Ataque")
	heal_button.update_state("Cura")
	
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
	show_effect(Objects.object_ataque_normal(player, enemy))
	disable_buttons()

func _on_button_heal_pressed() -> void:
	show_effect(Objects.object_cura_normal(player, enemy))
	disable_buttons()

func _on_button_special1_pressed() -> void:
	show_effect(player.abilities[0].execute(player, enemy))
	special1_button.visible = false
	disable_buttons()

func _on_button_special2_pressed() -> void:
	show_effect(player.abilities[1].execute(player, enemy))
	special2_button.visible = false
	disable_buttons()

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	if _anim_name == "effect":
		current_effect.clear()
		
		if is_player_turn:
			show_effect(enemy.do_action(player))
		else:
			attack_button.disabled = false
			heal_button.disabled = false
			special1_button.disabled = false
			special2_button.disabled = false
		
		is_player_turn = not is_player_turn
	elif _anim_name == "player_died":
		get_tree().change_scene_to_file("res://Menus/game_over.tscn")
	elif _anim_name == "enemy_died":
		get_tree().change_scene_to_file("res://Menus/you_win.tscn")


func _on_enemy_died() -> void:
	print("malo died")
	animations.play("enemy_died")


func _on_player_died() -> void:
	print("player died")
	animations.play("player_died")
