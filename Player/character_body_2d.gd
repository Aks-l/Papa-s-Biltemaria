extends CharacterBody2D

class_name player
const SPEED := 300.0
const ROTATION_SPEED := 3.0

@onready var raycast = $InteractRayCast2D
@onready var empty_item = $CanvasLayer/TextureRect
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
	if Input.is_action_just_pressed("pickup"):
		print(holding)
		if holding == null:
			pickup_target()
		else:
			print("drop")
			drop_item()
	
		
func interact_with_target():
	if $InteractRayCast2D.is_colliding():
		var collider = raycast.get_collider()
		if collider.has_method("interact"):
			print("found something")
			collider.interact(self)
			
func pickup_target():
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.has_method("take_item"):
			print("taken something")
			collider.take_item(self)
			
func receive_item(texture: Texture2D,item):
	holding = item
	$CanvasLayer/TextureRect.texture = texture

	
func reset_holdable():
	holding = null
	$CanvasLayer/TextureRect.texture = empty_item

func drop_item():

	if holding == null:
		return 
		
	get_tree().current_scene.add_child(holding)
	holding.global_position = raycast.to_global(raycast.target_position)
	reset_holdable()
	

	
			
		
