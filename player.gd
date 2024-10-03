extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("go_left", "go_right", "go_up", "go_down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
