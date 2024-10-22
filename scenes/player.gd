extends Node2D

var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("go_up"):
		velocity.y -= 1
	elif Input.is_action_pressed("go_down"):
		velocity.y += 1
	elif Input.is_action_pressed("go_left"):
		velocity.x -= 1
	elif Input.is_action_pressed("go_right"):
		velocity.x += 1
		
	position += speed * velocity * delta
