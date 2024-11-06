extends State
class_name TargetEnemyIdle

func Enter() -> void:
	owner.velocity = Vector2.ZERO
	transitioned.emit("Patrol")

#func called on exit of state
func Exit() -> void:
	pass

#update every frame
func Update(_delta: float) -> void:
	pass

 #update with physics tick
func Physics_update(_delta: float) -> void:
	pass
