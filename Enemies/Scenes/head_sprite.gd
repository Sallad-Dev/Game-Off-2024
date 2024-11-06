extends AnimatedSprite2D


func _process(_delta):
	
	#body rotates independently 
	rotate(lerp_angle(0, get_angle_to(owner.direction.normalized()*100), 0.1))
