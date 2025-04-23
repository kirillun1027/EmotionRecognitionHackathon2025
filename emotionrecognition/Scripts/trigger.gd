extends Area2D

var battle_path := "res://Scenes/battle.tscn"

func _on_body_entered(body: Node2D) -> void:
	if (body is CharacterBody2D):
		call_deferred(go_to_battle())
func go_to_battle():
	get_tree().change_scene_to_file(battle_path)
