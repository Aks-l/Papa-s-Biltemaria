extends RigidBody2D
class_name holdable

func pick_up(entity: player = null):
	entity.holding = self

func drop(entity: player = null):
	entity.holding = null
