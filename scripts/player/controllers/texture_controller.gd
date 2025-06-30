extends Node
class_name TextureController

@export var base_sprite : AnimatedSprite2D
@export var hair_sprite : AnimatedSprite2D
@export var tools_sprite : AnimatedSprite2D

@export var state_controller : StateController


func change_player_sprites_to(animation : String):
	base_sprite.animation = animation
	hair_sprite.animation = animation
	tools_sprite.animation = animation
	
func flip_player(flipped : bool):
	base_sprite.flip_h = flipped
	hair_sprite.flip_h = flipped
	tools_sprite.flip_h = flipped

func state_changed(new_state : Enums.State):
	if new_state == Enums.State.WALKING:
		change_player_sprites_to("walk")
	elif new_state == Enums.State.IDLE:
		change_player_sprites_to("idle")
		
	if state_controller.direction.x < 0:
		flip_player(true)
	elif state_controller.direction.x > 0:
		flip_player(false)
		
		
	pass
