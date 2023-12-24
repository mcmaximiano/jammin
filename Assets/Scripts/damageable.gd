extends Node

class_name Damageable

@export var this_health : int :
	get:
		return this_health
	set(value):
		SignalBus.emit_signal("on_health_changed", get_parent(), value-this_health)
		this_health = value

func hp_changed(damage : int):
	this_health += damage
	
	if (this_health <= 0):
		get_parent().queue_free()
