extends Node2D

@onready var body_sprite: AnimatedSprite2D = $bodySprite

var mouse_pos

func _process(_delta):
	mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	
	if Input.is_action_pressed("action_shoot"):
		body_sprite.play("shoot")
	else:
		body_sprite.play("idle")
