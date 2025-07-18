extends CharacterBody2D

@export var is_player_1: bool = true

const SPEED = 400

func _physics_process(delta: float) -> void:
	var input_direction = 0
	
	if is_player_1:
		if Input.is_action_pressed("player1_down"):
			input_direction = 1
		elif Input.is_action_pressed("player1_up"):
			input_direction = -1
	else:
		if Input.is_action_pressed("player2_down"):
			input_direction = 1
		elif Input.is_action_pressed("player2_up"):
			input_direction = -1
	
	position.y += input_direction * SPEED * delta
