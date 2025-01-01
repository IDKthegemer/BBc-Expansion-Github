extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	get_tree().paused = false


func _on_button_pressed():
	get_tree().change_scene_to_file(Gameman.Current_Level)

func _on_button_3_pressed():
	get_tree().quit()

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/level_select.tscn")
