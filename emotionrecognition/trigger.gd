extends Area2D

@onready var jumpscare = $"../jumpscare"
var battle := preload("res://battle.tscn")

func _on_body_entered(body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://battle.tscn")
