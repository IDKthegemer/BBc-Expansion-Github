extends CharacterBody2D
class_name enemybase

enum Facing { Left = -1, Right = 1}
const OFFSCREEN: float = 1000
@export var defaultdir: Facing = Facing.Left 
@export var points: int = 1
@export var speed: float = 70
@export var health: int
var gravity: float = 800
var facing: Facing = defaultdir
var player_ref: Player
func _ready():
	player_ref = get_tree().get_nodes_in_group(Gameman.GROUP_PLAYER)[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if health == 0:
		die()
	fallend_off()

func fallend_off() -> void:
	if global_position.y > OFFSCREEN:
		hide()
	
func die():
	Signalman.on_enemy_hit.emit(points, global_position)
	Mastercummer.create_simple_scene(global_position, Mastercummer.SCENE_KEY.EXPLOSION)
	Mastercummer.create_simple_scene(global_position, Mastercummer.SCENE_KEY.COINS)
	set_physics_process(false)
	hide()
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_entered():
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited():
	pass


func _on_hithox_area_entered(area):
	health -= 1
