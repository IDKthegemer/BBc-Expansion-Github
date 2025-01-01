extends Node

enum BULLET_KEY { PLAYER, ENEMY }
enum SCENE_KEY { EXPLOSION, COINS }

const SIMPLESCENES = {
	SCENE_KEY.EXPLOSION: preload("res://Scenes/enemy_explosion.tscn"),
	SCENE_KEY.COINS: preload("res://Scenes/Levels/LevelAssets/fruitpickup.tscn")
}

const BULLETS = {
	BULLET_KEY.PLAYER: preload("res://Scenes/Player/playerbulet.tscn"),
	BULLET_KEY.ENEMY: preload("res://Scenes/enemy_bullet.tscn")
}

func addchild(childtoadd) -> void:
	get_tree().root.add_child(childtoadd)
	
func calladdchild(childtoadd) -> void:
	call_deferred("addchild",childtoadd)
	
func bulletmaker(speed: float, direction: Vector2, startpos: Vector2,
			lifespan: float, key: BULLET_KEY) -> void:
	var newbull = BULLETS[key].instantiate()
	newbull.setup(direction, lifespan, speed)
	newbull.global_position = startpos
	calladdchild(newbull)
	
func create_simple_scene(startpos: Vector2, key: SCENE_KEY) -> void:
	var newx = SIMPLESCENES[key].instantiate()
	newx.global_position = startpos
	calladdchild(newx)
