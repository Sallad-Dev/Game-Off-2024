extends CharacterBody2D
class_name TargetEnemy

@export_group("Stats")
@export var health = 100
@export var speed = 500

@export_group("Points of interest")
@export var POI: Array[PointOfInterest]

var poi_list: Array
var current_poi: PointOfInterest
var current_poi_pos: Vector2

func _ready() -> void:
	#shallow copy of POI
	poi_list = POI.duplicate()

func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	move_and_slide()
