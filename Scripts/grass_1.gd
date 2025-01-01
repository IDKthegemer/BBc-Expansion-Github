extends Node2D

@onready var key = $Key
@onready var door = $Door
@onready var basic_upgrade = $BasicUpgrade

func _ready():
	if basic_upgrade == null:
		pass
	elif Gameman.jumpup1col == true:
		basic_upgrade.queue_free()
	get_tree().paused = false
	if Gameman.Current_Level == "res://Scenes/dialouge.tscn":
		Gameman.Current_Level = "res://Scenes/Levels/grass_1.tscn"

func _process(_delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	

func _on_dienogoodzone_area_entered(_area):
	get_tree().reload_current_scene()


func _on_key_area_entered(area):
	door.queue_free()
	key.queue_free()


func _on_basic_upgrade_area_entered(area):
	Gameman.jumpup1col = true
