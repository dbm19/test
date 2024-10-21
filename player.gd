extends CharacterBody2D

var player_range
var player_sprite
var shoot_timer
var player_range_collision

var bullet_scene = preload("res://bullet.tscn")
var bullet_instance

var enemy_dict = {}
var enemies_in_range = false
var enemy_target

func _ready():
	player_range = get_node("PlayerRange")
	player_sprite = get_node("PlayerSprite")
	shoot_timer = get_node("ShootTimer")
	player_range_collision = get_node("PlayerRange/PlayerRangeArea/PlayerRangeCollisionShape")

func _process(delta: float) -> void:
	print(enemy_dict)
	if enemy_dict.is_empty():
		shoot_timer.stop()

func _on_shoot_timer_timeout() -> void:
	bullet_instance = bullet_scene.instantiate()
	add_child(bullet_instance)
	Global.mob_position = enemy_target.position

func _on_player_range_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("mob"):
		enemy_target = area
		enemy_dict[enemy_target] = enemy_target.position
		enemies_in_range = true
		shoot_timer.start()

func _on_player_range_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("mob"):
		enemy_dict.erase(enemy_target)
