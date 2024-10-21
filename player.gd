extends CharacterBody2D

var player_range
var player_sprite
var shoot_timer
var player_range_collision

var bullet_scene = preload("res://bullet.tscn")
var bullet_instance

var enemy_dict = {}

func _ready():
	bullet_instance = bullet_scene.instantiate()
	player_range = get_node("PlayerRange")
	player_sprite = get_node("PlayerSprite")
	shoot_timer = get_node("ShootTimer")
	player_range_collision = get_node("PlayerRange/PlayerRangeArea/PlayerRangeCollisionShape")

func _process(delta: float) -> void:
	print(enemy_dict)

func _on_shoot_timer_timeout() -> void:
	bullet_instance = bullet_scene.instantiate()
	add_child(bullet_instance)

func _on_player_range_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("mob"):
		enemy_dict[area] = area.position

func _on_player_range_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("mob"):
		enemy_dict.erase(area)
