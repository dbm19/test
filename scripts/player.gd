extends CharacterBody2D

var player_range
var player_sprite
var shoot_timer
var player_range_collision

var bullet_scene = preload("res://scenes/bullet.tscn")
var bullet_instance

var enemy_array = []
var enemy_target

func _ready():
	player_range = get_node("PlayerRange")
	player_sprite = get_node("PlayerSprite")
	shoot_timer = get_node("ShootTimer")
	player_range_collision = get_node("PlayerRange/PlayerRangeArea/PlayerRangeCollisionShape")

func _process(delta: float) -> void:
	if enemy_array.is_empty():
		shoot_timer.stop()

func _on_shoot_timer_timeout() -> void:
	enemy_target = get_nearest_enemy()
	Global.mob_position = enemy_target.position
	bullet_instance = bullet_scene.instantiate()
	add_child(bullet_instance)


func _on_player_range_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("mob"):
		enemy_array.append(area)
		shoot_timer.start()

func _on_player_range_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("mob"):
		enemy_array.erase(area)

func get_nearest_enemy():
	var nearest_enemy = null
	var distance = INF
	
	for enemy in enemy_array:
		if global_position.distance_to(enemy.global_position) < distance:
			distance = global_position.distance_to(enemy.global_position)
			nearest_enemy = enemy

	return nearest_enemy
