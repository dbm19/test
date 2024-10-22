extends Area2D

var direction
var speed = 100
var hit_points = 2
var mob_sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mob_sprite = get_node("MobSprite")
	Global.mob_spawn = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = (Global.building.global_position - global_position).normalized()
	position += direction * speed * delta
	
	if hit_points == 0:
		queue_free()
		Global.mob_death.play()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		hit_points -= 1
		Global.mob_hit.play()
		area.queue_free()
		mob_sprite.texture = load("res://art/mob_sprite_damaged.png")
		await get_tree().create_timer(0.18).timeout
		mob_sprite.texture = load("res://art/mob_sprite.png")
	elif area.is_in_group("building"):
		self.queue_free()
