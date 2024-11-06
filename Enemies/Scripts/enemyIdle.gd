extends State
class_name EnemyIdle

@onready var idle_timer: Timer = $idleTimer


func Physics_update(delta: float) -> void:
	owner.velocity = owner.direction * owner.SPEED * delta
	
func Update(_delta: float) -> void:
	if owner.is_dead:
		transitioned.emit("Dead")
	if idle_timer.is_stopped():
		owner.direction = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized()
		idle_timer.start(randf_range(0.0, 3.5))
