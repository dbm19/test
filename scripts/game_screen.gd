extends Node2D

var mouse_position

var tower_scene = preload("res://scenes/tower.tscn")
var tower_instance

var building_visual_scene = preload("res://scenes/tower_hologram.tscn")
var building_visual_instance

var mob_scene = preload("res://scenes/mob.tscn")
var mob_instance
var mob_spawn_path_follow

var rng = RandomNumberGenerator.new()
var random_progress

var building

var camera


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	building_visual_instance = building_visual_scene.instantiate()
	add_child(building_visual_instance)
	building = get_node("Building")
	Global.building = building
	building.add_to_group("allied_structures")
	building.add_to_group("building")
	mob_spawn_path_follow = get_node("MobSpawnPath/MobSpawnPathFollow")

	camera = get_node("Camera")
	Global.current_screen = "main"
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("HUD/TowerCount").text = "Towers: " + str(Global.ordnance_count)
	get_node("HUD/ResourceCount").text = "Resource: " + str(Global.resource_count)
	
	if Global.current_screen == "main":
		mouse_position = get_viewport().get_mouse_position()
		building_visual_instance.position = mouse_position

		if Input.is_action_just_pressed("create") && Global.ordnance_count != 0:
			mouse_position = get_viewport().get_mouse_position()
			tower_instance = tower_scene.instantiate()
			tower_instance.position = mouse_position
			if !building_visual_instance.is_interfered:
				add_child(tower_instance)
				Global.tower_placement.play()
				Global.ordnance_count -= 1

	if Input.is_action_just_pressed("camera_pan_left"):
		var tween = get_tree().create_tween()
		if Global.current_screen == "main":
			tween.tween_property(camera, "offset", Vector2(-1150, 0), 0.1)
			Global.current_screen = "left"
		elif Global.current_screen == "left":
			pass
		else:
			Global.current_screen = "main"
			tween.tween_property(camera, "offset", Vector2(0, 0), 0.1)
	
	if Input.is_action_just_pressed("camera_pan_right"):
		var tween = get_tree().create_tween()
		if Global.current_screen == "main":
			Global.current_screen = "right"
			tween.tween_property(camera, "offset", Vector2(1150, 0), 0.1)
		elif Global.current_screen == "left":
			Global.current_screen = "main"
			tween.tween_property(camera, "offset", Vector2(0, 0), 0.1)
		else:
			pass
			
func _on_mob_spawn_timer_timeout() -> void:
	mob_instance = mob_scene.instantiate()
	
	random_progress = rng.randf_range(0.0, 1.0)
	mob_spawn_path_follow.progress_ratio = random_progress
	
	mob_instance.position = mob_spawn_path_follow.position
	add_child(mob_instance)
