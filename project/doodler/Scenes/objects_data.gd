class_name Object_Data
extends Resource

@export var name : String
@export var action : StringName

var used : bool

func _init(_name : String = "Object Name", _action : StringName = &"", _used : bool = false) -> void:
	self.name = _name
	self.action = _action
	self.used = _used

func execute(source :FighterSprite2D, target : FighterSprite2D) -> String:
	if not Objects.has_method(self.action):
		push_error("La acción '" + self.action + "' no fue encontrada por el objeto '" + self.name + "'.")
		return ""
	
	self.used = true
	return Callable(Objects, self.action).call(source, target)
