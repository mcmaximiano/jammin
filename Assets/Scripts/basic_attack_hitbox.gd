extends Area2D

@export var damage : int = 10

@onready var current_level:Node2D = get_parent().current_level

func _ready():
	self.visible = false

func _on_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			child.hit(damage)
			current_level.update_ui_hp(1)
