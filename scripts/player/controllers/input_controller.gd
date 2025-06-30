extends Node

@export var state_controller : StateController

signal state_changed(new_state : Enums.State)

var pressed_list = {
	"up": false,
	"down": false,
	"right": false,
	"left": false
}

func handle_moving_input(event: InputEvent):
	if event.is_action_pressed("go_up"):
		pressed_list["up"] = true
	elif event.is_action_pressed("go_down"):
		pressed_list["down"] = true
	elif event.is_action_pressed("go_right"):
		pressed_list["right"] = true
	elif event.is_action_pressed("go_left"):
		pressed_list["left"] = true
		
		
	if event.is_action_released("go_up"):
		pressed_list["up"] = false
	elif event.is_action_released("go_down"):
		pressed_list["down"] = false
	elif event.is_action_released("go_right"):
		pressed_list["right"] = false
	elif event.is_action_released("go_left"):
		pressed_list["left"] = false
		
	var temp_x = 0
	var temp_y = 0
	if pressed_list["up"]: temp_y -= 1
	if pressed_list["down"]: temp_y += 1
	if pressed_list["left"]: temp_x -= 1
	if pressed_list["right"]: temp_x += 1
	
	state_controller.direction = Vector2(temp_x, temp_y)
		
		
	var is_idle : bool = true
	for val in pressed_list.values():
		if val:
			is_idle = false
		
	if is_idle:
		state_changed.emit(Enums.State.IDLE)
	else:
		state_changed.emit(Enums.State.WALKING)
	
func _input(event: InputEvent) -> void:
	handle_moving_input(event)
	
