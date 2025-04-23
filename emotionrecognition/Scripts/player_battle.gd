extends Sprite2D
var player_hp: int = 100
var enemy_hp: int = 100
var atke = 5
var atk = 5
var hit_area = preload("res://Scenes/hit_area.tscn")
var win_scene_path = "res://Scenes/win_scene.tscn"
var game_over_screen_path = "res://Scenes/game_over_screen.tscn"
signal EnemyUpdate(hp: int)
signal PlayerUpdate(hp: int)

func _on_timer_timeout() -> void:
	player_hp -= atke
	PlayerUpdate.emit(player_hp)

func _process(delta: float) -> void:
	if (player_hp <= 0): lose();
	if (enemy_hp <= 0): win();
	if(get_parent().get_damage()): 
		enemy_hp -= get_parent().get_damage()
		EnemyUpdate.emit(enemy_hp)
func get_atk(): 	return atk;
func win():
	get_tree().change_scene_to_file(win_scene_path)
func lose():
	get_tree().change_scene_to_file(game_over_screen_path)


func _on_battle_init(_player_hp: int, _enemy_hp: int) -> void:
	player_hp = _player_hp
	enemy_hp = _enemy_hp
