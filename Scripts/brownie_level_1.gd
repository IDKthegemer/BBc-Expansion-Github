extends Node2D

@onready var player = $Player
@onready var brownie = $Area2D

func _on_area_2d_area_entered(area):
	get_tree().change_scene_to_file("res://Scenes/dialouge_2.tscn")


func _on_area_2d_2_area_entered(area):
	get_tree().reload_current_scene()
