extends Area2D

signal on_player_interact

@onready var sprite:AnimatedSprite2D = $AnimatedSprite2D

@export var collectable_value: float = 1.00

func _on_body_entered(body: CharacterBody2D):
	if body.is_in_group("Player"):
		emit_signal("on_player_interact")
