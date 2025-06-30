extends Node

@export var state_controller : StateController

signal state_changed(new_state : Enums.State)

var released_list = {
	"up": true,
	"down": true,
	"right": true,
	"left": true
}

func handle_moving_input(event: InputEvent):
	if event.is_action_pressed("go_up"):
		released_list["up"] = false
		state_controller.direction = Vector2.UP
	elif event.is_action_pressed("go_down"):
		released_list["down"] = false
		state_controller.direction = Vector2.DOWN
	elif event.is_action_pressed("go_right"):
		released_list["right"] = false
		state_controller.direction = Vector2.RIGHT
	elif event.is_action_pressed("go_left"):
		released_list["left"] = false
		state_controller.direction = Vector2.LEFT
		
		
		
	if event.is_action_released("go_up"):
		released_list["up"] = true
	elif event.is_action_released("go_down"):
		released_list["down"] = true
	elif event.is_action_released("go_right"):
		released_list["right"] = true
	elif event.is_action_released("go_left"):
		released_list["left"] = true
		
		
	var is_idle : bool = true
	for val in released_list.values():
		if not val:
			is_idle = val
		
	if is_idle:
		state_changed.emit(Enums.State.IDLE)
	else:
		state_changed.emit(Enums.State.WALKING)
	
func _input(event: InputEvent) -> void:
	handle_moving_input(event)
	
