extends RigidBody2D

var should_reset: bool = false

const INITIAL_POSITION: Vector2 = Vector2(576, 324)
const INITIAL_LINEAR_VELOCITY: Vector2 = Vector2(550, 250)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if should_reset:
		var next_transform = state.get_transform()
		
		next_transform.origin = INITIAL_POSITION
		
		state.set_transform(next_transform)
		
		should_reset = false
