extends Area2D

var damage = 0;
var is_mouse_entered = false
var allowed = false

func _on_mouse_entered() -> void: 
	is_mouse_entered = true
	
func _on_mouse_exited() -> void: 
	is_mouse_entered = false
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("hit") and is_mouse_entered):
		damage = 5
		print("f")
func get_damage(): return damage;
