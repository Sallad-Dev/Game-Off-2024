extends CharacterBody2D


## this is all placeholder, movement will be so much more swag
@export var SPEED = 300.0



func _physics_process(_delta: float) -> void:
	#raycast shenanigans
	var space_state = get_world_2d().direct_space_state
	# use global coordinates, not local to node
	var query = PhysicsRayQueryParameters2D.create(global_position, get_global_mouse_position())
	var result = space_state.intersect_ray(query)
	
	if result:
		var obj = result.collider
		if Input.is_action_just_pressed("action_shoot"):
			obj.gamer()
	

		##push boxes test
		#obj.global_position += (obj.global_position - global_position).limit_length(5)
		#print("Hit at point: ", obj)
		
#movement inputs (basic and can be modified to be more robust)

	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED

	move_and_slide()
