extends Area2D

var direction : Vector2 = Vector2.RIGHT
var speed : float = 300

func _physics_process(delta):
	position += direction * speed * delta

func _on_screen_exited():
	queue_free()

func fire_ball_hit():
	pass # Just need to know it hit

func _on_area_entered(area):
	queue_free() # On collision, remove from queue
