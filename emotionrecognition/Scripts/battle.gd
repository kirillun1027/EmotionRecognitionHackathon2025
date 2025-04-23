extends Node2D
#region Variables
@export_group("hit area spawn area")
@export var maxx = 1280
@export var maxy = 720
var hit_area = preload("res://Scenes/hit_area.tscn")
var Hit: Node
var damage: int
var is_allowed: bool
var player_hp: int = 20
var enemy_hp: int = 20
@onready var player: Sprite2D = $Player
signal init(_player_hp: int, _enemy_hp: int)
#endregion

func _ready() -> void:
	init.emit(player_hp, enemy_hp)
func _on_spawntimer_timeout() -> void:
	if(Hit):Hit.queue_free()
	Hit = hit_area.instantiate()
	add_child(Hit)
	Hit.position = Vector2(randf_range(-1 * maxx, maxx), randf_range(-1 * maxy, maxy))
	is_allowed = true;
func _process(delta: float) -> void:
	if (Hit):
		if (Hit.get_damage() > 0 and is_allowed):
			#damage = player.get_atk()
			damage = Hit.get_damage()
			is_allowed = false
		else: 
			damage = 0;
			
func get_damage(): 	return damage
