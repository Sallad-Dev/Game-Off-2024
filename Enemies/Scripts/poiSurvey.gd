extends PointOfInterest
class_name POISurvey

#TODO Need to make this more generic with the ability to like run every frame for look at commands

func on_arrival(enemy: TargetEnemy):
	enemy.poi_survey()
