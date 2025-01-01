extends Area2D

var direction: Vector2 = Vector2(20000, 0)
var life: float = 20.0
var lifetime: float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	funkymilk(delta)
	position += direction * delta

	
func funkymilk(delta: float) -> void:
	life += delta
	if lifetime > life:
		queue_free()

func setup(dir: Vector2, life_span: float, speed: float) -> void:
	direction = dir.normalized() * speed 
	life = life_span


func _on_area_entered(_area):
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
