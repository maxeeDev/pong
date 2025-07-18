extends RigidBody2D


func _on_outside_area_left_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		print("Player2 scored!")

func _on_outside_area_right_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		print("Player1 scored!")
