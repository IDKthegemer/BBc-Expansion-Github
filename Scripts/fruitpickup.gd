extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D

const COINS: Array = ["red", "yellow"]
const GRAVITY: float = 50
const JUMP: float = -32
const POINTS: int = 2

var starty: float
var speedy: float = JUMP
var stop: bool = false

func _ready():
	starty = global_position.y
	animated_sprite_2d.play(COINS.pick_random())



func _process(delta):
	if stop == true:
		return
		
	position.y += speedy * delta
	speedy += GRAVITY * delta
	
	if global_position.y > starty:
		stop = true

func death() -> void:
	set_process(false)
	hide()
	queue_free()
	
func _on_body_entered(body):
	if body.has_method("GetCoins"):
		body.GetCoins()
		death()
