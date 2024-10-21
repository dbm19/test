extends Area2D

var direction
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.mob_spawn = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = (Global.building.global_position - global_position).normalized()
	position += direction * speed * delta
	Global.mob_position = position
