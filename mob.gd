extends Area2D

var building
var direction
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	building = get_node("../Building")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = (building.global_position - global_position).normalized()
	position += direction * speed * delta
