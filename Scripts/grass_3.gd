extends Node2D

@onready var player = $Player
@onready var door = $Door
@onready var basic_upgrade = $BasicUpgrade

# Called when the node enters the scene tree for the first time.
func _ready():
	if basic_upgrade == null:
		pass
	elif Gameman.jumpup2col == true:
		basic_upgrade.queue_free()
	get_tree().paused = false
	if Gameman.Current_Level == "res://Scenes/Levels/grass_2.tscn":
		Gameman.Current_Level = "res://Scenes/Levels/grass_3.tscn"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	door_delete()

func door_delete():
	if door == null:
		return
	if player.coins >= 15:
		door.queue_free()

func _on_basic_upgrade_area_entered(area):
	Gameman.jumpup2col = true


func _on_dienogoodzone_area_entered(area):
	get_tree().reload_current_scene()
