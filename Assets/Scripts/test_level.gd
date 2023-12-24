extends Node2D

@onready var ui : Node = %UI

func update_ui_hp(value):
	ui.update_hp_label(value)
