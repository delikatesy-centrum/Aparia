extends Node
class_name StateController

@export var texture_controller : TextureController

@export var current_state : Enums.State

var direction : Vector2 = Vector2.DOWN

func state_changed(new_state : Enums.State):
	current_state = new_state
	texture_controller.state_changed(new_state, direction)
	pass
