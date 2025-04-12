extends Sprite2D

var hp = 20
var hpe = 20
var atke = 5
var atk = 5
var hit_area = preload("res://hit_area.tscn")

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
	get_tree().change_scene_to_file("res://win_scene.tscn")
func lose():
	get_tree().change_scene_to_file("res://game_over_screen.tscn")
