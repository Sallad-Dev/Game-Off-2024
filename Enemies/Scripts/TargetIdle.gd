extends State
class_name TargetEnemyIdle

func Enter() -> void:
	owner.velocity = Vector2.ZERO
	get_tree().create_timer(0.1).connect("timeout", on_timer_timeout)
	

#func called on exit of state
func Exit() -> void:
	pass

#update every frame
func Update(_delta: float) -> void:
	pass

 #update with physics tick
func Physics_update(_delta: float) -> void:
	pass

func on_timer_timeout():
	transitioned.emit("Patrol")
