extends CharacterBody2D

const BULLET_SCENE = preload("res://elements/enemy_bullet/enemy_bullet.tscn")
@onready var reycastLeft := $RayCastLeft
@onready var reycastRight := $RayCastRight

func _physics_process(delta: float) -> void:
	if reycastLeft.is_colliding() or reycastRight.is_colliding():
		get_tree().call_group("enemy_group", "change_direction")

func destroy():
	queue_free()

func shot() -> void:
	var bullet = BULLET_SCENE.instantiate()
	bullet.global_position += global_position + Vector2(0, 10)
	add_child(bullet)
