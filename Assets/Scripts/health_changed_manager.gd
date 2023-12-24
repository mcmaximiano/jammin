extends Control

@export var health_changed_label : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("on_health_changed", on_signal_health_changed)

func on_signal_health_changed(node : Node, amount_changed : int):
	var label_instance : Label = health_changed_label.instantiate()
	node.add_child(label_instance)
	label_instance.text = str(amount_changed)
	if amount_changed >= 0:
		label_instance.modulate = Color(0.0,1.0,0.0,1.0)
	else:
		label_instance.modulate = Color(1.0,0.0,0.0,1.0)
