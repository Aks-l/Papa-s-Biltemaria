extends CharacterBody2D

class_name player
const SPEED := 300.0
const ROTATION_SPEED := 3.0

func _physics_process(delta: float) -> void:
	var rotation_input := Input.get_action_strength("right") - Input.get_action_strength("left")
	rotation += rotation_input * ROTATION_SPEED * delta
	
	var forward_input := Input.get_action_strength("back") - Input.get_action_strength("forward")
	print(forward_input)
	var direction := Vector2.RIGHT.rotated(rotation)  # Character faces along X-axis by default
	velocity = direction * forward_input * SPEED

	
	
	move_and_slide()

	
