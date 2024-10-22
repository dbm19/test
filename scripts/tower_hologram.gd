extends Area2D

var tower_range
var visual_sprite
var is_interfered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tower_range = get_node("TowerRange")
	visual_sprite = get_node("TowerHologramSprite")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_interfered:
		tower_range.color = "#bc005452"
	else:
		tower_range.color = "#00ffff52"

func _on_area_entered(area: Area2D) -> void:
	print(area.get_groups())
	if area.is_in_group("allied_structures"):
		is_interfered = true

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("allied_structures"):
		is_interfered = false