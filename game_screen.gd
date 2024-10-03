extends Node2D

var mouse_position

var player_scene = preload("res://player.tscn")
var player_instance

var building_visual_scene = preload("res://building_visual.tscn")
var building_visual_instance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	building_visual_instance = building_visual_scene.instantiate()
	add_child(building_visual_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mouse_position = get_viewport().get_mouse_position()
	building_visual_instance.position = mouse_position

	if Input.is_action_just_pressed("create"):
		mouse_position = get_viewport().get_mouse_position()
		player_instance = player_scene.instantiate()
		player_instance.remove_child(player_instance.get_children()[0])
		player_instance.position = mouse_position
		add_child(player_instance)
		
