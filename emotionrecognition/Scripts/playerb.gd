extends Sprite2D

var hp = 20
var hpe = 20
var atke = 5
var atk = 5
var hit_area = preload("res://Scenes/hit_area.tscn")
var win_scene_path = "res://Scenes/win_scene.tscn"
var game_over_screen_path = "res://Scenes/game_over_screen.tscn"

func _on_timer_timeout() -> void:
	hp -= atke

func _process(delta: float) -> void:
	$HPP.text = str(hp)
	$HPE.text = str(hpe)
	if (hp <= 0): lose();
	if (hpe <= 0): win();
	if(get_parent().get_damage()): 
		hpe -= get_parent().get_damage()
		print("f")
func get_atk(): 	return atk;
func win():
	get_tree().change_scene_to_file(win_scene_path)
func lose():
	get_tree().change_scene_to_file("res://game_over_screen.tscn")
