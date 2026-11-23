class_name Object_Data
extends Resource

enum action_type {
	CONSUMIBLE,
	PERMANENTE
}

@export var name : String
@export var action : StringName

var used : bool
var type : action_type

func _init(_name : String = "Object Name", _action : StringName = &"", _used : bool = false, _type : action_type = action_type.CONSUMIBLE) -> void:
	self.name = _name
	self.action = _action
	self.used = _used
	self.type = _type

func execute(source :FighterSprite2D, target : FighterSprite2D) -> String:
	if not Objects.has_method(self.action):
		push_error("La acción '" + self.action + "' no fue encontrada por el objeto '" + self.name + "'.")
		return ""
	
	var message : String = Callable(Objects, self.action).call(source, target)
	self.used = true
	
	return message
