extends Node2D
@onready var themed_timer: Node2D = $ThemedTimer



var cheese_collected = 0
var timer_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	await themed_timer.Timer(10.0)
	timer_end = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if cheese_collected == 3:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
	
	if timer_end:
		Global.minigames_done -=1
		Global.lives -= 1
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
		

func _on_cheese_collection() -> void:
	cheese_collected = cheese_collected +1
	return


func _on_cheese_3_cheese_collected() -> void:
	cheese_collected = cheese_collected + 1
	return

func _on_cheese_2_cheese_collected() -> void:
	cheese_collected = cheese_collected + 1
