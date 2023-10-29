extends Area2D

@export_category("Mob Config")
@export var speed : float = 100
@export var health : float = 1
@export var damage : float = 1
@export var gold : float = 1
@export var experience : float = 1
# @export var sprite : float = 100

@export_category("Child Refs")
@export var mob_movement_ref: MobMovement
@export var target_ref: Node2D
@export var health_ref: Health
@export var damage_applyer_ref: DamageApplyer
@export var death_particles_ref: GPUParticles2D
@export var sprite_renderer_ref: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	mob_movement_ref.speed = speed
	mob_movement_ref.target_ref = target_ref
	health_ref.health = health
	area_entered.connect(_on_area2d_entered)
	health_ref.health_expired.connect(_on_health_expired)

func _on_area2d_entered(other: Area2D):
	damage_applyer_ref.apply_damage_to(other, damage)
	mob_movement_ref.slowdown(other)

func _on_health_expired(_killed_by: Node):
	# death_particles
	
	sprite_renderer_ref.modulate.a = 0
	
	pass

