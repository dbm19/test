extends Area2D

var tower_range
var tower_sprite
var shoot_timer
var tower_collision
var tower_range_collision

var bullet_scene = preload("res://scenes/bullet.tscn")
var bullet_instance

var enemy_array = []
var enemy_target

func _ready():
	tower_range = get_node("TowerRange")
	tower_sprite = get_node("TowerSprite")
	shoot_timer = get_node("ShootTimer")
	tower_collision = get_node("TowerCollisionShape")
	tower_range_collision = get_node("TowerRange/TowerRangeArea/TowerRangeCollisionShape")
	self.add_to_group("allied_structures")

func _process(delta: float) -> void:
	if enemy_array.is_empty():
		shoot_timer.stop()

func _on_shoot_timer_timeout() -> void:
	enemy_target = get_nearest_enemy()
	Global.mob_position = enemy_target.position
	bullet_instance = bullet_scene.instantiate()
	add_child(bullet_instance)

func _on_tower_range_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("mob"):
		enemy_array.append(area)
		shoot_timer.start()

func _on_tower_range_area_area_exited(area: Area2D) -> void:
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