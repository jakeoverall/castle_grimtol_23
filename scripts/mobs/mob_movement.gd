extends Node

class_name MobMovement

@export var speed: float = 100
@export var target_ref: Node2D
@export var mob_ref: Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if target_ref != null:
		mob_ref.position = mob_ref.position.move_toward(target_ref.position, delta * speed)
	
