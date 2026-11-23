class_name Enemy_Data
extends Resource

@export var max_HP : int = 0
@export var strength : int = 0
@export var abilities : Array[Object_Data] = []

func _init(_max_HP : int = 0, _strength : int = 0, _abilities : Array[Object_Data] = []) -> void:
	self.max_HP = _max_HP
	self.strength = _strength
	self.abilities = _abilities
