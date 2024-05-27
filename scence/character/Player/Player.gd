extends "res://scence/character/EntityBase.gd"
 
@export var speed: int = 600
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var direction: Vector2 = Vector2.ZERO

func _ready():
	sprite.play("idle-q")

func _physics_process(delta):
	direction = Input.get_vector("left", 'right', "up", "down")
	
	if direction != Vector2.ZERO:
		velocity = velocity.lerp(direction * speed, 0.09)
	
	elif direction == Vector2.ZERO:
		velocity = velocity.lerp(Vector2.ZERO, 0.8)
	
	move_and_slide()
	
