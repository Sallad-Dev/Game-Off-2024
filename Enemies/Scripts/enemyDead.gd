extends State
class_name EnemyDead

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")

func Enter():
	
	owner.get_node("Sprite").play("Dead")
	owner.direction = (player.global_position - owner.global_position).normalized()*100
	owner.velocity = Vector2.ZERO
	owner.get_node("CollisionShape2D").queue_free()
	
