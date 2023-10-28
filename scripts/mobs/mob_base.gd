extends Node

@export_category("Mob Config")
@export var speed : float = 100
@export var health : float = 1
@export var damage : float = 1
@export var gold : float = 1
@export var experience : float = 1
# @export var sprite : float = 100

@export_category("Child Refs")
@export var mob_movement_ref: MobMovement
@export var health_ref: Health
@export var damage_applyer_ref: DamageApplyer
@export var collider_ref: Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
	mob_movement_ref.speed = speed
	health_ref.health = health
	collider_ref.area_entered.connect(_on_area2d_entered)



func _on_area2d_entered(other: Area2D):
	damage_applyer_ref.apply_damage_to(other, damage)

