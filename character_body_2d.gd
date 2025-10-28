extends CharacterBody2D

const SPEED := 300.0

func _physics_process(delta: float) -> void:
	var input_vector := Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()

	velocity = input_vector * SPEED

	var collision := move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.slide(collision.get_normal())
		
	if input_vector.x != 0:
			$Sprite2D.flip_h
