extends CharacterBody2D


## this is all placeholder, movement will be so much more swag
@export var SPEED = 300.0



func _physics_process(_delta: float) -> void:

#movement inputs (basic and can be modified to be more robust)

	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED

	move_and_slide()
