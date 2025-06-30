extends Node

@export var player : CharacterBody2D

@export var state_controller : StateController

@export var velocity : Vector2 = Vector2.ZERO
@export var direction : Vector2 = Vector2.DOWN
@export var speed : float = 4000

func _on_state_changed(new_state: Enums.State) -> void:
	if new_state == Enums.State.WALKING:
		direction = state_controller.direction.normalized()
		pass
	elif new_state == Enums.State.IDLE:
		direction = Vector2.ZERO

func _physics_process(delta: float) -> void:
	player.velocity = direction * speed * delta
	player.move_and_slide()
