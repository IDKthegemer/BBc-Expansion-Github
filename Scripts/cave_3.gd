extends Node2D

@onready var basic_upgrade: Area2D = $BasicUpgrade

func _ready():
	if Gameman.walkspeedup == true:
		basic_upgrade.queue_free()
	get_tree().paused = false
	if Gameman.Current_Level == "res://Scenes/Levels/cave_2.tscn":
		Gameman.Current_Level = "res://Scenes/Levels/cave_3.tscn"


func _on_area_2d_area_entered(area: Area2D) -> void:
	get_tree().reload_current_scene()


func _on_basic_upgrade_area_entered(area: Area2D) -> void:
	Gameman.walkspeedup = true
