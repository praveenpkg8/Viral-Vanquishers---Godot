extends "res://scence/collectables/collectable_base.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play('default')

func _on_on_player_interact():
	GlobalSignals.emit_signal('picked_up_collectable', collectable_value)
	queue_free()
