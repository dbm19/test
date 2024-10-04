extends CharacterBody2D

@export var speed = 400
var player_range
var player_sprite
var vanish_timer

func _ready():
	player_range = get_node("PlayerRange")
	player_sprite = get_node("PlayerSprite")
	vanish_timer = get_node("VanishTimer")

func _process(delta: float) -> void:
	pass


func _on_player_timer_timeout() -> void:
	player_range.visible = true
	player_sprite.visible = false
	vanish_timer.start()

func _on_vanish_timer_timeout() -> void:
	queue_free()
