extends Node2D

@export var ui : UI

func update_ui_hp(value):
	ui.update_hp_label(value)
