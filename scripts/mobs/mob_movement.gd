extends Node

class_name MobMovement

@export var speed: float = 100
@export var target_ref: Node2D
@export var mob_ref: Node2D
@export var slowdown_timer: Timer

var slowed:bool

func _ready():
	slowdown_timer.connect('timeout', _on_slowdown_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if target_ref != null: 
		mob_ref.position = mob_ref.position.move_toward(target_ref.position, delta * speed * (.60 if slowed else 1.0))

func slowdown(other: Node2D):
	if other.is_in_group('player') or other.is_in_group('weapon'):
		slowed = true
		slowdown_timer.start()
	
func _on_slowdown_timeout():
	slowed = false
