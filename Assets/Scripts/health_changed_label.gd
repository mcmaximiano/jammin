extends Label

@export var float_speed : Vector2 = Vector2(0, -1)
@export var lifetime : int = 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += float_speed
	lifetime -= 1
	if lifetime <= 0:
		queue_free()
