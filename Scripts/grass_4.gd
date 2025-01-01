extends Node2D



func _ready():
	get_tree().paused = false
	if Gameman.Current_Level == "res://Scenes/Levels/grass_3.tscn":
		Gameman.Current_Level = "res://Scenes/Levels/grass_4.tscn"

func _process(delta):
	pass


func _on_dienogoodzone_area_entered(area):
	get_tree().reload_current_scene()
