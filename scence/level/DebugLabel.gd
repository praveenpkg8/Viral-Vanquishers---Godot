extends Label

var current_score: int = 0

func _ready():
	GlobalSignals.connect('picked_up_collectable', add_points)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_points(val: float):
	current_score += 1
	print(current_score)
	self.text = 'Current Score: '+str(current_score)
