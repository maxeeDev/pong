extends CharacterBody2D

@export var is_player_1: bool = true

var ball: RigidBody2D
var direction: int = 0
var ai_target_ypos: float = 100

const SPEED: int = 400

func _ready() -> void:
	ball = get_parent().get_node("Ball")

func _physics_process(delta: float) -> void:
	if is_player_1:
		update_player_position(1, delta)
	elif Globals.game_mode == Globals.mode.PLAYER_VS_PLAYER and not is_player_1:
		update_player_position(2, delta)
	else:
		position.y += get_ai_movement_dir() * SPEED * delta

func update_player_position(player_number: int, delta: float) -> void:
	var direction = Input.get_axis("player" + str(player_number) + "_up" ,"player" + str(player_number) + "_down")
	position.y += direction * SPEED * delta

# helpful video for pong ai: https://www.youtube.com/watch?v=GRgYRvv2mPY

func get_ai_movement_dir() -> int:
	var dist_to_target: float = abs(ai_target_ypos - global_position.y)
	var accuracy_dist: float = 50
	
	ai_target_ypos = ball.global_position.y
	
	if (dist_to_target > accuracy_dist):
		if ai_target_ypos > global_position.y:
			return 1
		else:
			return -1
	else:
		return 0
