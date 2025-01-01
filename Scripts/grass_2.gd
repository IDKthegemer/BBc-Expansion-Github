extends Node2D

@onready var player = $Player
@onready var bigpurp = $Enemies/Bigpurp
@onready var door = $Door
@onready var basic_upgrade = $BasicUpgrade

func _ready():
	if basic_upgrade == null:
		pass
	elif Gameman.bullspeedcol == true:
		basic_upgrade.queue_free()
	get_tree().paused = false
	if Gameman.Current_Level == "res://Scenes/Levels/grass_1.tscn":
		Gameman.Current_Level = "res://Scenes/Levels/grass_2.tscn"

func _process(_delta):
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _on_dienogoodzone_area_entered(area):
	get_tree().reload_current_scene()


func _on_bigpurp_hidden():
	door.queue_free()


func _on_basic_upgrade_area_entered(area):
	Gameman.bullspeedcol = true
