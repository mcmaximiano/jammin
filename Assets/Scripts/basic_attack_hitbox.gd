extends Area2D

@export var damage : int = 1

@onready var current_level:Node2D = get_parent().current_level

func _ready():
	self.visible = false

func _on_body_entered(body):
	for enemychild in body.get_children():
		if enemychild is Damageable:
			enemychild.hp_changed(-damage)
			
			for playerchild in get_parent().get_children():
				if playerchild is Damageable:
					playerchild.hp_changed(damage)
					current_level.update_ui_hp(playerchild.this_health)
