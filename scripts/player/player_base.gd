extends Node

@export_category('Player Config')
@export var heath : float = 10
@export var speed : float = 100
@export var exp : int = 0
@export var gold : int = 0

@export_category('Player Refs')
@export var player_movement_ref : CharacterMovement
@export var health_ref : Health

signal player_death()

func _ready():
	player_movement_ref.speed = speed
	health_ref.health = heath
	health_ref.health_expired.connect(_on_player_death)


func _on_player_death():
	get_tree().reload_current_scene()
