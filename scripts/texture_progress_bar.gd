extends TextureProgressBar

var start = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if start == true:
		value += 0.1
	
	if value == 100:
		start = false
