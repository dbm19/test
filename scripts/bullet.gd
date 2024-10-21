extends Area2D

var direction = null
var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("bullet")
	
	if Global.mob_position:
		direction = (Global.mob_position - global_position).normalized()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		position += direction * speed * delta


func _on_shoot_timer_timeout() -> void:
	pass # Replace with function body.

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
