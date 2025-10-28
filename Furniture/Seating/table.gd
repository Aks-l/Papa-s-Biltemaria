extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite2D

@export var capacity: int = 4
@export var occupants: int = 0

func _ready():
	pass

func interact(entity):
	if entity.holding: place_item(entity)
	else: _occupy(entity)

func _occupy(entity):
	if capacity == occupants:
		push_error("Table full")
		return
	occupants += 1

func exit(entity):
	occupants -= 1

func place_item(entity):
	
	pass
