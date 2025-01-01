extends Node2D

@onready var label = $ColorRect2/Label
@onready var sprite_2d = $ColorRect2/Sprite2D

var currentdialouge = 0
func _ready():
	get_tree().paused = false
	if Gameman.Current_Level == "res://Scenes/Levels/grass_4.tscn":
		Gameman.Current_Level = "res://Scenes/dialouge_2.tscn"
	
func _physics_process(delta):
	if Input.is_action_just_pressed("Click"):
		currentdialouge += 1
		if currentdialouge == 1:
			label.text = "You're back, again"
			sprite_2d.texture = load("res://Assets/Art/TimeFrog.png")
		if currentdialouge == 2:
			label.text = "I hate you, but I got your 'Magical' brownie"
			sprite_2d.texture = load("res://Assets/Art/Player/DeadBug.png")
		if currentdialouge == 3:
			label.text = "heyy what did I do,
			 I brought you back from, well you know"
			sprite_2d.texture = load("res://Assets/Art/TimeFrog.png")
		if currentdialouge == 4:
			label.text = "From death?"
			sprite_2d.texture = load("res://Assets/Art/Player/DeadBug.png")
		if currentdialouge == 5:
			label.text = "That time machine killed you"
			sprite_2d.texture = load("res://Assets/Art/TimeFrog.png")
		if currentdialouge == 6:
			label.text = "I graduated and went into that alley and then died,
			 what do these brownies do, bring me back?"
			sprite_2d.texture = load("res://Assets/Art/Player/DeadBug.png")
		if currentdialouge == 7:
			label.text = "We'll see"
			sprite_2d.texture = load("res://Assets/Art/TimeFrog.png")
		await get_tree().create_timer(4.5)
		if currentdialouge == 8:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_tree().change_scene_to_file("res://Scenes/Levels/level_2.tscn")
