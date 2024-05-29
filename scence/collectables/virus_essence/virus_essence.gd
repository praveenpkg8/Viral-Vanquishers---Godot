extends CollectableBase

var grade_level: float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play('default')
	grade_level = randf_range(0, 3)
	

func _on_on_player_interact(col_value):
	GlobalSignals.emit_signal('picked_up_collectable', col_value * grade_level)
	queue_free()
