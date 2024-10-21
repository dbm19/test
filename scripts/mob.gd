extends Area2D

var direction
var speed = 100
var hit_points = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.mob_spawn = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = (Global.building.global_position - global_position).normalized()
	position += direction * speed * delta
	
	if hit_points == 0:
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	print("what")
	if area.is_in_group("bullet"):
		hit_points -= 1
		area.queue_free()
