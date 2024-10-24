extends Area2D

var speed = 400
var boost_timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	boost_timer = get_node("BoostTimer")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("go_up"):
		velocity.y -= 1
	if Input.is_action_pressed("go_down"):
		velocity.y += 1
	if Input.is_action_pressed("go_left"):
		velocity.x -= 1
	if Input.is_action_pressed("go_right"):
		velocity.x += 1
	
	if Input.is_action_pressed("boost"):
		speed = 800
		boost_timer.start()

	position += speed * velocity.normalized() * delta

func _on_boost_timer_timeout() -> void:
	speed = 400


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("resource"):
		Global.resource_count += 1
		area.queue_free()
