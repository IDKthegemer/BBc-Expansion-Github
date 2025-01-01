extends AnimatedSprite2D


func _ready():
	pass
	
func _physics_process(_delta):
	pass
	
func _on_animation_finished():
	queue_free()
