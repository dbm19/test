extends Area2D

var mouse_hovering
var progress_bar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar = get_node("TextureProgressBar")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_hovering == true:
		if Input.is_action_just_pressed("select"):
			progress_bar.start = true
			Global.building_working.play()

func _on_mouse_entered() -> void:
	mouse_hovering = true

func _on_mouse_exited() -> void:
	mouse_hovering = false