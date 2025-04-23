extends Node

var player_hp
var enemy_hp

func _process(delta: float) -> void:
	$HPP.text = str(player_hp)
	$HPE.text = str(enemy_hp)


func on_enemy_update(hp: int) -> void:
	enemy_hp = hp


func _on_player_update(hp: int) -> void:
	player_hp = hp


func _on_battle_init(_player_hp: int, _enemy_hp: int) -> void:
	player_hp = _player_hp
	enemy_hp = _enemy_hp
