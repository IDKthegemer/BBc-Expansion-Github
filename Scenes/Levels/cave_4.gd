extends Node2D

@onready var basic_upgrade: Area2D = $BasicUpgrade


func _ready() -> void:
	if Gameman.gravitydown == true:
		basic_upgrade.queue_free()
	if Gameman.Current_Level == "res://Scenes/Levels/cave_3.tscn":
		Gameman.Current_Level = "res://Scenes/Levels/cave_4.tscn"


func _on_basic_upgrade_area_entered(area: Area2D) -> void:
	Gameman.gravitydown = true
