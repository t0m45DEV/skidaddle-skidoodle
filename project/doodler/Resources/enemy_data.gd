class_name Enemy_Data
extends Resource

@export var max_HP : int = 0
@export var strength : int = 0
@export var abilities : Array[Object_Data] = []
@export var texture : Texture2D = Texture2D.new()
@export var tag : Texture2D = Texture2D.new()
@export var icon : Texture2D = Texture2D.new()


func _init(_max_HP : int = 0, _strength : int = 0, _abilities : Array[Object_Data] = [], _texture : Texture2D = Texture2D.new(), _tag : Texture2D = Texture2D.new(), _icon : Texture2D = Texture2D.new()) -> void:
	self.max_HP = _max_HP
	self.strength = _strength
	self.abilities = _abilities
	self.texture = _texture
	self.tag = _tag
	self.icon = _icon
