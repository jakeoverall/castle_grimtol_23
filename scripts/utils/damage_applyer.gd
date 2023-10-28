extends Node

class_name DamageApplyer

@export var parent_ref: Node


func apply_damage_to(node: Node, damage: float):
	print('apply_damage_to')
	var health: Health = node.get_node("Health") as Health

	if health == null:
		return

	health.recieve_damage(parent_ref, damage)
