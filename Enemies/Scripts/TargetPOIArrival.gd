extends State
class_name POIArrival

##TODO change how arrival transitions back to patrol
##TODO make on_arrival() do some useful effects to the enemy.

func Enter() -> void:
	owner.velocity = Vector2.ZERO
	owner.current_poi.on_arrival()
	get_tree().create_timer(1).connect("timeout", on_timer_timeout)

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
