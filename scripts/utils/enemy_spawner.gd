extends Node

@export var mobs: Array[MobBase] = []
@export var max_mobs: int = 40
@export var mob_interval: float = .2
@export var mob_timer: Timer
@export var mob_scene: PackedScene
@export var mob_spawn_location_ref: PathFollow2D
@export var player_ref: Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	mob_timer.connect("timeout", _on_mob_timer_timeout)
	mob_timer.start(mob_interval)


func _on_mob_timer_timeout():
	if mobs.size() >= max_mobs:
		return
	print('spawn mob')
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate() as MobBase
	mob.target_ref = player_ref
	# Choose a random location on Path2D.
	
	mob_spawn_location_ref.progress_ratio = randf()
	
	# Set the mob's position to a random location.
	mob.position = mob_spawn_location_ref.position
	
	mob.on_death.connect(func (): mobs.erase(mob))
	
	add_child(mob)
	mobs.append(mob)
