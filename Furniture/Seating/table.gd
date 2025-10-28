extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite2D

@export var capacity: int = 4
@export var occupants: int = 0

func _ready():
	pass

func _occupy(entity):
	if capacity == occupants:
		push_error("Table full")
		return
	occupants += 1

func exit(entity):
	occupants -= 1
