extends HBoxContainer

var rect_scene = preload("res://elements/lives_bar/live_rect.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.lives_changed.connect(update_lives)
	update_lives(Globals.lives)

func update_lives(lives: int):
	if lives < 0:
		return
	var diff = lives - get_child_count()
	for i in range(abs(diff)):
		add_lives() if diff > 0 else remove_live()
	

func add_lives():
	add_child(rect_scene.instantiate())
	
func remove_live():
 	get_child(0).queue_free()
