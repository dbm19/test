extends Node

var building
var mob_spawn
var mob_position
var tower_position

var bullet_sound
var mob_hit
var mob_death
var construction_begin
var construction_complete
var tower_placement
var resource_count

var current_screen
var ordnance_count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bullet_sound = get_node("BulletSound")
	mob_hit = get_node("MobHit")
	mob_death = get_node("MobDeath")
	construction_begin = get_node("ConstructionBegin")
	construction_complete = get_node("ConstructionComplete")
	tower_placement = get_node("TowerPlacement")
	resource_count = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
