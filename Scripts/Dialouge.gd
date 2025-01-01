extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var label = $ColorRect/Label
@onready var sprite_2d = $ColorRect/Sprite2D
@export_multiline var Dialougetext: Array[String]
@export var nextscene = PackedScene
var currentdialouge = 0
func _ready():
	pass
func _physics_process(delta):
	if Input.is_action_just_pressed("Click"):
		currentdialouge += 1
		if currentdialouge == 1:
			label.text = "Huh?"
			sprite_2d.texture = load("res://Assets/Art/Player/DeadBug.png")
		if currentdialouge == 2:
			label.text = "Ribbit ribbit (not bug speak)"
			sprite_2d.texture = load("res://Assets/Art/TimeFrog.png")
		if currentdialouge == 3:
			label.text = "HUH?"
			sprite_2d.texture = load("res://Assets/Art/Player/DeadBug.png")
		if currentdialouge == 4:
			label.text = "Im just kidding
			but apparently you are dead right?"
			sprite_2d.texture = load("res://Assets/Art/TimeFrog.png")
		if currentdialouge == 5:
			label.text = "correctumundo"
			sprite_2d.texture = load("res://Assets/Art/Player/DeadBug.png")
		if currentdialouge == 6:
			label.text = "well I might need you to go back somewhere
			and get me something."
			sprite_2d.texture = load("res://Assets/Art/TimeFrog.png")
		if currentdialouge == 7:
			label.text = "well what do you need?"
			sprite_2d.texture = load("res://Assets/Art/Player/DeadBug.png")
		if currentdialouge == 8:
			label.text = "Some of these really good brownies"
			sprite_2d.texture = load("res://Assets/Art/TimeFrog.png")
		if currentdialouge == 9:
			label.text = "Oh well what do I get?"
			sprite_2d.texture = load("res://Assets/Art/Player/DeadBug.png")
		if currentdialouge == 10:
			label.text = "Life again I guess, okay now im gonna go send bye for a bit"
			sprite_2d.texture = load("res://Assets/Art/TimeFrog.png")
		if currentdialouge == 11:
			animation_player.play("Whiterectanimation")

func _on_animation_player_animation_finished(Whiterectanimation):
	get_tree().change_scene_to_packed(nextscene)
