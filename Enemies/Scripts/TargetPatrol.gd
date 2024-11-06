extends State
class_name TargetEnemyPatrol

##TODO transition to other states


func Enter() -> void:
	if owner.poi_list.is_empty():
		reset_poi_list()
	set_next_poi()

func Exit() -> void:
	pass

func Update(_delta: float) -> void:
	pass

func Physics_update(delta: float) -> void:
	var poi_to_target = get_current_poi_pos()-owner.global_position
	owner.velocity = poi_to_target.normalized()*owner.speed*delta
	
	##TODO change idle to POI Arrival state
	if poi_to_target.length() <= 16:
		transitioned.emit("POIArrival")
	
#setters and getters
func get_poi_list():
	return owner.poi_list

func reset_poi_list():
	owner.poi_list = owner.POI.duplicate()

func get_current_poi():
	return owner.current_poi

func set_next_poi():
	owner.current_poi = owner.poi_list.pop_front()

func set_current_poi(poi: PointOfInterest):
	owner.current_poi = poi

func get_current_poi_pos():
	return owner.current_poi.global_position


func set_current_poi_pos(vect:Vector2):
	owner.current_poi_pos = vect
