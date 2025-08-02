extends Node2D

const ROW_STEP = 10.0
const SPEED_BOOST = 2.5

@onready var timerBlock = $Timer
@onready var timerShot = $TimerShot

var direction := Vector2.RIGHT
var speed := 5

func _process(delta: float) -> void:
	global_position += direction * speed * delta
	

func change_direction() -> void:
	if timerBlock.time_left > 0:
		return
	direction = Vector2.LEFT if direction == Vector2.RIGHT else Vector2.RIGHT
	global_position.y += ROW_STEP
	speed += SPEED_BOOST
	timerBlock.start()


func _on_timer_shot_timeout() -> void:
	var enemies = get_tree().get_nodes_in_group("enemy")
	if enemies.size() > 0:
		enemies.pick_random().shot()
