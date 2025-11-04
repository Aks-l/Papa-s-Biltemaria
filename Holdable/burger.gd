extends holdable

@onready var texture = $Texture.texture

func take_item(player: CharacterBody2D):
	player.receive_item(texture,self)
	get_parent().remove_child(self)
