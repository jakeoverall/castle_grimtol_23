extends Node

class_name CharacterMovement

@export var speed: float = 100

@export var character_ref: Node2D

@export_category("Inputs")
@export var character_up: String = "character_up"
@export var character_down: String = "character_down"
@export var character_left: String = "character_left"
@export var character_right: String = "character_right"


func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed(character_up):
		direction.y -= 1
	if Input.is_action_pressed(character_down):
		direction.y += 1
	if Input.is_action_pressed(character_right):
		direction.x += 1
	if Input.is_action_pressed(character_left):
		direction.x -= 1

	character_ref.position += direction * delta * speed
