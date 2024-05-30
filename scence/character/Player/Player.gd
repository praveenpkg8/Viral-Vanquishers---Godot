extends EntityBase
 
@export var speed: int = 600
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var idle_timer = $Timer
var is_idle = false

var direction: Vector2 = Vector2.ZERO

func _ready():
	
	sprite.play("idle-q")

func _physics_process(delta):
	direction = Input.get_vector("left", 'right', "up", "down")
	
	if direction != Vector2.ZERO:
		reset_idle_timer()
		velocity = velocity.lerp(direction * speed, 0.09)
	
	elif direction == Vector2.ZERO:
		check_idle_timer()
		velocity = velocity.lerp(Vector2.ZERO, 0.8)
	
	move_and_slide()
	
func reset_idle_timer():
	is_idle = false
	idle_timer.stop()


func check_idle_timer():
	if not idle_timer.is_stopped():
		return

	idle_timer.start()

func _on_timer_timeout():
	var level = randf_range(1,3)
	var score = randf_range(1,5)
	GlobalSignals.emit_signal('picked_up_collectable', level * score)
