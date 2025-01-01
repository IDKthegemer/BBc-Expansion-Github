extends Node2D

@onready var button = $AreaNames/Grass/Button
@onready var button_2 = $AreaNames/Grass/Button2
@onready var button_3 = $AreaNames/Grass/Button3
@onready var button_4 = $AreaNames/Grass/Button4
@onready var button_5 = $AreaNames/Grass/Button5
@onready var button_6 = $AreaNames/Grass/Button6
@onready var cbutton: Button = $AreaNames/Stone/Cbutton
@onready var cbutton_2: Button = $AreaNames/Stone/Cbutton2
@onready var cbutton_3: Button = $AreaNames/Stone/Cbutton3
@onready var cbutton_4: Button = $AreaNames/Stone/Cbutton4
@onready var cbutton_5: Button = $AreaNames/Stone/Cbutton5


func _ready():
	button.hide()
	button_2.hide()
	button_3.hide()
	button_4.hide()
	button_5.hide()
	button_6.hide()
	cbutton.hide()
	cbutton_2.hide()
	cbutton_3.hide()
	cbutton_4.hide()
	cbutton_5.hide()
	
	if Gameman.Current_Level == "res://Scenes/dialouge.tscn":
		button.show()
		
	elif Gameman.Current_Level == "res://Scenes/Levels/grass_1.tscn":
		button.show()
		button_2.show()
		
	elif Gameman.Current_Level == "res://Scenes/Levels/grass_2.tscn":
		button.show()
		button_2.show()
		button_3.show()
		
	elif Gameman.Current_Level == "res://Scenes/Levels/grass_3.tscn":
		button.show()
		button_2.show()
		button_3.show()
		button_4.show()
	elif Gameman.Current_Level == "res://Scenes/Levels/grass_4.tscn":
		button.show()
		button_2.show()
		button_3.show()
		button_4.show()
		button_5.show()

	elif Gameman.Current_Level == "res://Scenes/dialouge_2.tscn":
		button.show()
		button_2.show()
		button_3.show()
		button_4.show()
		button_5.show()
		button_6.show()

	elif Gameman.Current_Level == "res://Scenes/Levels/level_2.tscn":
		button.show()
		button_2.show()
		button_3.show()
		button_4.show()
		button_5.show()
		button_6.show()
		cbutton.show()
	
	elif Gameman.Current_Level == "res://Scenes/Levels/cave_1.tscn":
		button.show()
		button_2.show()
		button_3.show()
		button_4.show()
		button_5.show()
		button_6.show()
		cbutton.show()
		cbutton_2.show()

	elif Gameman.Current_Level == "res://Scenes/Levels/cave_2.tscn":
		button.show()
		button_2.show()
		button_3.show()
		button_4.show()
		button_5.show()
		button_6.show()
		cbutton.show()
		cbutton_2.show()
		cbutton_3.show()

	elif Gameman.Current_Level == "res://Scenes/Levels/cave_3.tscn":
		button.show()
		button_2.show()
		button_3.show()
		button_4.show()
		button_5.show()
		button_6.show()
		cbutton.show()
		cbutton_2.show()
		cbutton_3.show()
		cbutton_4.show()

	elif Gameman.Current_Level == "res://Scenes/Levels/cave_4.tscn":
		button.show()
		button_2.show()
		button_3.show()
		button_4.show()
		button_5.show()
		button_6.show()
		cbutton.show()
		cbutton_2.show()
		cbutton_3.show()
		cbutton_4.show()
		cbutton_5.show()

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/mainmenu.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/dialouge.tscn")

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/grass_1.tscn")

func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/grass_2.tscn")

func _on_button_4_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/grass_3.tscn")

func _on_button_5_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/grass_4.tscn")

func _on_button_6_pressed():
	get_tree().change_scene_to_file("res://Scenes/dialouge_2.tscn")

func _on_cbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level_2.tscn")

func _on_cbutton_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/cave_1.tscn")

func _on_cbutton_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/cave_2.tscn")

func _on_cbutton_4_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/cave_3.tscn")

func _on_cbutton_5_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/cave_4.tscn")
