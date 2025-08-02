extends CharacterBody2D

var speed = 50

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(Vector2.DOWN * delta * speed)
	if collision:
		var collider = collision.get_collider()
		if collider.has_method("take_dmg"):
			collider.take_dmg()
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
