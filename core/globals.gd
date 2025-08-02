extends Node

var points = 0
var lives = 3

func change_points(diff: int) -> void:
	points += diff
	Events.points_chandged.emit(points)

func change_lives(diff: int) -> void:
	lives -= diff
	Events.lives_changed.emit(lives)
