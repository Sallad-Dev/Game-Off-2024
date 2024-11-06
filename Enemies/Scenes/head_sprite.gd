extends AnimatedSprite2D

#body rotates independently 
@onready var ray_cast: RayCast2D = $Raycasts/RayCast2D
@onready var can_trans:= false

func _process(_delta):
	pass


func idle_scan():
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", 30, 0.5).as_relative()
	tween.tween_interval(0.2)
	tween.tween_property(self, "rotation_degrees", -60, 0.5).as_relative()
	await tween.finished
	set_trans(true)


func head_origin(target: Vector2):
	look_at(target)

func get_trans():
	return can_trans

func set_trans(bool):
	can_trans = bool
