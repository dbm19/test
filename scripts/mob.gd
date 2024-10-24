extends Area2D

var direction
var speed = 100
var hit_points = 2
var mob_sprite

var tower_array = []
var tower_target
var shoot_timer
var bullet_scene = preload("res://scenes/bullet.tscn")
var bullet_instance
var resource_scene = preload("res://scenes/resource.tscn")
var resource_instance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mob_sprite = get_node("MobSprite")
	shoot_timer = get_node("ShootTimer")
	Global.mob_spawn = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = (Global.building.global_position - global_position).normalized()
	position += direction * speed * delta
	
	if hit_points == 0:
		resource_instance = resource_scene.instantiate()
		resource_instance.position = position
		resource_instance.add_to_group("resource")
		get_parent().add_child(resource_instance)
		queue_free()
		Global.mob_death.play()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("tower_bullet"):
		hit_points -= 1
		Global.mob_hit.play()
		area.queue_free()
		mob_sprite.texture = load("res://art/mob_sprite_damaged.png")
		await get_tree().create_timer(0.18).timeout
		mob_sprite.texture = load("res://art/mob_sprite.png")
	elif area.is_in_group("building"):
		self.queue_free()

func _on_mob_range_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("towers"):
		tower_array.append(area)
		shoot_timer.start()

func _on_mob_range_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("towers"):
		tower_array.erase(area)

func _on_shoot_timer_timeout() -> void:
	tower_target = get_nearest_tower()
	if tower_target:
		Global.tower_position = tower_target.position
	bullet_instance = bullet_scene.instantiate()
	bullet_instance.add_to_group("mob_bullet")
	add_child(bullet_instance)
	
func get_nearest_tower():
	var nearest_tower = null
	var distance = INF
	
	for tower in tower_array:
		if global_position.distance_to(tower.global_position) < distance:
			distance = global_position.distance_to(tower.global_position)
			nearest_tower = tower
			
	return nearest_tower
