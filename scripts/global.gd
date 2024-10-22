extends Node

var building
var mob_spawn
var mob_position

var bullet_sound
var mob_hit
var mob_death

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bullet_sound = get_node("BulletSound")
	mob_hit = get_node("MobHit")
	mob_death = get_node("MobDeath")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
