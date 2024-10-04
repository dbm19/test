extends CharacterBody2D

@export var speed = 400
var player_range
var player_sprite
var vanish_timer
var player_range_collision

func _ready():
	player_range = get_node("PlayerRange")
	player_sprite = get_node("PlayerSprite")
	vanish_timer = get_node("VanishTimer")
	player_range_collision = get_node("PlayerRange/PlayerRangeArea/PlayerRangeCollisionShape")

func _process(delta: float) -> void:
	pass

func _on_player_timer_timeout() -> void:
	player_range.visible = true
	player_sprite.visible = false
	vanish_timer.start()
	player_range_collision.set_deferred("disabled", false)

func _on_vanish_timer_timeout() -> void:
	queue_free()

func _on_player_range_area_area_entered(area: Area2D) -> void:
	if area.get_groups().size() > 0:
		if area.is_in_group("mob"):
			area.queue_free()
