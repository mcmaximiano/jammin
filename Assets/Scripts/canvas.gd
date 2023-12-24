extends CanvasLayer
class_name UI

@onready var hp_label = %Label

func update_hp_label(value):
	hp_label.text = "Health: " + str(value)
