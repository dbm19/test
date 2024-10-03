extends Area2D

var player
var direction
var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("../Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = (player.global_position - global_position).normalized()
	position += direction * speed * delta
