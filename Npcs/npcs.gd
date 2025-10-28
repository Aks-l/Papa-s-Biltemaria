extends CharacterBody2D

const SPEED := 150.0
const MOVE_RADIUS := 200.0     # how far from current position the NPC can wander
const WAIT_TIME := 5.0 

var target_position: Vector2
var moving := false

func _ready() -> void:
	_wander
	
func _wander() -> void:
	while true:
		# Wait before picking a new destination
		await get_tree().create_timer(WAIT_TIME).timeout

		# Pick a random point near current position
		var angle := randf_range(0, TAU)
		var distance := randf_range(50, MOVE_RADIUS)
		target_position = global_position + Vector2(cos(angle), sin(angle)) * distance

		moving = true

		# Move toward that spot until close enough
		while moving:
			var to_target := target_position - global_position
			if to_target.length() < 10.0:
				moving = false
				break

			var direction := to_target.normalized()
			velocity = direction * SPEED
			move_and_slide()
			await get_tree().process_frame
