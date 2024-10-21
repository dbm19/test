extends Area2D

var direction
var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = (Global.mob_position - global_position).normalized()
	position += direction * speed * delta
