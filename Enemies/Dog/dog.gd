extends "res://Enemies/Enemy_base/enemy_base.gd"

@onready var floorinator = $Floorinator
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	pass
	
	
func _physics_process(delta):
	super._physics_process(delta)
	
	if is_on_floor() == false:
		velocity.y += gravity * delta
	else:
		velocity.x = speed * facing
		
	move_and_slide()
	
	if is_on_floor() == true:
		if is_on_wall() == true or floorinator.is_colliding() == false:
			flip()
		
func flip() -> void:
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
	floorinator.position.x = floorinator.position.x * -1
	
	if facing == Facing.Left:
		facing = Facing.Right
	else:
		facing = Facing.Left
	
	
