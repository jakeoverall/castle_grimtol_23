extends Node

class_name Health

signal health_changed(prev: float, new: float)
signal health_expired(from: Node)

@export var health: float = 1


func recieve_damage(from: Node, amount: float):
	print('ouch')
	
	var prev = health
	health -= amount
	health_changed.emit(prev, health)
	if health <= 0:
		health_expired.emit(from)
