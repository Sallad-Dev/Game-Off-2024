extends State
class_name POIArrival


##TODO make more POIs that do cool stuff
func Enter() -> void:
	owner.velocity = Vector2.ZERO
	if EnemySignals.enemyArrivalFinsihed.is_connected(on_enemy_finished):
		pass
	else:
		EnemySignals.enemyArrivalFinsihed.connect(on_enemy_finished)
	if owner.current_poi.has_method("on_arrival"):
		owner.current_poi.on_arrival(owner)


func on_enemy_finished(enemy):
	if enemy == owner:
		transitioned.emit("Patrol")
