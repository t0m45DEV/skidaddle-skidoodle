class_name Object_Data
extends Resource

enum action_type {
	SELF,
	TARGET
}

@export var name : String
@export var type : action_type
@export var action : StringName

var used : bool

func _init(_name : String = "Object Name", _type : action_type = action_type.SELF, _action : StringName = &"", _used : bool = false) -> void:
	self.name = _name
	self.type = _type
	self.action = _action
	self.used = _used

func execute(target : FighterSprite2D) -> void:
	if Objects.has_method(self.action):
		Callable(Objects, self.action).call(target)
		self.used = true
	else:
		push_error("La acción '" + self.action + "' no fue encontrada por el objeto '" + self.name + "'.")
