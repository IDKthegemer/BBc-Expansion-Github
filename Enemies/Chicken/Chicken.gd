extends "res://Enemies/Enemy_base/enemy_base.gd"

@onready var anisprite = $AnimatedSprite2D
@onready var jumtim = $jumtim

const jumpveloc: Vector2 = Vector2(125, -300)
const jumpwait: Vector2 = Vector2(1, 2)

var jump: bool = false
var playerseen: bool = false
  
func _ready():
	super._ready()
	start_timer() 

func _physics_process(delta):
	super._physics_process(delta)
	if is_on_floor() == false:
		velocity.y += gravity * delta
	else:
		velocity.x = 0
		anisprite.play("idle")
	applyjum()
	move_and_slide()
	flipme()
	
	
func applyjum() -> void:
	if is_on_floor() == false:
		return
	if playerseen == false or jump == false:
		return
		
	velocity = jumpveloc
	if anisprite.flip_h == true:
		velocity.x = velocity.x * -1
	jump = false
	anisprite.play("Jump")
	start_timer()
	
func flipme() -> void:
	if(player_ref.global_position.x < global_position.x
		and anisprite.flip_h == false):
			anisprite.flip_h = true
	elif(player_ref.global_position.x > global_position.x
		and anisprite.flip_h == true):
			anisprite.flip_h = false
	
	
	
func start_timer() -> void:
	jumtim.wait_time = randf_range(jumpwait.x, jumpwait.y)
	jumtim.start()
	
	
func _on_jumtim_timeout():
	jump = true
	
	
	
func _on_visible_on_screen_notifier_2d_screen_entered():
	playerseen = true

