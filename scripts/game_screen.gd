extends Node2D

var mouse_position

var player_scene = preload("res://scenes/player.tscn")
var player_instance

var building_visual_scene = preload("res://scenes/building_visual.tscn")
var building_visual_instance

var mob_scene = preload("res://scenes/mob.tscn")
var mob_instance
var mob_spawn_path_follow

var rng = RandomNumberGenerator.new()
var random_progress

var building

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	building_visual_instance = building_visual_scene.instantiate()
	add_child(building_visual_instance)
	building = get_node("Building")
	Global.building = building

	mob_spawn_path_follow = get_node("MobSpawnPath/MobSpawnPathFollow")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_position = get_viewport().get_mouse_position()
	building_visual_instance.position = mouse_position

	if Input.is_action_just_pressed("create"):
		mouse_position = get_viewport().get_mouse_position()
		player_instance = player_scene.instantiate()
		player_instance.position = mouse_position
		if !building_visual_instance.is_interfered:
			add_child(player_instance)

func _on_mob_spawn_timer_timeout() -> void:
	mob_instance = mob_scene.instantiate()
	
	random_progress = rng.randf_range(0.0, 1.0)
	mob_spawn_path_follow.progress_ratio = random_progress
	
	mob_instance.position = mob_spawn_path_follow.position
	add_child(mob_instance)
