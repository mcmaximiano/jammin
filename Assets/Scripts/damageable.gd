extends Node

class_name Damageable

@export var this_health : int = 20

func hit(damage : int):
	this_health -= damage
	
	if (this_health <= 0):
		get_parent().queue_free()
