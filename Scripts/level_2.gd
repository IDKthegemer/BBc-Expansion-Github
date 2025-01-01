extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Gameman.Current_Level == "res://Scenes/dialouge_2.tscn":
		Gameman.Current_Level = "res://Scenes/Levels/level_2.tscn"
	Gameman.Current_Level = "res://Scenes/Levels/level_2.tscn"
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
