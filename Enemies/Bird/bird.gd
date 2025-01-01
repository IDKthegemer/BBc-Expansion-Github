extends "res://Enemies/Enemy_base/enemy_base.gd"

@onready var playerinator = $playerinator
@onready var dirtim = $dirtim
@onready var anisprite = $AnimatedSprite2D
@onready var shooter = $Shooter

const flyspeed: Vector2 = Vector2(90, 20)
var flydir: Vector2 = Vector2.ZERO

func _physics_process(delta):
	super._physics_process(delta)
	velocity = flydir
	move_and_slide()
	shoot()
	
	
func  set_and_flip() -> void:
	var x_dir = sign(player_ref.global_position.x - global_position.x)
	if x_dir > 0:
		anisprite.flip_h = false
	else:
		anisprite.flip_h = true
	flydir = Vector2(x_dir, 1) * flyspeed
	
func fly_to_player() -> void:
	set_and_flip()
	dirtim.start()
func _on_visible_on_screen_notifier_2d_screen_entered():
	anisprite.play("Fly")
	fly_to_player()


func _on_dirtim_timeout():
	fly_to_player()
	
func shoot() -> void:
	if playerinator.is_colliding() == true:
		shooter.shoot(
			global_position.direction_to(player_ref.global_position)
		)
