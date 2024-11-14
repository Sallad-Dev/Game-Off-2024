extends State
class_name POIArrival

##TODO change how arrival transitions back to patrol
##TODO change the transition from timer to something else based on on_arrival()
##TODO make on_arrival() do some useful effects to the enemy. // Global scripts
##TODO make more versions of the on_arrival() scripts (maybe make survey its own class).
func Enter() -> void:
	owner.velocity = Vector2.ZERO
	if EnemySignals.enemyArrivalFinsihed.is_connected(on_enemy_finished):
		pass
	else:
		EnemySignals.enemyArrivalFinsihed.connect(on_enemy_finished)
	if owner.current_poi.has_method("on_arrival"):
		owner.current_poi.on_arrival(owner)
	#get_tree().create_timer(1).connect("timeout", on_timer_timeout)



func on_enemy_finished(enemy):
	if enemy == owner:
		transitioned.emit("Patrol")

func on_timer_timeout():
	transitioned.emit("Patrol")
