extends State
class_name EnemyIdle

@onready var idle_timer: Timer = $idleTimer


func _physics_process(delta: float) -> void:
	owner.velocity = owner.direction * owner.SPEED * delta
	
	


func _on_idle_timer_timeout() -> void:
	owner.direction = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized()
	idle_timer.wait_time = randf_range(0.0, 3.5)
