extends CharacterBody2D

@export var is_player_1: bool = true

var ball: RigidBody2D
var direction = 0

const SPEED: int = 400

func _ready() -> void:
	ball = get_parent().get_node("Ball")

func _physics_process(delta: float) -> void:
	if is_player_1:
		direction = get_direction(1)
		position.y += direction * SPEED * delta
	elif Globals.game_mode == Globals.mode.PLAYER_VS_PLAYER and not is_player_1:
		direction = get_direction(2)
		position.y += direction * SPEED * delta
	else:
		# TODO fix perfect ai
		position.y = ball.position.y

func get_direction(player_number: int) -> int:
	return Input.get_axis("player" + str(player_number) + "_up" ,"player" + str(player_number) + "_down")
