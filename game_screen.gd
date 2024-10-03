extends Node2D

var spawn_position
var player_scene = preload("res://player.tscn")
var player_instance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("create"):
		spawn_position = get_viewport().get_mouse_position()
		player_instance = player_scene.instantiate()
		player_instance.position = spawn_position
		add_child(player_instance)
		
