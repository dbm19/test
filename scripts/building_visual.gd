extends Area2D

var player_range
var visual_sprite
var is_interfered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_range = get_node("PlayerRange")
	visual_sprite = get_node("BuildingVisualSprite")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_interfered:
		player_range.color = "#bc005452"
	else:
		player_range.color = "#00ffff52"

func _on_area_entered(area: Area2D) -> void:
	is_interfered = true

func _on_area_exited(area: Area2D) -> void:
	is_interfered = false
