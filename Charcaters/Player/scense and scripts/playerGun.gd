extends Node2D

@onready var gun_sprite: AnimatedSprite2D = $gunSprite

var mouse_pos

func _process(_delta):
	mouse_pos = get_global_mouse_position()
	#gun rotates independently 
	rotate(lerp_angle(0, get_angle_to(mouse_pos), 0.25))
	
	if Input.is_action_pressed("action_shoot"):
		gun_sprite.play("shoot")
	else:
		gun_sprite.play("idle")
