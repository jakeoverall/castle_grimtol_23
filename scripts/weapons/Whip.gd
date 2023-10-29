extends Node2D

@export var hitbox_ref : Area2D
@export var damage_applyer_ref : DamageApplyer
@export var weapon_base_ref: WeaponBase
@export var sprite_ref: AnimatedSprite2D
@export var damage : float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	weapon_base_ref.attack.connect(onAttack)
	sprite_ref.animation_finished.connect(onSpriteFinished)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func onAttack():
	print('attacking')
	sprite_ref.show()
	sprite_ref.play()
	var overlaps = hitbox_ref.get_overlapping_areas()
	for overlap_node in overlaps:
		if overlap_node.is_in_group("enemies"):
			damage_applyer_ref.apply_damage_to(overlap_node, damage)

func onSpriteFinished():
	sprite_ref.hide()
