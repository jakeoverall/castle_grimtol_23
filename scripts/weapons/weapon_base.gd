extends Node

class_name WeaponBase

@export_category("weapon config")
@export var attack_speed : float
@export var attack_damage: float
@export var attack_area: float

@onready var cooldown :float = 1 / attack_speed
signal attack


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	cooldown -= delta
	if(cooldown <= 0):
		cooldown = 1 / attack_speed
		attack.emit()
	
