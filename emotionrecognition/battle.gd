extends Node2D
var maxx = 2560/2
var maxy = 1440/2
var hit_area = preload("res://hit_area.tscn")
var hit
var damage
var allowed
@onready var player: Sprite2D = $Player

func _on_spawntimer_timeout() -> void:
	if(hit):hit.queue_free()
	hit = hit_area.instantiate()
	add_child(hit)
	hit.position = Vector2(randf_range(-1 * maxx, maxx), randf_range(-1 * maxy, maxy))
	allowed = true;
func _process(delta: float) -> void:
	if (hit):
		if (hit.get_damage() > 0 and allowed):
			damage = player.get_atk()
			allowed = false
		else: 
			damage = 0;
			
func get_damage(): 	return damage
