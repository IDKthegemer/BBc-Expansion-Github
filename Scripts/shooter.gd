extends Node2D

@onready var shoot_timer = $"shit timer"
@onready var sounds = $Sounds

@export var speed: float = 50000
@export var lifespan: float = 10.0
@export var bulletype: Mastercummer.BULLET_KEY
@export var delay = 0.7
var canshoot: bool = true

func _ready():
	shoot_timer.wait_time = delay

func shoot(direction: Vector2) -> void:
	if canshoot == false:
		return
	canshoot = false
	Soundman.play_clip(sounds, Soundman.SOUNDSHOOT)
	Mastercummer.bulletmaker(
		speed, direction, global_position, lifespan, bulletype
	)
	shoot_timer.start()
func _on_shit_timer_timeout():
	canshoot = true
