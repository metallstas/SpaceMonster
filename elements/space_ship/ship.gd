extends CharacterBody2D

const ROCKET_SCENE = preload("res://elements/rocket/rocket.tscn")

const SPEED = 150.0

func _physics_process(delta: float) -> void:
	if (Input.is_action_just_pressed("ui_accept")):
		shot()

	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	move_and_slide()

func shot():
	var rocket = ROCKET_SCENE.instantiate()
	rocket.global_position = global_position + Vector2(0, -25)
	add_child(rocket)

func take_dmg():
	Globals.change_lives(1)
	
