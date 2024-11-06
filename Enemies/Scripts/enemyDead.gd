extends State
class_name EnemyDead
@onready var body_sprite: AnimatedSprite2D = $"../../Body/bodySprite"
@onready var head_sprite: AnimatedSprite2D = $"../../Head/headSprite"

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")
@onready var blood_splatter: CPUParticles2D = $"../../BloodSplatter"

func Enter():
	owner.velocity = Vector2.ZERO
	blood_splatter.direction = (owner.global_position - player.global_position).normalized()*100
	blood_splatter.emitting = true
	play_dead_anims()
	owner.direction = (player.global_position - owner.global_position).normalized()*100
	owner.get_node("CollisionShape2D").disabled = true
	
	
func Update(_delta):
	pass

func play_dead_anims():
	owner.get_node("Sprite").play("Dead")
	body_sprite.play("Dead")
	head_sprite.play("Dead")
