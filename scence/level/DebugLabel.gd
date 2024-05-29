extends Label

var current_score: float = 0

func _ready():
	GlobalSignals.connect('picked_up_collectable', add_points)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_points(val: float):
	current_score += val
	print("cur", [current_score, val])
	self.text = 'Current Score: '+str(current_score)
