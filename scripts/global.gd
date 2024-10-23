extends Node

var building
var mob_spawn
var mob_position

var bullet_sound
var mob_hit
var mob_death
var building_working
var building_complete

var current_screen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bullet_sound = get_node("BulletSound")
	mob_hit = get_node("MobHit")
	mob_death = get_node("MobDeath")
	building_working = get_node("BuildingWorking")
	building_complete = get_node("BuildingComplete")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
