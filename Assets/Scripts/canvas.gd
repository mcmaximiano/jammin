extends CanvasLayer
class_name UI

@onready var hp_label = %Label

var hp = 5

func update_hp(value):
	hp += value
	update_hp_label()
	
func update_hp_label():
	hp_label.text = "Health: " + str(hp)
