extends Area2D

@onready var color_rect = $ColorRect
@export var player = Node2D
@export var current_texture = Texture
@export var nextlevel = PackedScene
@onready var sprite_2d = $Sprite2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var portal = $"."

func _ready():
	animated_sprite_2d.visible = false
	color_rect.visible = false
func _physics_process(delta):
	sprite_2d.texture = current_texture
	
func _on_area_entered(area):
	get_tree().paused = false
	color_rect.position = portal.position
	animated_sprite_2d.position = portal.position
	player.can_move = false
	animated_sprite_2d.show()
	color_rect.show()
	animated_sprite_2d.play("default")
	portal.global_position = player.global_position
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_packed(nextlevel)
