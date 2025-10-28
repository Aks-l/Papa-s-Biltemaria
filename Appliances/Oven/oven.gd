extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite2D

@export var busy: bool = false
@export var occupying_item = null

func _ready():
	pass

func interact(entity: player):
	if entity.holding: leave_item(entity)
	elif busy: take_item(entity)

func leave_item(entity: player):
	busy = true
	occupying_item = entity.holding
	entity.holding = null

func take_item(entity:player):
	entity.holding = occupying_item
	occupying_item = null
	
