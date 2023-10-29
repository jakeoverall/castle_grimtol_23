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

var dead : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	mob_movement_ref.speed = speed
	mob_movement_ref.target_ref = target_ref
	health_ref.health = health
	area_entered.connect(_on_area2d_entered)
	health_ref.health_expired.connect(_on_health_expired)
	sprite_renderer_ref.play()
	death_particles_ref.emitting = false
	death_particles_ref.one_shot = true

func _process(_delta):
	if dead:
		play_death()


func _on_area2d_entered(other: Area2D):
	damage_applyer_ref.apply_damage_to(other, damage)
	mob_movement_ref.slowdown(other)

func _on_health_expired(_killed_by: Node):
	# death_particles
	dead = true
	monitorable = false
	monitoring = false
	sprite_renderer_ref.stop()
	death_particles_ref.emitting = true
	mob_movement_ref.speed = 0
	
func play_death():
	sprite_renderer_ref.modulate.a -= .01
	if sprite_renderer_ref.modulate.a <= 0:
		queue_free()
	
	
	
	

