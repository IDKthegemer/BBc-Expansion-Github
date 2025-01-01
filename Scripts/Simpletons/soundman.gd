extends Node

const SOUNDDEATH = "death"
const SOUNDSONG1 = "exportian"
const SOUNDHURT = "hurt"
const SOUNDJUMP = "jump"
const SOUNDKILL = "KILL"
const SOUNDSONG2 = "overworld"
const SOUNDPICKUP = "pickup"
const SOUNDSHOOT = "shoot"
const SOUNDWIN = "win"
const SOUNDLAND = "land"

var SOUND = {
	SOUNDDEATH: preload("res://Assets/Sounds/Death.wav"),
	SOUNDSONG1: preload("res://Assets/Sounds/ExportianF.wav"),
	SOUNDHURT: preload("res://Assets/Sounds/Hurt.wav"),
	SOUNDJUMP: preload("res://Assets/Sounds/Jump.wav"),
	SOUNDKILL: preload("res://Assets/Sounds/Kill.wav"),
	SOUNDSONG2: preload("res://Assets/Sounds/OverworldX.wav"),
	SOUNDPICKUP: preload("res://Assets/Sounds/Pickup.wav"),
	SOUNDSHOOT: preload("res://Assets/Sounds/Shoot.wav"),
	SOUNDWIN: preload("res://Assets/Sounds/Win.wav"),
	SOUNDLAND: preload("res://Assets/Sounds/HitGround.wav")
}

func play_clip(player: AudioStreamPlayer2D, clip_key: String):
	if SOUND.has(clip_key) == false:
		return
	player.volume_db = linear_to_db(Gameman.volume)
	player.stream = SOUND[clip_key]
	player.play()
