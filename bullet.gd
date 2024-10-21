extends Area2D

var direction
var speed = 200
var huh

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("bullet")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if huh == true:
		direction = (Global.mob_position - global_position).normalized()
		position += direction * speed * delta


func _on_shoot_timer_timeout() -> void:
	pass # Replace with function body.
