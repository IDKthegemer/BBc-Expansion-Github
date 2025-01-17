extends CharacterBody2D

class_name Player

@onready var Life = $LifeLabel
@onready var Menu = $Menu
@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var sounds = $Sounds
@onready var shooter = $Shooter
@onready var invinc = $Invincibility
@onready var ahhparytheplatypusthisismy_sigmainator = $AhhparytheplatypusthisismySIGMAINATOR
@onready var hurt_timer = $HurtTimer
@onready var Coins = $CoinsLabel
@onready var coyote_timer = $CoyoteTimer
@onready var upgrademenu = $Menu/UpgradeMenu
@onready var jump_up_1 = $Menu/UpgradeMenu/JumpUp1
@onready var jump_up_2 = $Menu/UpgradeMenu/JumpUp2
@onready var bullet_speed = $Menu/UpgradeMenu/BulletSpeed
@onready var walk_speed: CheckButton = $Menu/UpgradeMenu/WalkSpeed
@onready var gravity_down: CheckButton = $Menu/UpgradeMenu/GravityDown
@onready var Settingmenu: ColorRect = $Menu/SettingMenu
@onready var volume: HSlider = $Menu/SettingMenu/Volume

enum PLAYER_STATE { idle, run, jump, fall, hurt}

const MAXFALL: float = 400
const INVINCFRAMES: float = 0.32

var jumpvelochurt: float = -100
var jumpveloc: float = -300
var runspeed: float = 150
var life: float = 3
var state: PLAYER_STATE = PLAYER_STATE.idle 
var invincinble: bool = false
var coins = 0
var can_move: bool = true
var Jump_timer = 0.0
var gravity = 250
var in_menu = false

var upgrades: Dictionary = {
	jump1        = false,
	jump2        = false,
	bullet_speed = false,
	walk_speed   = false,
	grav_down    = false
}


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	volume.value = Gameman.volume_bar_value
	upgrades = Gameman.gm_upgrades
	refresh_buttons()
	
	upgrademenu.hide()
	Settingmenu.hide()
	Menu.hide()
	
	jump_up_1.hide()
	jump_up_2.hide()
	bullet_speed.hide()
	walk_speed.hide()
	gravity_down.hide()

func _physics_process(delta):
	Gameman.volume = volume.value
	if life == 0:
		await get_tree().create_timer(1).timeout
		get_tree().reload_current_scene()
		life = 3
	var was_on_floor = is_on_floor()
	if Input.is_action_just_pressed("Jump") == true:
		Jump_timer = 0.1
	Jump_timer -= delta
	if is_on_floor() == false || !coyote_timer.is_stopped() == false:
		velocity.y += gravity * delta
	if Gameman.jumpup1col == true:
		jump_up_1.show()
	if Gameman.jumpup2col == true:
		jump_up_2.show()
	if Gameman.bullspeedcol == true:
		bullet_speed.show()
	if Gameman.walkspeedup == true:
		walk_speed.show()
	if Gameman.gravitydown == true:
		gravity_down.show()

	if Input.is_action_just_pressed("Shoot") == true:
		shoot()
	Life.text = str(life)
	Coins.text = str(coins)
	get_input()
	move_and_slide()
	
	if was_on_floor && !is_on_floor():
		coyote_timer.start()
	calculate_states()


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Esc"):
		if in_menu == false:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Menu.show()
			get_tree().paused = true
			in_menu = true
		elif in_menu == true:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			upgrademenu.hide()
			get_tree().paused = false
			in_menu = false
	
	if event.is_action_released("Jump"):
		if velocity.y < 0.0:
			velocity *= 0.5

func shoot() -> void:
	if sprite.flip_h == true:
		shooter.shoot(Vector2.LEFT)
	else:
		shooter.shoot(Vector2.RIGHT)
	
func get_input() -> void:

	if state == PLAYER_STATE.hurt:
		return
	
	velocity.x = 0
	if can_move == true:
		if Input.is_action_pressed("Left") == true:
			velocity.x = -runspeed
			sprite.flip_h = true
		elif Input.is_action_pressed("Right") == true:
			velocity.x = +runspeed
			sprite.flip_h = false

		if Input.is_action_just_pressed("Jump") == true:
			if is_on_floor() == true and Jump_timer > 0:
				Jump_timer = 0.0
				velocity.y = jumpveloc
				Soundman.play_clip(sounds, Soundman.SOUNDJUMP)
				velocity.y = clampf(jumpveloc, velocity.y, MAXFALL)

func calculate_states() -> void:
	
	if state == PLAYER_STATE.hurt:
		return
	if is_on_floor() == true:
		if velocity.x == 0:
			set_state(PLAYER_STATE.idle)
		else:
			set_state(PLAYER_STATE.run)
	else:
		if velocity.y > 0:
			set_state(PLAYER_STATE.fall)
		else:
			set_state(PLAYER_STATE.jump)
			
func set_state(new_state: PLAYER_STATE) -> void:
	if new_state == state:
		return
	if state == PLAYER_STATE.fall:
		if new_state == PLAYER_STATE.idle or new_state == PLAYER_STATE.run:
			Soundman.play_clip(sounds, Soundman.SOUNDLAND)
		
	state = new_state
	
	match state:
		PLAYER_STATE.idle:
			animation_player.play("Idle")
		PLAYER_STATE.run:
			animation_player.play("Run")
		PLAYER_STATE.jump:
			animation_player.play("jump")
		PLAYER_STATE.fall:
			animation_player.play("fall")
			
#https://www.tiktok.com/@linemaster3/video/7227636117279968538
func getpatrickbatemanjumps() -> void:
	set_state(PLAYER_STATE.hurt)
	animation_player.play("Hurt")
	velocity.y = jumpvelochurt
	hurt_timer.start()

func go_patrickbateman_sigma_mode() -> void:
	invincinble = true
	invinc.play("Invincible")
	ahhparytheplatypusthisismy_sigmainator.start()

func applyhit() -> void:
	if invincinble == true:
		return
		
	life -= 1
	go_patrickbateman_sigma_mode()
	getpatrickbatemanjumps()
	Soundman.play_clip(sounds, Soundman.SOUNDHURT)

func refresh_buttons():
	jump_up_1.button_pressed    = upgrades.jump1
	jump_up_2.button_pressed    = upgrades.jump2
	bullet_speed.button_pressed = upgrades.bullet_speed
	walk_speed.button_pressed   = upgrades.walk_speed
	gravity_down.button_pressed = upgrades.grav_down
	
	_on_jump_up_1_pressed()
	_on_jump_up_2_pressed()
	_on_bullet_speed_pressed()
	_on_walk_speed_pressed()
	_on_gravity_down_pressed()

func _on_hithox_area_entered(_area):
	applyhit()

func _on_ahhparytheplatypusthisismy_sigmainator_timeout():
	invincinble = false
	invinc.stop()

func _on_hurt_timer_timeout():
	set_state(PLAYER_STATE.idle)

func _on_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Levels/mainmenu.tscn")
func _on_button_2_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Menu.hide()
	get_tree().paused = false
func _on_button_3_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
func GetCoins():
	coins += 1
func _on_button_4_pressed():
	upgrademenu.show()

func _on_close_button_pressed():
	upgrademenu.hide()

func _on_jump_up_1_pressed():
	if jump_up_1.button_pressed == true:
		jumpveloc -= 40
		upgrades.jump1 = true
	elif  jump_up_1.button_pressed == false:
		jumpveloc += 40
		upgrades.jump1 = true

func _on_jump_up_2_pressed():
	if jump_up_2.button_pressed == true:
		jumpveloc -= 45
		upgrades.jump2 = true
	elif  jump_up_2.button_pressed == false:
		jumpveloc += 45
		upgrades.jump2 = false

func _on_bullet_speed_pressed():
	if bullet_speed.button_pressed == true:
		shooter.speed += 200
		upgrades.bullet_speed = true
	elif bullet_speed.button_pressed == false:
		shooter.speed -= 200
		upgrades.bullet_speed = false

func _on_walk_speed_pressed() -> void:
	if walk_speed.button_pressed == true:
		runspeed = 200
		upgrades.walk_speed = true
	if walk_speed.button_pressed == false:
		runspeed = 150
		upgrades.walk_speed = false

func _on_gravity_down_pressed() -> void:
	if gravity_down.button_pressed == true:
		gravity = 170
		upgrades.grav_down = true
	if gravity_down.button_pressed == false:
		gravity = 250
		upgrades.grav_down = false

func _on_button_5_pressed() -> void:
	Settingmenu.show()

func _on_close_2_pressed() -> void:
	Settingmenu.hide()
