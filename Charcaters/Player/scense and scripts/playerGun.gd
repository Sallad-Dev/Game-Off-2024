extends Node2D

@onready var gun_sprite: AnimatedSprite2D = $gunSprite
@onready var shot_timer: Timer = $ShotTimer
@onready var bullet_particle: CPUParticles2D = $bulletParticle

@export var range_bullet: int = 1000

var mouse_pos

func _process(_delta):
	mouse_pos = get_global_mouse_position()
	#gun rotates independently 
	rotate(lerp_angle(0, get_angle_to(mouse_pos), 0.25))
	
	if Input.is_action_pressed("action_shoot") :
		gun_sprite.play("shoot")
		shoot_gun()
	else:
		gun_sprite.play("idle")


#generic shooting func
func shoot_gun():
	if shot_timer.is_stopped():
		var target_dist = (mouse_pos - global_position).normalized()*range_bullet
		#raycast shenanigans
		var space_state = get_world_2d().direct_space_state
		# use global coordinates, not local to node
		var query = PhysicsRayQueryParameters2D.create(owner.global_position, target_dist)
		var result = space_state.intersect_ray(query)
	
		bullet_particle.emitting = true
		
		if result:
			var obj = result.collider
			if obj.has_method("take_damage"):
				obj.take_damage()
				
		shot_timer.start()
