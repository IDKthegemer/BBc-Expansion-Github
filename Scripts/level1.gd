extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	if Gameman.Current_Level == "res://Scenes/dialouge.tscn":
		Gameman.Current_Level = "res://Scenes/dialouge.tscn"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_dienogoodzone_area_entered(area):
	get_tree().reload_current_scene()
