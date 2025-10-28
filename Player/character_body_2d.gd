extends CharacterBody2D

class_name player
const SPEED := 300.0
const ROTATION_SPEED := 3.0

var holding: holdable = null

func _physics_process(delta: float) -> void:
	var rotation_input := Input.get_action_strength("right") - Input.get_action_strength("left")
	rotation += rotation_input * ROTATION_SPEED * delta
	
	var forward_input := Input.get_action_strength("forward") - Input.get_action_strength("back")
	


	var direction := Vector2.RIGHT.rotated(rotation)  # Character faces along X-axis by default
	if forward_input == -1:
		velocity = direction * forward_input * (SPEED / 2)
	else:
		velocity = direction * forward_input * SPEED
	
	move_and_slide()

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		interact_with_target()
	
func interact_with_target():
	if $InteractRayCast2D.is_colliding():
		print("found something")
	
