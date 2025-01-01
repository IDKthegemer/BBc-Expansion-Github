extends Node2D


func _ready():
	get_tree().paused = false
	if Gameman.Current_Level == "res://Scenes/Levels/level_2.tscn":
		Gameman.Current_Level = "res://Scenes/Levels/cave_1.tscn"


func _on_area_2d_area_entered(area: Area2D) -> void:
	get_tree().reload_current_scene()
