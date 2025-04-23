extends CharacterBody2D

@export var SPEED = 150
var acc = 10
var direction: Vector2;


func _physics_process(delta: float) -> void:
	direction = Vector2.ZERO
	if Input.is_action_pressed("wright"):
		direction.x += 1
	if Input.is_action_pressed("wleft"):
		direction.x += -1
	if Input.is_action_pressed("wup"):
		direction.y += -1
	if Input.is_action_pressed("wdown"):
		direction.y += 1
	velocity = vector_move_toward(velocity, direction * SPEED, acc)
	move_and_slide()
func vector_move_toward(from: Vector2, to: Vector2, delta: float):
	return Vector2(move_toward(velocity.x, direction.x * SPEED, acc),move_toward(velocity.y, direction.y * SPEED, acc))
