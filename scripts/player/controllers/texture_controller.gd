extends Node
class_name TextureController

@export var player_sprite : AnimatedSprite2D

@export var debug_state : Enums.State = Enums.State.IDLE

func state_changed(new_state : Enums.State, direction : Vector2):
	debug_state = new_state
	player_sprite.flip_h = false
	if new_state == Enums.State.IDLE:
		match direction:
			Vector2.UP:
				player_sprite.animation = "idle_top"
			Vector2.DOWN:
				player_sprite.animation = "idle_bot"
			Vector2.RIGHT:
				player_sprite.animation = "idle_right"
			Vector2.LEFT:
				player_sprite.animation = "idle_right"
				player_sprite.flip_h = true
	elif new_state == Enums.State.WALKING:
		match direction:
			Vector2.UP:
				player_sprite.animation = "walk_top"
			Vector2.DOWN:
				player_sprite.animation = "walk_bot"
			Vector2.RIGHT:
				player_sprite.animation = "walk_right"
			Vector2.LEFT:
				player_sprite.animation = "walk_right"
				player_sprite.flip_h = true
	pass
