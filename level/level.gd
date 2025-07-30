extends Node2D

const INITIAL_BALL_POSITION: Vector2 = Vector2(576,324)
const VELOCITY_MULTIPLIER: float = 1.04

var player1_score: int = 0
var player2_score: int = 0 

func _on_outside_area_left_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		player2_score += 1
		$Player2Score.text = str(player2_score)
		$Ball.should_reset = true
		$Ball.linear_velocity = $Ball.INITIAL_LINEAR_VELOCITY
		$BallMovementLine2D.clear_points()
		
func _on_outside_area_right_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		player1_score += 1
		$Player1Score.text = str(player1_score)
		$Ball.should_reset = true
		$Ball.linear_velocity = $Ball.INITIAL_LINEAR_VELOCITY
		$BallMovementLine2D.clear_points()


func update_l2d(points: Array[Vector2]):
	$BallMovementLine2D.clear_points()
	$BallMovementLine2D.global_position = $Ball.global_position
	
	for point in points:
		var localized_point = $BallMovementLine2D.to_local(point)
		$BallMovementLine2D.add_point(localized_point)


func _on_divider_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		$Ball.linear_velocity *= VELOCITY_MULTIPLIER
