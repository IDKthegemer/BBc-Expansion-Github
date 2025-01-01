extends Node

const GROUP_PLAYER: String =  "Player"
@onready var Current_Level = "res://Scenes/dialouge.tscn"
@onready var jumpup1col = false
@onready var jumpup2col = false
@onready var bullspeedcol = false
@onready var walkspeedup = false
@onready var gravitydown = false

var volume: int
var volume_bar_value: float = 2 # default value

var upgrades: Dictionary = {
	jump1    = false,
	jump2    = false,
	bullet_speed = false,
	walk_speed   = false,
	grav_down    = false
}
